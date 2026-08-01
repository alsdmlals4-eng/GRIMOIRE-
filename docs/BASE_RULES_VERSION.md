# GRIMOIRE Base 규칙 버전

## 현재 채택 기준

| 항목 | 현재 값 |
|---|---|
| Base | `alsdmlals4-eng/Base` |
| Release | `v9.3.0` |
| Release Commit | `30ca6c7b5f93521f0eb0eed42d01437cd43c50ae` |
| Evidence Commit | `462a86db192d23d0f386281a1eb54b0a8cbad62e` |
| Registry SHA-256 | `9847bb2b225c776ad7916930f0f48c490bc2a898bea8e02ea1fdd0e6caac60c1` |
| 실행 계약 | `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v9.md` |
| 프로젝트 Adapter | `skills/PROJECT_BASE_ADAPTER.json` |
| 생성 Snapshot | `skills/PROJECT_SKILL_SNAPSHOT.json` |
| 생성기 | `tools/generate_project_operating_views.py` |
| 적용일 | `2026-08-01` |

## 적용 원칙

- Base `main` 최신 HEAD를 자동 실행 권위로 사용하지 않는다.
- 위 Release·Evidence Commit과 Registry Hash를 프로젝트 핀으로 고정한다.
- 공용 Skill 본문을 프로젝트에 복제하지 않는다.
- Trigger가 일치하는 최소 Skill만 선택한다.
- 프로젝트 고유 결정과 사용자의 최신 지시가 Base 기본값보다 우선한다.
- `PROJECT_BASE_ADAPTER.json`만 편집 가능한 통합 권위다.
- Snapshot과 Compatibility View는 생성물이므로 직접 편집하지 않는다.

## 프로젝트 현재 상태

```yaml
primary_platform: PC
follow_up_platform: Mobile
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE
planning: APPROVED
art_style_01: APPROVED_A_MODIFIED_LOCKED
art_bible_01: APPROVED_DUAL_STANDARD_ART_BIBLE
battle_rules_01: APPROVED_SITUATION_RESOLUTION_RULES
next_product_gate: ASSET-SPEC-01
implementation: NOT_STARTED
codex: BLOCKED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

## Sheet 계약

- Spreadsheet ID: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`.
- 역할: `USER_FACING_GDD_WORKSPACE`.
- 정책: `GM-CANON-SYNC-01 / IMMEDIATE_APPROVED_CANON_SYNC`.
- 작업 브랜치 상태와 main 병합 상태를 분리한다.
- Sheet 단독 편집은 `PROPOSED_SHEET_CHANGE`다.

## Legacy

- v6·v8 실행 계약은 `LEGACY_REFERENCE_INPUT / SUPERSEDED_COMPATIBILITY`.
- Base v9.0·v9.1 Adapter View는 현행 실행 권한이 아니다.
- `Spell` 저장소명은 역사 Alias로만 유지한다.

## 검증

```text
python tools/generate_project_operating_views.py --check
python -m unittest tests.test_base_v9_adoption
```

GitHub Actions의 `ci-gate`와 `adversarial-gate`가 PR에서 이를 확인한다. Godot 프로젝트·런타임·사람 플레이는 별도 증거가 없으므로 `NOT_RUN`이다.
