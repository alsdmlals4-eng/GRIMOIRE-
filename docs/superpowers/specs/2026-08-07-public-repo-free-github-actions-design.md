# Public-Repository Free GitHub Actions Design

## Decision

Use one GitHub Actions workflow with only standard GitHub-hosted runners as the official PR validation authority. The Windows+WSL2 local matrix is no longer a required merge gate.

## Architecture

A four-entry matrix runs `windows-py311`, `windows-py312`, `windows-py313`, and `ubuntu-py312`. Python 3.11 and 3.13 run the complete contract suite. Python 3.12 on Windows and Ubuntu additionally installs Godot 4.7.1 and runs the pinned GUT/JUnit/product-hash gate.

The workflow explicitly checks out the PR head SHA and calls a small Actions wrapper around the existing fail-closed validator. `GUT Validation Gate` succeeds only when all four matrix entries succeed.

## Cost boundary

The workflow uses `windows-latest` and `ubuntu-latest` only. It does not use larger runners, self-hosted runners, artifact uploads, or caches. Results are kept in workflow logs and `GITHUB_STEP_SUMMARY`.

## Local tooling

The existing local matrix remains available only for optional diagnosis. Its manifests cannot replace the official GitHub Actions check and are not required from the user.

## Current status

The workflow configuration does not prove GUT formal adoption. PR #85 remains Draft and merge unauthorized until the workflow runs successfully and the remaining vendor, product-test, review, and Sheet gates pass.
