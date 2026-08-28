# 프로젝트·Base 라우팅 계약과 생성 뷰의 무결성을 검증한다.
[CmdletBinding()]
param(
    [string]$BaseRoot = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Get-Sha256Hex {
    param([byte[]]$Bytes)

    $hasher = [System.Security.Cryptography.SHA256]::Create()
    try {
        return ([System.BitConverter]::ToString($hasher.ComputeHash($Bytes))).Replace("-", "").ToLowerInvariant()
    }
    finally {
        $hasher.Dispose()
    }
}

function Get-GitBlobBytes {
    param(
        [string]$Repository,
        [string]$RevisionAndPath
    )

    $startInfo = [System.Diagnostics.ProcessStartInfo]::new()
    $startInfo.FileName = "git"
    $startInfo.UseShellExecute = $false
    $startInfo.RedirectStandardOutput = $true
    $startInfo.RedirectStandardError = $true
    [void]$startInfo.ArgumentList.Add("-C")
    [void]$startInfo.ArgumentList.Add($Repository)
    [void]$startInfo.ArgumentList.Add("cat-file")
    [void]$startInfo.ArgumentList.Add("blob")
    [void]$startInfo.ArgumentList.Add($RevisionAndPath)

    $process = [System.Diagnostics.Process]::new()
    $process.StartInfo = $startInfo
    [void]$process.Start()
    $buffer = [System.IO.MemoryStream]::new()
    try {
        $process.StandardOutput.BaseStream.CopyTo($buffer)
        $stderr = $process.StandardError.ReadToEnd()
        $process.WaitForExit()
        if ($process.ExitCode -ne 0) {
            throw "git cat-file failed for ${RevisionAndPath}: $stderr"
        }
        return $buffer.ToArray()
    }
    finally {
        $buffer.Dispose()
        $process.Dispose()
    }
}

function Assert-PathExists {
    param(
        [string]$Path,
        [string]$Description
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        throw "$Description is missing: $Path"
    }
}

$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..\..\..")).Path
if ([string]::IsNullOrWhiteSpace($BaseRoot)) {
    $searchRoot = $projectRoot
    while ($true) {
        $searchRoot = Split-Path -Parent $searchRoot
        if ([string]::IsNullOrWhiteSpace($searchRoot)) {
            throw "Base checkout was not found. Pass -BaseRoot explicitly."
        }
        $candidate = Join-Path $searchRoot "Base"
        if (Test-Path -LiteralPath $candidate) {
            $BaseRoot = $candidate
            break
        }
    }
}
$BaseRoot = (Resolve-Path -LiteralPath $BaseRoot).Path

$adapterPath = Join-Path $projectRoot "skills\PROJECT_BASE_ADAPTER.json"
$snapshotPath = Join-Path $projectRoot "skills\PROJECT_SKILL_SNAPSHOT.json"
$registryPath = Join-Path $projectRoot "skills\SKILL_REGISTRY.json"
$generatorPath = Join-Path $projectRoot "tools\generate_project_operating_views.py"
foreach ($path in @($adapterPath, $snapshotPath, $registryPath, $generatorPath)) {
    Assert-PathExists -Path $path -Description "Required project contract artifact"
}

$adapterText = [System.IO.File]::ReadAllText($adapterPath)
$snapshotText = [System.IO.File]::ReadAllText($snapshotPath)
$adapter = $adapterText | ConvertFrom-Json
$snapshot = $snapshotText | ConvertFrom-Json

if ($adapter.artifact_role -ne "PROJECT_BASE_ADAPTER") {
    throw "PROJECT_BASE_ADAPTER artifact_role is invalid."
}
if ($snapshot.artifact_role -ne "PROJECT_SKILL_SNAPSHOT") {
    throw "PROJECT_SKILL_SNAPSHOT artifact_role is invalid."
}

$normalizedRegistryText = ([System.IO.File]::ReadAllText($registryPath)).Replace("`r`n", "`n").Replace("`r", "`n")
$projectRegistryHash = Get-Sha256Hex -Bytes ([System.Text.Encoding]::UTF8.GetBytes($normalizedRegistryText))
if ($projectRegistryHash -ne $adapter.project_registry.sha256) {
    throw "Project registry hash mismatch: expected=$($adapter.project_registry.sha256) actual=$projectRegistryHash"
}

$normalizedAdapterText = $adapterText.Replace("`r`n", "`n").Replace("`r", "`n")
$adapterHash = Get-Sha256Hex -Bytes ([System.Text.Encoding]::UTF8.GetBytes($normalizedAdapterText))
if ($adapterHash -ne $snapshot.canonical_source_sha256) {
    throw "Snapshot adapter hash mismatch: expected=$($snapshot.canonical_source_sha256) actual=$adapterHash"
}

$originMain = (& git -C $BaseRoot rev-parse refs/remotes/origin/main).Trim()
if ($LASTEXITCODE -ne 0) {
    throw "Base origin/main cannot be resolved. Fetch Base before routing."
}
foreach ($commit in @(
    [string]$adapter.base_release.release_commit,
    [string]$adapter.base_release.release_evidence_commit,
    [string]$adapter.base_release.finalization_commit
)) {
    & git -C $BaseRoot merge-base --is-ancestor $commit $originMain
    if ($LASTEXITCODE -ne 0) {
        throw "Pinned Base commit is not an ancestor of Base origin/main: $commit"
    }
}

$baseRegistryBytes = Get-GitBlobBytes -Repository $BaseRoot -RevisionAndPath "$($adapter.base_release.release_commit):$($adapter.base_release.registry_path)"
$baseRegistryHash = Get-Sha256Hex -Bytes $baseRegistryBytes
if ($baseRegistryHash -ne $adapter.base_release.registry_sha256) {
    throw "Base registry hash mismatch: expected=$($adapter.base_release.registry_sha256) actual=$baseRegistryHash"
}

$routeIds = @{}
foreach ($route in @($adapter.routing.base_routes)) {
    $routeIds[[string]$route.route_id] = "BASE_SHARED"
    Assert-PathExists -Path (Join-Path $BaseRoot ("skills\{0}\SKILL.md" -f $route.skill_id)) -Description "Base route $($route.route_id)"
}
foreach ($route in @($adapter.routing.project_routes)) {
    $routeIds[[string]$route.route_id] = "PROJECT_LOCAL"
    Assert-PathExists -Path (Join-Path $projectRoot ("skills\{0}\SKILL.md" -f $route.skill_id)) -Description "Project route $($route.route_id)"
}

$snapshotRouteIds = @($snapshot.effective_routes.psobject.Properties.Name | Sort-Object)
$adapterRouteIds = @($routeIds.Keys | Sort-Object)
if (@(Compare-Object -ReferenceObject $adapterRouteIds -DifferenceObject $snapshotRouteIds).Count -ne 0) {
    throw "Snapshot effective routes do not match adapter routes."
}

& python $generatorPath --check
if ($LASTEXITCODE -ne 0) {
    throw "Generated operating views have drifted from PROJECT_BASE_ADAPTER.json."
}

[pscustomobject]@{
    status = "OPERATING_CONTRACT_VALID"
    project_root = $projectRoot
    base_origin_main = $originMain
    base_release = [string]$adapter.base_release.version
    route_count = $adapterRouteIds.Count
    generated_views = "CURRENT"
} | ConvertTo-Json -Compress
