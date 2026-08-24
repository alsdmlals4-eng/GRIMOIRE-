[CmdletBinding()]
param(
    [string]$Repo = 'C:\Users\user\Documents\GitHub\Ninza\GRIMOIRE-',
    [Parameter(Mandatory = $true)]
    [string]$DestinationRoot,
    [string]$ExpectedPrimaryHead = '8c611f601aa98397ed1558e92ab207e0e8347a9b',
    [string]$ExpectedSecondaryHead = 'fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$env:GIT_OPTIONAL_LOCKS = '0'

$PrimaryBranch = 'feat/task8-spell-use-screen-v2'
$SecondaryBranch = 'task8/spell-use-screen'
$PrimaryRelative = '.worktrees/task8-spell-use-screen-v2'
$SecondaryRelative = '.worktrees/task8-spell-use-screen'
$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)

function Stop-WithCode {
    param([string]$Code)
    [Console]::Error.WriteLine($Code)
    exit 2
}

function Normalize-PathKey {
    param([string]$Path)

    $Full = [System.IO.Path]::GetFullPath($Path)
    $Normalized = ($Full -replace '\\', '/').TrimEnd('/')
    if ($env:OS -eq 'Windows_NT') {
        return $Normalized.ToLowerInvariant()
    }
    return $Normalized
}

function Test-PathInside {
    param(
        [string]$Candidate,
        [string]$Parent
    )

    $CandidateKey = Normalize-PathKey -Path $Candidate
    $ParentKey = Normalize-PathKey -Path $Parent
    return ($CandidateKey -eq $ParentKey) -or $CandidateKey.StartsWith($ParentKey + '/')
}

function Convert-Lines {
    param([object[]]$Value)
    return @($Value | ForEach-Object { "$_" } | Where-Object { $_ -ne '' })
}

function Invoke-GitText {
    param(
        [string]$WorkingDirectory,
        [string[]]$Arguments
    )

    Push-Location $WorkingDirectory
    try {
        $Output = @(& git @Arguments 2>$null)
        if ($LASTEXITCODE -ne 0) {
            Stop-WithCode -Code 'GIT_READ_FAILED'
        }
        return @(Convert-Lines -Value $Output)
    }
    finally {
        Pop-Location
    }
}

function Get-IndexHash {
    param([string]$WorkingDirectory)

    $Raw = @(Invoke-GitText -WorkingDirectory $WorkingDirectory -Arguments @('rev-parse', '--git-path', 'index'))
    if ($Raw.Count -ne 1) {
        Stop-WithCode -Code 'INDEX_PATH_UNAVAILABLE'
    }
    $IndexPath = $Raw[0]
    if (-not [System.IO.Path]::IsPathRooted($IndexPath)) {
        $IndexPath = Join-Path $WorkingDirectory $IndexPath
    }
    if (-not (Test-Path -LiteralPath $IndexPath -PathType Leaf)) {
        Stop-WithCode -Code 'INDEX_PATH_UNAVAILABLE'
    }
    return (Get-FileHash -LiteralPath $IndexPath -Algorithm SHA256).Hash.ToLowerInvariant()
}

function Get-CandidateFingerprint {
    param([string]$Path)

    $Branch = @(Invoke-GitText -WorkingDirectory $Path -Arguments @('branch', '--show-current'))
    $Head = @(Invoke-GitText -WorkingDirectory $Path -Arguments @('rev-parse', 'HEAD'))
    $Status = @(Invoke-GitText -WorkingDirectory $Path -Arguments @('status', '--porcelain=v1', '--untracked-files=all'))
    if ($Branch.Count -ne 1 -or $Head.Count -ne 1) {
        Stop-WithCode -Code 'CANDIDATE_IDENTITY_UNAVAILABLE'
    }

    return [ordered]@{
        branch = $Branch[0]
        head = $Head[0]
        status = @($Status)
        index_sha256 = Get-IndexHash -WorkingDirectory $Path
    }
}

function Assert-CandidateIdentity {
    param(
        [string]$Path,
        [string]$ExpectedBranch,
        [string]$ExpectedHead
    )

    if (-not (Test-Path -LiteralPath $Path -PathType Container)) {
        Stop-WithCode -Code 'CANDIDATE_MISSING'
    }
    $Resolved = (Resolve-Path -LiteralPath $Path).Path
    $Fingerprint = Get-CandidateFingerprint -Path $Resolved
    if ($Fingerprint.branch -ne $ExpectedBranch -or $Fingerprint.head -ne $ExpectedHead) {
        Stop-WithCode -Code 'CANDIDATE_IDENTITY_MISMATCH'
    }
    return [ordered]@{
        path = $Resolved
        fingerprint = $Fingerprint
    }
}

function Write-TextLines {
    param(
        [string]$Path,
        [string[]]$Lines
    )

    [System.IO.File]::WriteAllLines($Path, $Lines, $Utf8NoBom)
}

function Copy-RecoveryFile {
    param(
        [string]$SourceRoot,
        [string]$DestinationFilesRoot,
        [string]$RelativePath
    )

    $SourcePath = Join-Path $SourceRoot $RelativePath
    if (-not (Test-Path -LiteralPath $SourcePath -PathType Leaf)) {
        return $null
    }
    $ResolvedSource = (Resolve-Path -LiteralPath $SourcePath).Path
    if (-not (Test-PathInside -Candidate $ResolvedSource -Parent $SourceRoot)) {
        Stop-WithCode -Code 'SOURCE_PATH_ESCAPED_WORKTREE'
    }

    $DestinationPath = Join-Path $DestinationFilesRoot $RelativePath
    $DestinationParent = Split-Path -Parent $DestinationPath
    if (-not (Test-Path -LiteralPath $DestinationParent -PathType Container)) {
        New-Item -ItemType Directory -Path $DestinationParent | Out-Null
    }
    if (Test-Path -LiteralPath $DestinationPath) {
        Stop-WithCode -Code 'SNAPSHOT_OVERWRITE_FORBIDDEN'
    }

    $SourceHashBefore = (Get-FileHash -LiteralPath $ResolvedSource -Algorithm SHA256).Hash.ToLowerInvariant()
    Copy-Item -LiteralPath $ResolvedSource -Destination $DestinationPath
    $SourceHashAfter = (Get-FileHash -LiteralPath $ResolvedSource -Algorithm SHA256).Hash.ToLowerInvariant()
    $DestinationHash = (Get-FileHash -LiteralPath $DestinationPath -Algorithm SHA256).Hash.ToLowerInvariant()

    if ($SourceHashBefore -ne $SourceHashAfter -or $SourceHashAfter -ne $DestinationHash) {
        Stop-WithCode -Code 'SOURCE_FILE_CHANGED_DURING_SNAPSHOT'
    }

    return [ordered]@{
        path = ($RelativePath -replace '\\', '/')
        sha256 = $DestinationHash
    }
}

function Preserve-Candidate {
    param(
        [string]$Role,
        [string]$SourcePath,
        [string]$ExpectedBranch,
        [string]$ExpectedHead,
        [string]$SnapshotRoot,
        $BeforeFingerprint
    )

    $RoleRoot = Join-Path $SnapshotRoot $Role
    $FilesRoot = Join-Path $RoleRoot 'files'
    New-Item -ItemType Directory -Path $FilesRoot | Out-Null

    $DiffPrefix = @('-c', 'core.autocrlf=false', '-c', 'core.safecrlf=false', 'diff')
    $WorkingStatus = @(Invoke-GitText -WorkingDirectory $SourcePath -Arguments ($DiffPrefix + @('--name-status')))
    $CachedStatus = @(Invoke-GitText -WorkingDirectory $SourcePath -Arguments ($DiffPrefix + @('--cached', '--name-status')))
    $WorkingNames = @(Invoke-GitText -WorkingDirectory $SourcePath -Arguments ($DiffPrefix + @('--name-only')))
    $CachedNames = @(Invoke-GitText -WorkingDirectory $SourcePath -Arguments ($DiffPrefix + @('--cached', '--name-only')))
    $Untracked = @(Invoke-GitText -WorkingDirectory $SourcePath -Arguments @('ls-files', '--others', '--exclude-standard'))

    $WorkingPatch = @(Invoke-GitText -WorkingDirectory $SourcePath -Arguments ($DiffPrefix + @('--binary', '--full-index')))
    $CachedPatch = @(Invoke-GitText -WorkingDirectory $SourcePath -Arguments ($DiffPrefix + @('--cached', '--binary', '--full-index')))
    Write-TextLines -Path (Join-Path $RoleRoot 'working.patch') -Lines $WorkingPatch
    Write-TextLines -Path (Join-Path $RoleRoot 'cached.patch') -Lines $CachedPatch

    $PathSet = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::Ordinal)
    foreach ($Path in (@($WorkingNames) + @($CachedNames) + @($Untracked))) {
        if ($Path) {
            [void]$PathSet.Add($Path)
        }
    }

    $Copied = @()
    foreach ($RelativePath in ($PathSet | Sort-Object)) {
        $Receipt = Copy-RecoveryFile -SourceRoot $SourcePath -DestinationFilesRoot $FilesRoot -RelativePath $RelativePath
        if ($null -ne $Receipt) {
            $Copied += $Receipt
        }
    }

    $Manifest = [ordered]@{
        schema_version = 1
        contract_role = 'TASK8_LOCAL_CANDIDATE_SNAPSHOT'
        role = $Role
        branch = $ExpectedBranch
        head = $ExpectedHead
        status_before = @($BeforeFingerprint.status)
        index_sha256_before = $BeforeFingerprint.index_sha256
        working_name_status = @($WorkingStatus)
        cached_name_status = @($CachedStatus)
        untracked_paths = @($Untracked)
        copied_files = @($Copied)
    }
    [System.IO.File]::WriteAllText(
        (Join-Path $RoleRoot 'manifest.json'),
        ($Manifest | ConvertTo-Json -Depth 8),
        $Utf8NoBom
    )

    return [ordered]@{
        role = $Role
        branch = $ExpectedBranch
        head = $ExpectedHead
        manifest = "$Role/manifest.json"
        copied_file_count = @($Copied).Count
    }
}

$ResolvedRepo = (Resolve-Path -LiteralPath $Repo).Path
$DestinationFull = [System.IO.Path]::GetFullPath($DestinationRoot)
if (Test-PathInside -Candidate $DestinationFull -Parent $ResolvedRepo) {
    Stop-WithCode -Code 'DESTINATION_INSIDE_SOURCE'
}

$PrimaryPath = Join-Path $ResolvedRepo $PrimaryRelative
$SecondaryPath = Join-Path $ResolvedRepo $SecondaryRelative
$Primary = Assert-CandidateIdentity -Path $PrimaryPath -ExpectedBranch $PrimaryBranch -ExpectedHead $ExpectedPrimaryHead
$Secondary = Assert-CandidateIdentity -Path $SecondaryPath -ExpectedBranch $SecondaryBranch -ExpectedHead $ExpectedSecondaryHead

if ((Test-PathInside -Candidate $DestinationFull -Parent $Primary.path) -or (Test-PathInside -Candidate $DestinationFull -Parent $Secondary.path)) {
    Stop-WithCode -Code 'DESTINATION_INSIDE_SOURCE'
}

$RefsBefore = @(Invoke-GitText -WorkingDirectory $ResolvedRepo -Arguments @('show-ref'))
$PrimaryBefore = $Primary.fingerprint
$SecondaryBefore = $Secondary.fingerprint

if (-not (Test-Path -LiteralPath $DestinationFull -PathType Container)) {
    New-Item -ItemType Directory -Path $DestinationFull | Out-Null
}

$Stamp = [DateTime]::UtcNow.ToString('yyyyMMddTHHmmssfffZ')
$Suffix = [Guid]::NewGuid().ToString('N').Substring(0, 8)
$SnapshotRoot = Join-Path $DestinationFull "task8-preservation-$Stamp-$Suffix"
if (Test-Path -LiteralPath $SnapshotRoot) {
    Stop-WithCode -Code 'SNAPSHOT_OVERWRITE_FORBIDDEN'
}
New-Item -ItemType Directory -Path $SnapshotRoot | Out-Null

$CandidateReceipts = @(
    (Preserve-Candidate -Role 'primary_v2' -SourcePath $Primary.path -ExpectedBranch $PrimaryBranch -ExpectedHead $ExpectedPrimaryHead -SnapshotRoot $SnapshotRoot -BeforeFingerprint $PrimaryBefore),
    (Preserve-Candidate -Role 'secondary_original' -SourcePath $Secondary.path -ExpectedBranch $SecondaryBranch -ExpectedHead $ExpectedSecondaryHead -SnapshotRoot $SnapshotRoot -BeforeFingerprint $SecondaryBefore)
)

$PrimaryAfter = Get-CandidateFingerprint -Path $Primary.path
$SecondaryAfter = Get-CandidateFingerprint -Path $Secondary.path
$RefsAfter = @(Invoke-GitText -WorkingDirectory $ResolvedRepo -Arguments @('show-ref'))

$SourceUnchanged = (
    (($RefsBefore -join "`n") -eq ($RefsAfter -join "`n")) -and
    ($PrimaryBefore.branch -eq $PrimaryAfter.branch) -and
    ($PrimaryBefore.head -eq $PrimaryAfter.head) -and
    (($PrimaryBefore.status -join "`n") -eq ($PrimaryAfter.status -join "`n")) -and
    ($PrimaryBefore.index_sha256 -eq $PrimaryAfter.index_sha256) -and
    ($SecondaryBefore.branch -eq $SecondaryAfter.branch) -and
    ($SecondaryBefore.head -eq $SecondaryAfter.head) -and
    (($SecondaryBefore.status -join "`n") -eq ($SecondaryAfter.status -join "`n")) -and
    ($SecondaryBefore.index_sha256 -eq $SecondaryAfter.index_sha256)
)

if (-not $SourceUnchanged) {
    Stop-WithCode -Code 'SOURCE_STATE_CHANGED_DURING_SNAPSHOT'
}

$Receipt = [ordered]@{
    schema_version = 1
    contract_role = 'TASK8_LOCAL_CANDIDATE_PRESERVATION_RECEIPT'
    status = 'TASK8_CANDIDATES_PRESERVED'
    source_unchanged = $true
    snapshot_root = $SnapshotRoot
    candidates = @($CandidateReceipts)
}

$Receipt | ConvertTo-Json -Depth 8
