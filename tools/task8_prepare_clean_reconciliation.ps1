[CmdletBinding()]
param(
    [string]$Repo = 'C:\Users\user\Documents\GitHub\Ninza\GRIMOIRE-',
    [Parameter(Mandatory = $true)]
    [string]$SnapshotRoot,
    [Parameter(Mandatory = $true)]
    [ValidatePattern('^[0-9a-f]{40}$')]
    [string]$ExpectedMain,
    [Parameter(Mandatory = $true)]
    [string]$ReconciliationPath,
    [string]$ReconciliationBranch = 'recovery/task8-reconcile-20260824',
    [ValidatePattern('^[0-9a-f]{40}$')]
    [string]$ExpectedPrimaryHead = '8c611f601aa98397ed1558e92ab207e0e8347a9b',
    [ValidatePattern('^[0-9a-f]{40}$')]
    [string]$ExpectedSecondaryHead = 'fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f',
    [switch]$FixtureIdentityOverride
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$env:GIT_OPTIONAL_LOCKS = '0'

$PrimaryBranch = 'feat/task8-spell-use-screen-v2'
$SecondaryBranch = 'task8/spell-use-screen'
$DefaultPrimaryHead = '8c611f601aa98397ed1558e92ab207e0e8347a9b'
$DefaultSecondaryHead = 'fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f'
$ExpectedOrigin = 'https://github.com/alsdmlals4-eng/GRIMOIRE-'

function Stop-WithCode {
    param([string]$Code)
    [Console]::Error.WriteLine($Code)
    exit 2
}

$OverrideRequested = ($ExpectedPrimaryHead -ne $DefaultPrimaryHead) -or ($ExpectedSecondaryHead -ne $DefaultSecondaryHead)
if ($OverrideRequested) {
    $FixtureGate = $FixtureIdentityOverride.IsPresent -and ($env:CI -eq 'true') -and ($env:TASK8_RECONCILIATION_FIXTURE -eq '1')
    if (-not $FixtureGate) { Stop-WithCode -Code 'IDENTITY_OVERRIDE_FORBIDDEN' }
}

function Normalize-PathKey {
    param([string]$Path)
    $Full = [System.IO.Path]::GetFullPath($Path)
    $Normalized = ($Full -replace '\\', '/').TrimEnd('/')
    if ($env:OS -eq 'Windows_NT') { return $Normalized.ToLowerInvariant() }
    return $Normalized
}

function Test-PathInside {
    param([string]$Candidate, [string]$Parent)
    $CandidateKey = Normalize-PathKey -Path $Candidate
    $ParentKey = Normalize-PathKey -Path $Parent
    return ($CandidateKey -eq $ParentKey) -or $CandidateKey.StartsWith($ParentKey + '/')
}

function Invoke-GitText {
    param([string]$WorkingDirectory, [string[]]$Arguments)
    Push-Location $WorkingDirectory
    try {
        $Output = @(& git @Arguments 2>$null)
        if ($LASTEXITCODE -ne 0) { Stop-WithCode -Code 'GIT_READ_FAILED' }
        return @($Output | ForEach-Object { "$_" })
    }
    finally { Pop-Location }
}

function Get-GitOne {
    param([string]$WorkingDirectory, [string[]]$Arguments)
    $Value = @(Invoke-GitText -WorkingDirectory $WorkingDirectory -Arguments $Arguments)
    if ($Value.Count -ne 1) { Stop-WithCode -Code 'GIT_IDENTITY_UNAVAILABLE' }
    return $Value[0].Trim()
}

function Assert-SnapshotManifest {
    param([string]$Root, [string]$Role, [string]$ExpectedBranch, [string]$ExpectedHead)

    $RoleRoot = Join-Path $Root $Role
    $ManifestPath = Join-Path $RoleRoot 'manifest.json'
    if (-not (Test-Path -LiteralPath $ManifestPath -PathType Leaf)) { Stop-WithCode -Code 'PRESERVATION_MANIFEST_MISSING' }

    $Manifest = Get-Content -LiteralPath $ManifestPath -Raw -Encoding UTF8 | ConvertFrom-Json
    if ("$($Manifest.branch)" -ne $ExpectedBranch -or "$($Manifest.head)" -ne $ExpectedHead) {
        Stop-WithCode -Code 'PRESERVATION_IDENTITY_MISMATCH'
    }

    foreach ($Entry in @($Manifest.copied_files)) {
        if ($null -eq $Entry) { continue }
        $Relative = "$($Entry.path)"
        $ExpectedHash = "$($Entry.sha256)".ToLowerInvariant()
        if ([string]::IsNullOrWhiteSpace($Relative) -or [string]::IsNullOrWhiteSpace($ExpectedHash)) {
            Stop-WithCode -Code 'PRESERVATION_MANIFEST_INVALID'
        }
        $CopyPath = Join-Path (Join-Path $RoleRoot 'files') $Relative
        if (-not (Test-Path -LiteralPath $CopyPath -PathType Leaf)) { Stop-WithCode -Code 'PRESERVED_FILE_MISSING' }
        $ActualHash = (Get-FileHash -LiteralPath $CopyPath -Algorithm SHA256).Hash.ToLowerInvariant()
        if ($ActualHash -ne $ExpectedHash) { Stop-WithCode -Code 'PRESERVED_FILE_HASH_MISMATCH' }
    }

    return [ordered]@{ role = $Role; branch = $ExpectedBranch; head = $ExpectedHead; manifest = $ManifestPath }
}

$ResolvedRepo = (Resolve-Path -LiteralPath $Repo -ErrorAction Stop).Path
if (-not (Test-Path -LiteralPath (Join-Path $ResolvedRepo '.git'))) { Stop-WithCode -Code 'EXPECTED_REPOSITORY_MARKER_MISSING' }
if (-not (Test-Path -LiteralPath (Join-Path $ResolvedRepo 'project.godot') -PathType Leaf)) { Stop-WithCode -Code 'EXPECTED_PROJECT_MARKER_MISSING' }

$ResolvedSnapshot = (Resolve-Path -LiteralPath $SnapshotRoot -ErrorAction Stop).Path
if (Test-PathInside -Candidate $ResolvedSnapshot -Parent $ResolvedRepo) { Stop-WithCode -Code 'SNAPSHOT_INSIDE_REPOSITORY_FORBIDDEN' }

$ReconciliationFull = [System.IO.Path]::GetFullPath($ReconciliationPath)
if (Test-PathInside -Candidate $ReconciliationFull -Parent $ResolvedRepo) { Stop-WithCode -Code 'RECONCILIATION_PATH_INSIDE_REPOSITORY_FORBIDDEN' }
if (Test-Path -LiteralPath $ReconciliationFull) { Stop-WithCode -Code 'RECONCILIATION_PATH_ALREADY_EXISTS' }

$PrimaryReceipt = Assert-SnapshotManifest -Root $ResolvedSnapshot -Role 'primary_v2' -ExpectedBranch $PrimaryBranch -ExpectedHead $ExpectedPrimaryHead
$SecondaryReceipt = Assert-SnapshotManifest -Root $ResolvedSnapshot -Role 'secondary_original' -ExpectedBranch $SecondaryBranch -ExpectedHead $ExpectedSecondaryHead

$PrimaryRef = Get-GitOne -WorkingDirectory $ResolvedRepo -Arguments @('rev-parse', "refs/heads/$PrimaryBranch")
$SecondaryRef = Get-GitOne -WorkingDirectory $ResolvedRepo -Arguments @('rev-parse', "refs/heads/$SecondaryBranch")
if ($PrimaryRef -ne $ExpectedPrimaryHead -or $SecondaryRef -ne $ExpectedSecondaryHead) { Stop-WithCode -Code 'HISTORICAL_BRANCH_IDENTITY_CHANGED' }

$Origin = Get-GitOne -WorkingDirectory $ResolvedRepo -Arguments @('remote', 'get-url', 'origin')
if (-not $FixtureIdentityOverride.IsPresent -and $Origin.TrimEnd('/') -ne $ExpectedOrigin.TrimEnd('/')) { Stop-WithCode -Code 'ORIGIN_IDENTITY_MISMATCH' }

Push-Location $ResolvedRepo
try {
    # git fetch is the only source-repository synchronization action in this tool.
    $FetchOutput = @(& git fetch --prune origin 2>&1)
    $FetchExit = $LASTEXITCODE
    if ($FetchExit -ne 0) { Stop-WithCode -Code 'ORIGIN_FETCH_FAILED' }
}
finally { Pop-Location }

$OriginMain = Get-GitOne -WorkingDirectory $ResolvedRepo -Arguments @('rev-parse', 'refs/remotes/origin/main')
if ($OriginMain -ne $ExpectedMain) { Stop-WithCode -Code 'ORIGIN_MAIN_SHA_MISMATCH' }

Push-Location $ResolvedRepo
try {
    & git show-ref --verify --quiet "refs/heads/$ReconciliationBranch"
    $BranchExit = $LASTEXITCODE
}
finally { Pop-Location }
if ($BranchExit -eq 0) { Stop-WithCode -Code 'RECONCILIATION_BRANCH_ALREADY_EXISTS' }
if ($BranchExit -ne 1) { Stop-WithCode -Code 'RECONCILIATION_BRANCH_CHECK_FAILED' }

$Parent = Split-Path -Parent $ReconciliationFull
if (-not (Test-Path -LiteralPath $Parent -PathType Container)) { New-Item -ItemType Directory -Path $Parent | Out-Null }

Push-Location $ResolvedRepo
try {
    $WorktreeOutput = @(& git worktree add -b $ReconciliationBranch $ReconciliationFull 'origin/main' 2>&1)
    $WorktreeExit = $LASTEXITCODE
    if ($WorktreeExit -ne 0) { Stop-WithCode -Code 'RECONCILIATION_WORKTREE_CREATE_FAILED' }
}
finally { Pop-Location }

$NewHead = Get-GitOne -WorkingDirectory $ReconciliationFull -Arguments @('rev-parse', 'HEAD')
$NewBranch = Get-GitOne -WorkingDirectory $ReconciliationFull -Arguments @('branch', '--show-current')
$NewStatus = @(Invoke-GitText -WorkingDirectory $ReconciliationFull -Arguments @('status', '--porcelain=v1', '--untracked-files=all'))
if ($NewHead -ne $ExpectedMain -or $NewBranch -ne $ReconciliationBranch) { Stop-WithCode -Code 'RECONCILIATION_IDENTITY_MISMATCH' }
if (($NewStatus -join "`n").Trim().Length -ne 0) { Stop-WithCode -Code 'RECONCILIATION_WORKTREE_NOT_CLEAN' }
if (-not (Test-Path -LiteralPath (Join-Path $ReconciliationFull 'project.godot') -PathType Leaf)) { Stop-WithCode -Code 'RECONCILIATION_PROJECT_MARKER_MISSING' }

$Receipt = [ordered]@{
    schema_version = 1
    status = 'TASK8_CLEAN_RECONCILIATION_WORKTREE_READY'
    repository = $ResolvedRepo
    snapshot_root = $ResolvedSnapshot
    expected_main = $ExpectedMain
    origin_main = $OriginMain
    reconciliation_path = $ReconciliationFull
    branch = $NewBranch
    head = $NewHead
    clean = $true
    project_godot_present = $true
    preserved_candidates = @($PrimaryReceipt, $SecondaryReceipt)
    historical_worktrees_mutated = $false
}

$Receipt | ConvertTo-Json -Depth 8
