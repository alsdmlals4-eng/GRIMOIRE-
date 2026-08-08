# GR-SYNC-20260808-04 — HiGodot v3.1.2 Vendor Integrity Correction

```yaml
sync_id: GR-SYNC-20260808-04-HIGODOT-VENDOR-INTEGRITY
audit_id: GR-AUD-TOOL-VENDOR-INTEGRITY-01
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
contract_binding_decision_id: GM-CONTRACT-V4-4-BINDING-01
status: EXACT_PLUGIN_SUBTREE_IDENTITY_PASS
```

## 교정 대상

`GR-SYNC-20260806-14-TOOL-SOURCE-INTEGRITY`의 HiGodot 판정은 서로 다른 tree scope를 비교했다.

```yaml
old_official_value:
  path: plugin/
  tree: e559376d95c12f67ae0117a23bcc1dd2519206c2
old_project_value:
  path: addons/godot_ai
  tree: a7d1e2fe8564cc385d683ec50d15fc66e1a17a35
old_verdict: MISMATCH_REQUIRES_RELEASE_ARCHIVE_AUDIT
correction: SUPERSEDED_SCOPE_MISMATCH_WRAPPER_TREE_VS_PLUGIN_SUBTREE
```

`plugin/` wrapper와 `addons/godot_ai` plugin subtree는 동일 레벨이 아니므로 위 두 SHA의 불일치는 vendor mutation 증거가 아니다.

## 공식 v3.1.2 Git evidence

```yaml
repository: hi-godot/godot-ai
release: v3.1.2
tag_commit: 678b16a6a0a335cf80cbb7d3f85c183cd3e616de
repository_tree: 646fb8365cc39de7b0a88e056cc03de7e7eb008a
plugin_wrapper_path: plugin
plugin_wrapper_tree: e559376d95c12f67ae0117a23bcc1dd2519206c2
official_plugin_subtree_path: plugin/addons/godot_ai
official_plugin_subtree_tree: a7d1e2fe8564cc385d683ec50d15fc66e1a17a35
project_plugin_subtree_path: addons/godot_ai
project_plugin_subtree_tree: a7d1e2fe8564cc385d683ec50d15fc66e1a17a35
comparison_scope_rule: COMPARE_PLUGIN_SUBTREE_TO_PLUGIN_SUBTREE
vendor_integrity: PASS_EXACT_TREE_IDENTITY
```

Git tree identity가 같으므로 tracked subtree의 경로·파일명·mode·blob/tree 구성이 정확히 동일하다.

## Release metadata evidence

```yaml
release_asset: godot-ai-plugin.zip
release_asset_sha256_reported_by_github: 60915d780e112aa25b142a596548786a0fb558f795278b9337722532e5dfdb33
license: MIT
official_license_blob: 7806d2217ecf773ab83bb8a1ec0b2a81c3cc8546
release_archive_downloaded_and_rehashed_in_this_audit: false
```

이번 audit는 GitHub 공식 Release API가 보고하는 asset digest를 기록했으며 이 실행 환경에서 ZIP을 새로 다운로드해 byte-for-byte 재해시했다고 주장하지 않는다. vendor integrity PASS의 직접 근거는 official tag source와 GRIMOIRE vendor가 동일한 plugin subtree Git tree를 가리킨다는 사실이다.

## 현재 경계

```yaml
higodot_authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
higodot_authoring_receipt_gate: IMPLEMENTED_ZERO_PROTECTED_DIFF_GATE
project_vendor_mutated_by_this_audit: false
spell_workflow_task2_authorized: false
remaining_before_task2:
  - HERA_CLI_ADDON_PAIR_UNVERIFIED
  - VISUAL_AUDIO_COMPLETE_NOT_PROVEN
  - WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED
```

GUT의 full vendor-tree mismatch와 승인된 critical-runtime equivalence는 별도 판정이며 이 HiGodot 교정으로 변경하지 않는다.
