# GUT 9.7.1 정식 채택 설계 명세

```yaml
spec_status: SPEC_ONLY_NO_INSTALLATION
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
contract_binding_decision_id: GM-CONTRACT-V4-3-BINDING-01
framework: "GUT"
version: "9.7.1"
canonical_repository: "bitwes/Gut"
release_tag: "v9.7.1"
source_branch_or_release: "godot_4_7"
release_published_at: "2026-07-10T00:01:38Z"
pinned_commit_sha: "aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605"
pinned_commit_signature: VERIFIED
repository_tree_sha: "bb624be66fd3aab7378d053b391d80cc7762d331"
official_addons_gut_tree_sha: "5d6893836af4917ee62b1a395125a7530b1f239d"
project_addons_gut_tree_sha_at_main_252063cc: "09d040309bbed0e07420ad72c4aa69cbd0e58190"
download_or_vendor_method: REPLACE_OR_AUDIT_TO_PINNED_V9_7_1_RELEASE_TREE
integrity_hash: "git-tree-sha1:5d6893836af4917ee62b1a395125a7530b1f239d"
current_vendor_integrity: MISMATCH_OFFICIAL_V9_7_1
license: MIT
license_file_path: "addons/gut/LICENSE.md"
official_license_blob_sha: "a38ac231fed3febe257c9e5fc31efb8ec7a39f90"
godot_target: "4.7.x"
project_exact_godot_version: "4.7.1 CI target; local executable BLOCKED_UNVERIFIED"
compatibility_evidence:
  - "official v9.7.1 release targets godot_4_7"
  - "addons/gut/versions.json maps 9.7.1 to Godot 4.7 through 4.7.999"
  - "addons/gut/plugin.cfg declares version 9.7.1"
  - "existing Godot 4.7.1 project workflows pass on main 252063cc"
  - "actual GUT 9.7.1 CLI discovery on project Godot 4.7.1 is NOT_RUN"
plugin_install_path: "res://addons/gut"
plugin_enablement: "CLI_ONLY_EDITOR_PLUGIN_DISABLED"
test_root_paths:
  - "res://tests/gut/unit"
  - "res://tests/gut/integration"
test_naming_rules:
  - "test_*.gd"
  - "extends GutTest"
  - "one product contract per test method"
actual_consumers:
  - "star circuit domain scripts"
  - "glyph catalog and compatibility rules"
  - "spell workflow view-model contracts"
  - "shared Windows/Android game-logic core"
gut_config_path: ".gutconfig.json"
local_commands:
  - "godot --headless --path . -s addons/gut/gut_cmdln.gd -gconfig=.gutconfig.json -gexit"
  - "godot --headless --path . -s addons/gut/gut_cmdln.gd -gconfig=.gutconfig.json -gjunit_xml_file=user://gut-results.xml -gexit"
ci_workflow: ".github/workflows/validate-gut-formal-adoption.yml"
junit_or_report_artifact: "artifacts/gut/gut-results.xml copied from user:// before upload"
minimum_discovered_test_count: 1
production_mutation_guard: "hash protected production paths before and after GUT; exact equality required"
windows_execution: "Godot 4.7.1 headless GUT CLI on windows-latest or documented equivalent after Linux CI green"
android_shared_core_coverage: "same headless shared-core tests plus Android export/smoke gate; no duplicated Android game logic"
upgrade_process: "new spec PR pins source commit, verifies license/compatibility/tree identity, runs old/new suites, then updates"
removal_process: "remove .gutconfig.json, tests/gut, GUT workflow and addons/gut only after legacy fallback and no consumer references"
rollback_conditions:
  - "official vendor tree identity cannot be established"
  - "test discovery is zero"
  - "JUnit artifact missing"
  - "production hash changes"
  - "Godot 4.7.1 import or runtime regression"
  - "legacy required-contract parity fails"
  - "HiGodot/GUT authority overlap detected"
known_risks:
  - "existing addon files predate v4.3 and are not proof of adoption"
  - "project addons/gut tree 09d04030 differs from official v9.7.1 tree 5d689383"
  - "user:// JUnit path is not directly uploadable without workspace copy"
  - "shallow checkout can break protected-diff comparison"
  - "Git paths and res:// receipt paths require normalization"
```

## 1. 목적

GUT 9.7.1을 단순 vendored addon이 아니라 GRIMOIRE의 정식 테스트 실행·assertion 권위로 채택하기 위한 설계 명세다. 이 PR은 설치 PR이 아니다. 명세·Decision·검증 계획만 병합하며, 실제 소비 파일과 CI는 명세가 main에 병합된 후 별도 TDD 구현 PR에서 추가한다.

## 2. 공식 소스와 현재 vendor 판정

공식 `v9.7.1` release는 `godot_4_7`을 대상으로 하며 tag commit은 `aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605`다. commit signature는 verified이고 공식 `addons/gut` subtree는 `5d6893836af4917ee62b1a395125a7530b1f239d`다.

프로젝트 main `252063ccad18b885fc75cbeba3b807fefd76496e`의 `addons/gut` subtree는 `09d040309bbed0e07420ad72c4aa69cbd0e58190`다.

```yaml
version_metadata: MATCHES_9_7_1
license_metadata: MATCHES_MIT
tree_identity: MISMATCH
formal_adoption_evidence: NONE
required_implementation_action: REPLACE_WITH_OFFICIAL_TREE_OR_PRODUCE_FILE_LEVEL_AUDIT_AND_APPROVAL
```

버전 문자열이 같아도 tree가 다르면 공식 release와 동일한 설치물이라고 주장하지 않는다. 구현 PR은 공식 tree로 교체하거나, 모든 path/blob 차이를 분석해 승인받기 전 GUT runtime 소비를 활성화할 수 없다.

## 3. 현재 상태

```yaml
repository_files: VENDORED_PREEXISTING_TREE_MISMATCH
formal_consumption: NONE
actual_gut_product_tests: 0
gut_config: MISSING
gut_ci: MISSING
junit_artifact: MISSING
product_mutation_guard: MISSING
legacy_parity: NOT_PROVEN
editor_plugin: DISABLED
project_godot_change_in_spec_pr: FORBIDDEN
```

기존 `addons/gut` 파일은 v4.3 이전에 저장소에 존재했다. 파일 존재를 채택 완료로 해석하지 않는다.

## 4. 역할 경계

### HiGodot

- `project.godot`, `*.tscn`, `*.tres`, `*.res`, Scene tree, Node, Resource, Theme, Animation, signal wiring, Project Settings의 단일 저작 권위다.
- protected Godot 파일 변경에는 `HIGODOT_AUTHORING_MANIFEST`가 필요하다.
- test expectation, fixture, `.gutconfig.json`, CI 성공 기준을 수정하지 않는다.

### GUT

- 승인된 production 결과를 읽고 실행하고 assert한다.
- production 파일을 수정하지 않는다.
- test discovery, pass/fail, JUnit/report를 제공한다.
- HiGodot test 기능과 동일 요구를 중복 구현하지 않는다.

### Codex·CI

- Codex는 `.gd` product script, data, test script, CI, 문서를 TDD로 구현한다.
- Scene·Resource·Project Settings 변경은 HiGodot 요청으로 분리한다.
- CI는 report와 artifact만 생성하며 production 파일을 자동 수정하지 않는다.

## 5. 설치·소비 설계

### Phase A — 이 명세 PR

허용:

- 프로젝트 v4.3 바인딩.
- 공식 release/tag/commit/license/tree 확인.
- 현재 vendor subtree와 공식 subtree 불일치 기록.
- GUT 채택 명세와 Decision.
- 진입 상태 재판정.
- 명세 계약 테스트.
- Google Sheet 동기화.

금지:

- `.gutconfig.json` 추가.
- 실제 `GutTest` 추가.
- GUT runtime workflow 추가.
- `project.godot` 변경.
- Scene·Resource·asset 변경.
- `addons/gut` 교체·복사.

### Phase B — 명세 병합 후 구현 PR

```text
latest merged main
→ official v9.7.1 tree replacement or file-level audit decision
→ RED contract
→ .gutconfig.json + minimum actual product GutTest
→ Godot 4.7.1 GUT CLI
→ user:// JUnit 생성 확인
→ workspace artifact 경로로 copy
→ pre/post production hash equality
→ legacy runner parity mapping
→ HiGodot authoring manifest gate
→ Windows headless + Android shared-core/export evidence
→ removal/rollback dry-run
→ exact-HEAD 검토와 사용자 권위 판정
```

## 6. 실제 제품 소비 기준

첫 GREEN은 단순 샘플이나 GUT 자체 테스트가 아니라 GRIMOIRE product contract를 검증해야 한다.

최소 소비 후보:

1. `FIVE_POINT_STAR` layout과 슬롯 수.
2. 10종 Glyph Catalog의 canonical key.
3. legacy `BURST → AMPLIFY` 호환.
4. Stage 2 glyph-only consumption과 Stage 3 mana-only consumption 경계.

초기 구현은 기존 custom runner를 즉시 제거하지 않는다. 같은 필수 계약을 두 runner에서 병행해 parity를 증명한 뒤 제거 여부를 별도 결정한다.

## 7. CI·JUnit 설계

- GUT exit code가 실패하면 workflow가 실패해야 한다.
- discovery가 `minimum_discovered_test_count`보다 작으면 실패한다.
- `user://gut-results.xml` 존재와 유효 XML을 확인한다.
- JUnit 파일을 repository workspace의 `artifacts/gut/gut-results.xml`로 복사한 후 업로드한다.
- GUT 실행 전후 protected production path hash manifest를 비교한다.
- 허용된 test artifact 경로 밖 새 파일이 생기면 실패한다.
- exact PR HEAD와 evidence manifest SHA가 다르면 실패한다.
- 사용한 `addons/gut` subtree가 승인된 tree SHA와 다르면 실패한다.

Protected production paths:

```text
project.godot
scenes/**
resources/**
data/**
assets/**
ui/**
*.tscn
*.tres
*.res
```

테스트 자체가 필요한 임시 파일은 `user://` 또는 `artifacts/gut/`에만 만든다.

## 8. HiGodot receipt Gate

protected Godot diff가 0이면 authoring manifest가 필요하지 않다. diff가 존재하면 full history 또는 명시적으로 fetch된 base/head SHA를 사용해 diff를 계산하고 다음을 검증한다.

- manifest base/head가 exact PR SHA와 일치.
- Git 경로와 `res://` 경로를 정규화한 뒤 모든 protected diff를 manifest가 포함.
- pre/post hash와 Scene/Resource/Project Settings readback 존재.
- GUT 실행 후 production hash 불변.

## 9. Windows·Android 단일 코어

- 공통 게임 규칙과 데이터는 하나의 core에서 테스트한다.
- Windows와 Android는 입력·UI·플랫폼 integration만 분리한다.
- Linux CI의 headless shared-core PASS만으로 Windows·Android 완료를 선언하지 않는다.
- Windows headless/launch와 Android export·shared-core smoke를 별도 증거로 남긴다.

## 10. 제거·롤백

제거 순서:

```text
consumer inventory
→ legacy fallback 확인
→ GUT workflow 비활성화 PR
→ .gutconfig.json·tests/gut 제거
→ addons/gut reference 0 확인
→ addons/gut 제거
→ Godot import·legacy suite·Windows/Android 재검증
```

롤백 시에도 product files를 test 기준에 맞게 수정하지 않는다. GUT 도입이 실패하면 테스트 인프라를 되돌리고 기존 product behavior와 legacy runner를 보존한다.

## 11. 승인 조건

이 명세 PR은 다음 조건에서만 merge-ready다.

- v4.3 project binding과 Sheet가 동일 Decision ID로 동기화됨.
- official release·commit·license·tree와 현재 vendor mismatch가 명시됨.
- source·version·compatibility·consumer·CI·removal 계획이 명시됨.
- 변경 파일이 문서·명세 계약 테스트·정본 상태에 한정됨.
- `project.godot`, Scene, Resource, asset, GUT 설치 파일 변경 0.
- exact-HEAD checks PASS.
- unresolved thread 0.
- P0/P1 finding 0.
- 구현자 설명과 분리된 검토 입력과 사용자 결정권 정책을 충족.

명세가 merged main에 존재하기 전에는 GUT formal installation 구현을 시작하거나 완료로 선언하지 않는다.
