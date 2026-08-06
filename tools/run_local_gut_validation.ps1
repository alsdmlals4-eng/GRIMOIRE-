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

    [ValidateSet('contract', 'vendor', 'full')]
    [string]$Mode = 'contract',

    [string]$GodotExecutable = '',

    [string]$EvidenceDir = 'artifacts/local-validation'
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$repoRoot = (& git rev-parse --show-toplevel).Trim()
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($repoRoot)) {
    throw 'Run this script from a GRIMOIRE Git checkout.'
}

Set-Location $repoRoot

$arguments = @(
    'tools/run_local_gut_validation.py',
    '--expected-head', $ExpectedHead,
    '--base-sha', $BaseSha,
    '--pull-request', [string]$PullRequest,
    '--mode', $Mode,
    '--evidence-dir', $EvidenceDir
)

if (-not [string]::IsNullOrWhiteSpace($GodotExecutable)) {
    $arguments += @('--godot-executable', $GodotExecutable)
}

$pyLauncher = Get-Command py -ErrorAction SilentlyContinue
if ($null -ne $pyLauncher) {
    & $pyLauncher.Source -3 @arguments
}
else {
    $python = Get-Command python -ErrorAction Stop
    & $python.Source @arguments
}
$exitCode = $LASTEXITCODE

$manifestPath = Join-Path $repoRoot (Join-Path $EvidenceDir 'manifest.json')
if (Test-Path $manifestPath) {
    Write-Host "Evidence manifest: $manifestPath"
}
else {
    Write-Error "Evidence manifest was not created: $manifestPath"
    exit 2
}

exit $exitCode
