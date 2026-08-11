# Godot 4.7.1 Toolchain Download Resilience — Research Receipt

```yaml
work_unit: GODOT_TOOLCHAIN_DOWNLOAD_RESILIENCE
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
sync_id: GR-SYNC-20260811-18-GODOT-TOOLCHAIN-DOWNLOAD-RESILIENCE
work_question: How should GRIMOIRE make its pinned Godot 4.7.1 export-template CI download deterministic and fail-closed after repeated BadZipFile failures, without changing product/Godot authoring authority?
observed_at: 2026-08-11
base_main: 069f0c9654a6cde7cea6f3343dd2fa81c6248d5d
project_main: 821ad1255ebc620e1a9e14a1e27bc2af1844de4b
triggering_pr: 128
implementation_pr: 129
persistent_godot_source_mutation: NONE
product_decision_change: NONE
```

## Fresh authority read

- Base `main` advanced from the prior Task 8 observation to `069f0c9654a6cde7cea6f3343dd2fa81c6248d5d`; the current Source Context policy still requires source role/freshness/applicability, Existing Solution First, explicit disposition, adversarial review, and exact-head/readback.
- GRIMOIRE `main` at work-unit start was `821ad1255ebc620e1a9e14a1e27bc2af1844de4b`.
- Open PR #128 contained one documentation-only HiGodot v3.1.4 alignment-input file. Its planning/Spell/authoring/Star gates were green, but the Godot 4.7.1 toolchain lane failed repeatedly after the offline contract tests passed.
- The current Sheet still observed the earlier Base SHA, so this work unit treats that as stale observation metadata rather than a product-authority conflict.

## Triggering failure evidence

The failing workflow reached:

```text
python -m unittest tests.test_godot_toolchain_setup
→ PASS (7 tests)
→ download engine/templates
→ export template extraction
→ zipfile.BadZipFile: File is not a zip file
```

The failure repeated across multiple attempts on PR #128. The existing downloader accepted any non-empty HTTP response and immediately handed it to `zipfile.ZipFile`, so HTTP success was being treated as archive integrity proof.

## Existing Solution First

Keep the existing toolchain ownership:

```text
tools/setup_godot_toolchain.py
→ build pinned URLs
→ download_file(...)
→ safe_extract_zip(...)
→ install_engine / install_templates
→ version + headless probe
```

Do not replace this with a second installer, shell-only curl path, third-party download action, or product-source workaround. Extend the existing downloader with the minimum missing artifact-integrity contract.

## Fresh official / professional research

| Source | role | freshness / applicability | use | disposition |
|---|---|---|---|---|
| Godot 4.7.1 official archive | AUTHORITY_TARGET | exact pinned engine release | confirms stable release and export-template distribution | ADOPT |
| `godotengine/godot-builds` official 4.7.1 release asset metadata | AUTHORITY_TARGET | exact artifact | pin direct release URL, exact byte size, exact SHA256 | ADOPT |
| Python `urllib.request` docs | AUTHORITY_TARGET | current stdlib behavior | timeout/HTTP completion is not integrity verification | ADOPT |
| Python `zipfile` docs | AUTHORITY_TARGET | current stdlib behavior | extraction must happen only after trusted artifact verification | ADOPT |
| GitHub REST release-asset metadata | AUTHORITY_TARGET | current GitHub behavior | release assets expose size/digest/browser download URL | ADOPT |
| GitHub Actions dependency-cache guidance | REFERENCE_TARGET | current CI option | cache is possible but not the smallest first fix for a 1.28 GB artifact | TEST / DEFER |

Primary references:

- https://godotengine.org/download/archive/4.7.1-stable/
- https://github.com/godotengine/godot-builds/releases/tag/4.7.1-stable
- https://docs.python.org/3/library/urllib.request.html
- https://docs.python.org/3/library/zipfile.html
- https://docs.github.com/en/rest/releases/assets
- https://docs.github.com/actions/using-workflows/caching-dependencies-to-speed-up-workflows

## Exact official export-template artifact

```yaml
name: Godot_v4.7.1-stable_export_templates.tpz
browser_download_url: https://github.com/godotengine/godot-builds/releases/download/4.7.1-stable/Godot_v4.7.1-stable_export_templates.tpz
size_bytes: 1280486955
sha256: 86409db6200b6f8fd3230989c2d2002851f3dd18acf11d7bdbafddf5a0dd0f72
```

## Disposition

```yaml
ADOPT:
  - direct pinned official godot-builds release-asset URL for export templates
  - exact official size verification
  - exact official SHA256 verification
  - delete corrupt/partial files before another attempt
ADAPT:
  - bounded retry inside existing Python downloader
TEST:
  - future Actions cache only if repeated 1.28 GB transfer cost becomes material
AVOID:
  - generic redirect endpoint as sole artifact identity
  - HTTP success or non-empty file as integrity proof
  - extracting the same known-corrupt file again
  - unbounded retries
  - adding a second installer path
IGNORE:
  - product/gameplay changes; unrelated to this failure
REFERENCE_ONLY:
  - caching as optimization rather than correctness authority
```

## TDD evidence

The implementation followed small RED → GREEN cycles on PR #129:

1. require pinned official export-template release URL;
2. require explicit size/SHA256/retry download contract;
3. reject and remove size-mismatched artifacts;
4. reject and remove SHA256-mismatched artifacts;
5. retry after an integrity failure and redownload from scratch;
6. require `install_templates()` to pass the exact official size/SHA256 and bounded retry count.

Observed RED failures matched the missing behavior each time, including:

- generic URL mismatch;
- missing integrity-contract parameters;
- `RuntimeError not raised` for truncated content;
- `RuntimeError not raised` for checksum mismatch;
- no second attempt after first corrupt artifact;
- `expected_size == None` at the `install_templates()` integration boundary.

## Adversarial review

Fail closed if any of these occurs:

1. a corrupt file survives after a failed integrity check;
2. a mismatch is retried without deleting the previous bytes;
3. retries are unbounded;
4. the template URL is not pinned to the exact 4.7.1 stable asset;
5. the official size or SHA256 is not supplied by `install_templates()`;
6. extraction happens before the size/SHA256 contract passes;
7. the change mutates persistent Godot product source or changes HiGodot/GUT/Hera ownership;
8. a cache is treated as artifact authenticity authority;
9. engine/product validation is promoted beyond actual CI evidence.

## Research conclusion

```yaml
root_cause_class: LARGE_ARTIFACT_DOWNLOAD_INTEGRITY_GAP
implementation_direction: EXTEND_EXISTING_DOWNLOADER_WITH_PINNED_ASSET_SIZE_SHA256_AND_BOUNDED_RETRY
product_scope: NONE
godot_authoring_scope: NONE
higodot_authority_change: NONE
gut_authority_change: NONE
hera_authority_change: NONE
research_gate: PASS
```