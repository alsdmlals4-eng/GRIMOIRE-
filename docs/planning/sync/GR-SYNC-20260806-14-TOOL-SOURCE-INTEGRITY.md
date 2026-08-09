# GR-SYNC-20260806-14 — Tool Source Integrity

```yaml
sync_id: GR-SYNC-20260806-14-TOOL-SOURCE-INTEGRITY
contract_binding_decision_id: GM-CONTRACT-V4-3-BINDING-01
gut_decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
project_main_base: 252063ccad18b885fc75cbeba3b807fefd76496e
pull_request: 84
status: GITHUB_AND_SHEET_READBACK_PASS
```

## GUT 공식 소스

```yaml
repository: bitwes/Gut
release: v9.7.1
source_branch_or_release: godot_4_7
release_published_at: 2026-07-10T00:01:38Z
commit: aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605
commit_signature: VERIFIED
official_repository_tree: bb624be66fd3aab7378d053b391d80cc7762d331
official_addons_gut_tree: 5d6893836af4917ee62b1a395125a7530b1f239d
project_addons_gut_tree: 09d040309bbed0e07420ad72c4aa69cbd0e58190
license: MIT
official_license_blob: a38ac231fed3febe257c9e5fc31efb8ec7a39f90
source_version_license: PASS
vendor_integrity: MISMATCH_OFFICIAL_V9_7_1
runtime_compatibility: NOT_RUN
```

## HiGodot 공식 소스 — 당시 기록

```yaml
repository: hi-godot/godot-ai
release: v3.1.2
release_published_at: 2026-08-05T19:37:35Z
commit: 678b16a6a0a335cf80cbb7d3f85c183cd3e616de
official_repository_tree: 646fb8365cc39de7b0a88e056cc03de7e7eb008a
official_plugin_source_tree: e559376d95c12f67ae0117a23bcc1dd2519206c2
project_addons_godot_ai_tree: a7d1e2fe8564cc385d683ec50d15fc66e1a17a35
release_asset_sha256: 60915d780e112aa25b142a596548786a0fb558f795278b9337722532e5dfdb33
license: MIT
official_license_blob: 7806d2217ecf773ab83bb8a1ec0b2a81c3cc8546
source_version_license: PASS
vendor_integrity: MISMATCH_REQUIRES_RELEASE_ARCHIVE_AUDIT
runtime_compatibility: NOT_RUN
```

위 `official_plugin_source_tree` 명칭과 HiGodot vendor-integrity 판정은 2026-08-08 재감사에서 scope 오류로 교정되었다. 이 값 `e559376d...`는 실제로 official `plugin/` wrapper tree였으며 project `addons/godot_ai` subtree와 직접 비교할 수 있는 동급 scope가 아니었다.

## 당시 판정

공식 release·commit·license는 확인됐다. 당시에는 프로젝트 vendor subtree가 official source subtree와 다르다고 판정해 integrity PASS를 보류했다.

```yaml
allowed_now:
  - RECORD_SPEC_AND_AUDIT_PLAN
  - COMPLETE_PR84_SPEC_ONLY_REVIEW
forbidden_now:
  - ENABLE_GUT_RUNTIME_CONSUMPTION
  - REPLACE_ADDONS_WITHOUT_IMPLEMENTATION_PR
  - CLAIM_GUT_OR_HIGODOT_VENDOR_INTEGRITY_PASS
  - START_PR82_TASK2
```

## Google Sheet write/readback — 당시 기록

```yaml
02_현재_확정결정_I69_M70: READBACK_PASS
04_누락_충돌_감사_A76_I76: READBACK_PASS
99_변경이력_A96_H96: READBACK_PASS
```

## 비완료 주장 — 당시 기록

```yaml
gut_vendor_replaced_or_audited: false
higodot_release_archive_integrity_pass: false
gut_godot_4_7_1_runtime_compatibility_pass: false
gut_adoption_spec_merged: false
gut_formally_adopted: false
spell_workflow_task2_authorized: false
```

## 2026-08-08 HiGodot scope correction

이 역사 receipt를 삭제하거나 당시 판정을 소급 변경하지 않는다. 대신 다음 재감사 결과가 HiGodot vendor-integrity 현재 판정을 supersede한다.

```yaml
correction_sync: GR-SYNC-20260808-04-HIGODOT-VENDOR-INTEGRITY
audit_id: GR-AUD-TOOL-VENDOR-INTEGRITY-01
official_plugin_wrapper_path: plugin
official_plugin_wrapper_tree: e559376d95c12f67ae0117a23bcc1dd2519206c2
official_plugin_subtree_path: plugin/addons/godot_ai
official_plugin_subtree_tree: a7d1e2fe8564cc385d683ec50d15fc66e1a17a35
project_plugin_subtree_path: addons/godot_ai
project_plugin_subtree_tree: a7d1e2fe8564cc385d683ec50d15fc66e1a17a35
comparison_scope_rule: COMPARE_PLUGIN_SUBTREE_TO_PLUGIN_SUBTREE
current_higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
old_higodot_verdict: SUPERSEDED_SCOPE_MISMATCH_WRAPPER_TREE_VS_PLUGIN_SUBTREE
```

GUT의 `MISMATCH_OFFICIAL_V9_7_1` 및 별도 승인된 critical-runtime equivalence에는 이 HiGodot 교정이 영향을 주지 않는다.
