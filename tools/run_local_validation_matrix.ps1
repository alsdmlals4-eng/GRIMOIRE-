[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern('^[0-9a-f]{40}$')]
    [string]$ExpectedHead,

    [Parameter(Mandatory = $true)]
    [ValidatePattern('^[0-9a-f]{40}$')]
    [string]$BaseSha,

    [Parameter(Mandatory = $true)]
    [ValidateRange(1, 2147483647)]
    [int]$PullRequest,

    [string]$WslDistribution = 'Ubuntu',
    [string]$WindowsGodotExecutable = '',
    [string]$WslGodotExecutable = '',
    [string]$EvidenceRoot = 'artifacts/local-validation'
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$repoRoot = (& git rev-parse --show-toplevel).Trim()
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($repoRoot)) {
    throw 'Run from the GRIMOIRE repository.'
}
Set-Location $repoRoot

$actualHead = (& git rev-parse HEAD).Trim()
if ($LASTEXITCODE -ne 0 -or $actualHead -ne $ExpectedHead) {
    throw "HEAD_MISMATCH expected=$ExpectedHead actual=$actualHead"
}
if (-not [string]::IsNullOrWhiteSpace((& git status --porcelain))) {
    throw 'DIRTY_WORKTREE_BEFORE_VALIDATION'
}

$py = Get-Command py -ErrorAction Stop
$wsl = Get-Command wsl.exe -ErrorAction Stop
$evidenceAbsolute = Join-Path $repoRoot $EvidenceRoot
New-Item -ItemType Directory -Force -Path $evidenceAbsolute | Out-Null

function Invoke-Lane {
    param(
        [string]$LaneId,
        [string]$PythonSelector,
        [string]$ExpectedPython,
        [ValidateSet('contract', 'full')]
        [string]$Mode,
        [string]$GodotExecutable = ''
    )

    $laneDir = Join-Path $EvidenceRoot $LaneId
    $args = @(
        $PythonSelector,
        'tools/run_local_gut_validation.py',
        '--expected-head', $ExpectedHead,
        '--base-sha', $BaseSha,
        '--pull-request', [string]$PullRequest,
        '--lane-id', $LaneId,
        '--expected-python', $ExpectedPython,
        '--mode', $Mode,
        '--evidence-dir', $laneDir
    )
    if (-not [string]::IsNullOrWhiteSpace($GodotExecutable)) {
        $args += @('--godot-executable', $GodotExecutable)
    }

    & $py.Source @args
    return $LASTEXITCODE
}

# Required Windows lanes: py -3.11, py -3.12, py -3.13
$laneExitCodes = [ordered]@{}
$laneExitCodes['windows-py311'] = Invoke-Lane -LaneId 'windows-py311' -PythonSelector '-3.11' -ExpectedPython '3.11' -Mode 'contract'

if ([string]::IsNullOrWhiteSpace($WindowsGodotExecutable)) {
    $godotCommand = Get-Command godot -ErrorAction SilentlyContinue
    if ($null -eq $godotCommand) {
        $godotCommand = Get-Command godot4 -ErrorAction SilentlyContinue
    }
    if ($null -ne $godotCommand) {
        $WindowsGodotExecutable = $godotCommand.Source
    }
}
$laneExitCodes['windows-py312'] = Invoke-Lane -LaneId 'windows-py312' -PythonSelector '-3.12' -ExpectedPython '3.12' -Mode 'full' -GodotExecutable $WindowsGodotExecutable
$laneExitCodes['windows-py313'] = Invoke-Lane -LaneId 'windows-py313' -PythonSelector '-3.13' -ExpectedPython '3.13' -Mode 'contract'

$wslRepo = (& $wsl.Source -d $WslDistribution -- wslpath -a $repoRoot).Trim()
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($wslRepo)) {
    throw 'WSL_REPOSITORY_PATH_RESOLUTION_FAILED'
}
$wslEvidence = "$wslRepo/$($EvidenceRoot -replace '\\','/')/wsl-ubuntu-py312"
$wslArgs = @(
    '-d', $WslDistribution, '--',
    'bash', "$wslRepo/tools/run_local_validation_matrix_wsl.sh",
    $ExpectedHead, $BaseSha, [string]$PullRequest, $wslEvidence
)
if (-not [string]::IsNullOrWhiteSpace($WslGodotExecutable)) {
    $wslArgs += $WslGodotExecutable
}
& $wsl.Source @wslArgs
$laneExitCodes['wsl-ubuntu-py312'] = $LASTEXITCODE

$matrixPath = Join-Path $EvidenceRoot 'matrix-manifest.json'
$aggregateArgs = @(
    '-3.12', 'tools/local_validation_matrix.py',
    '--expected-head', $ExpectedHead,
    '--base-sha', $BaseSha,
    '--pull-request', [string]$PullRequest,
    '--output', $matrixPath,
    '--lane', "windows-py311=$(Join-Path $EvidenceRoot 'windows-py311/manifest.json')",
    '--lane', "windows-py312=$(Join-Path $EvidenceRoot 'windows-py312/manifest.json')",
    '--lane', "windows-py313=$(Join-Path $EvidenceRoot 'windows-py313/manifest.json')",
    '--lane', "wsl-ubuntu-py312=$(Join-Path $EvidenceRoot 'wsl-ubuntu-py312/manifest.json')"
)
& $py.Source @aggregateArgs
$aggregateExit = $LASTEXITCODE

Write-Host "Matrix manifest: $(Join-Path $repoRoot $matrixPath)"
foreach ($entry in $laneExitCodes.GetEnumerator()) {
    Write-Host "$($entry.Key): exit $($entry.Value)"
}
exit $aggregateExit
