[CmdletBinding()]
param(
    [string]$Repo = 'C:\Users\user\Documents\GitHub\Ninza\GRIMOIRE-'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$Baseline = '8c611f601aa98397ed1558e92ab207e0e8347a9b'
$HistoricalBranch = 'feat/task8-spell-use-screen-v2'
$HistoricalWorktreeRelative = '.worktrees/task8-spell-use-screen-v2'
$PreferredScript = 'src/ui/spell_workflow/spell_use_screen.gd'
$PreferredScene = 'src/ui/spell_workflow/spell_use_screen.tscn'

function Convert-Lines {
    param([object[]]$Value)
    return @($Value | ForEach-Object { "$_" })
}

function Inspect-Worktree {
    param([string]$Path)

    Push-Location $Path
    try {
        $TopLevel = "$(git rev-parse --show-toplevel)".Trim()
        $Branch = "$(git branch --show-current)".Trim()
        $Head = "$(git rev-parse HEAD)".Trim()
        $Status = @(Convert-Lines @(git status --short --branch))
        $Working = @(Convert-Lines @(git diff --name-status))
        $Cached = @(Convert-Lines @(git diff --cached --name-status))
        $Untracked = @(Convert-Lines @(git ls-files --others --exclude-standard))

        $BaselineAvailable = $false
        try {
            & git cat-file -e "$Baseline`^{commit}" 2>$null
            $BaselineAvailable = ($LASTEXITCODE -eq 0)
        }
        catch {
            $BaselineAvailable = $false
        }

        $LocalCommitLog = @()
        $BaselineDelta = @()
        if ($BaselineAvailable) {
            $LocalCommitLog = @(Convert-Lines @(git log --oneline "$Baseline..HEAD"))
            $BaselineDelta = @(Convert-Lines @(git diff --name-status $Baseline..HEAD))
        }

        $PreferredScriptExists = Test-Path -LiteralPath (Join-Path $TopLevel $PreferredScript)
        $PreferredSceneExists = Test-Path -LiteralPath (Join-Path $TopLevel $PreferredScene)
        $DeltaPresent = (@($Working).Count + @($Cached).Count + @($Untracked).Count + @($BaselineDelta).Count) -gt 0

        return [ordered]@{
            path = $Path
            top_level = $TopLevel
            branch = $Branch
            head = $Head
            inspection_error = $null
            historical_branch_match = ($Branch -eq $HistoricalBranch)
            historical_baseline_match = ($Head -eq $Baseline)
            baseline_object_available = $BaselineAvailable
            status = $Status
            working_name_status = $Working
            cached_name_status = $Cached
            untracked_paths = $Untracked
            baseline_to_head_log = $LocalCommitLog
            baseline_to_head_name_status = $BaselineDelta
            preferred_spell_use_script_exists = $PreferredScriptExists
            preferred_spell_use_scene_exists = $PreferredSceneExists
            delta_evidence_present = $DeltaPresent
        }
    }
    finally {
        Pop-Location
    }
}

$ResolvedRepo = (Resolve-Path -LiteralPath $Repo).Path
Push-Location $ResolvedRepo
try {
    $Root = "$(git rev-parse --show-toplevel)".Trim()
    $WorktreePorcelain = @(Convert-Lines @(git worktree list --porcelain))
}
finally {
    Pop-Location
}

$CandidatePaths = [System.Collections.Generic.List[string]]::new()
$CandidatePaths.Add($Root)

foreach ($Line in $WorktreePorcelain) {
    if ($Line.StartsWith('worktree ')) {
        $Candidate = $Line.Substring(9).Trim()
        if ($Candidate -and -not $CandidatePaths.Contains($Candidate)) {
            $CandidatePaths.Add($Candidate)
        }
    }
}

$HistoricalWorktree = Join-Path $Root $HistoricalWorktreeRelative
if ((Test-Path -LiteralPath $HistoricalWorktree) -and -not $CandidatePaths.Contains($HistoricalWorktree)) {
    $CandidatePaths.Add($HistoricalWorktree)
}

$Inspections = @()
foreach ($CandidatePath in $CandidatePaths) {
    if (Test-Path -LiteralPath $CandidatePath) {
        try {
            $Inspections += Inspect-Worktree -Path $CandidatePath
        }
        catch {
            $Inspections += [ordered]@{
                path = $CandidatePath
                top_level = $null
                branch = $null
                head = $null
                inspection_error = $_.Exception.Message
                historical_branch_match = $false
                historical_baseline_match = $false
                baseline_object_available = $false
                status = @()
                working_name_status = @()
                cached_name_status = @()
                untracked_paths = @()
                baseline_to_head_log = @()
                baseline_to_head_name_status = @()
                preferred_spell_use_script_exists = $false
                preferred_spell_use_scene_exists = $false
                delta_evidence_present = $false
            }
        }
    }
}

$HistoricalCandidates = @(
    $Inspections | Where-Object {
        ($_.branch -eq $HistoricalBranch) -or
        ($_.path -like "*$HistoricalWorktreeRelative*") -or
        ($_.preferred_spell_use_script_exists -eq $true) -or
        ($_.preferred_spell_use_scene_exists -eq $true)
    }
)

$Result = [ordered]@{
    probe = 'TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED'
    read_only = $true
    repo = $Root
    historical_branch = $HistoricalBranch
    historical_git_baseline = $Baseline
    historical_worktree_relative = $HistoricalWorktreeRelative
    registered_worktrees = $WorktreePorcelain
    inspected_worktrees = @($Inspections)
    historical_candidate_count = @($HistoricalCandidates).Count
    historical_candidates = @($HistoricalCandidates)
    interpretation = if (@($HistoricalCandidates).Count -gt 0) {
        'LOCAL_TASK8_EVIDENCE_FOUND_REVIEW_REQUIRED'
    }
    else {
        'NO_LOCAL_TASK8_EVIDENCE_FOUND_BY_INITIAL_PROBE'
    }
}

$Result | ConvertTo-Json -Depth 8
