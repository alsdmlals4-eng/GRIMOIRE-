# GRIMOIRE 현재 확정 결정 Addendum — Mobile Foundation

```yaml
status: ACTIVE_CANONICAL_ADDENDUM
project: "GRIMOIRE: 세계를 다시 쓰는 법"
date: 2026-08-02 KST
parent_snapshot: docs/planning/CURRENT_CONFIRMED_DECISIONS.md
main_decision_commit: 2aec51244ea96fc4d4c9088fcb133f41862faa1d
pr: 31
sheet_sync: SYNCED_TO_MAIN
sheet_readback: PASS
implementation: NOT_STARTED
codex: BLOCKED
```

이 문서는 기존 `CURRENT_CONFIRMED_DECISIONS.md` 이후 승인된 Mobile Foundation 결정을 추가한다. 충돌 시 이 Addendum의 Mobile 세션·Landscape UX·기기군 항목이 우선한다.

## GM-MOBILE-SESSION-RESUME-SAVE-01

```yaml
status: CONTRACT_DEFINED
```

- Resume Anchor:
  - A: 첫 수업·교내 연습 이후.
  - B: 자유일정 A·첫 실기시험 이후.
  - C: 자유일정 B·학교축제 이후.
  - D: 자유일정 C·현장 전투 이후.
  - Slice Complete: 현장 환경·귀환·마도서 기록 이후.
- 상태 소유권:
  - `Draft / Recognizing / Candidate / Committed / Resolved / Recorded`.
- 저장 계층:
  - Transient Buffer.
  - Session Snapshot.
  - Persistent Transaction.
  - Progress Save.
- 중복 Commit·비용·피해·보상·Result·마도서 기록은 0이어야 한다.
- 완료된 획은 보존하고 미완성 획은 안전하게 폐기한다.
- stale Recognition 결과는 복귀 후 자동 적용하지 않는다.
- 손상 Save는 직전 안전 Anchor로 복구하고 원인을 표시한다.

책임 원본: `docs/planning/MOBILE_SESSION_RESUME_SAVE_01_2026-08-02.md`.

## GM-MOBILE-LANDSCAPE-UX-FOUNDATION-01

```yaml
status: CONTRACT_DEFINED_WITH_TEST_VALUES
orientation: LANDSCAPE_FIXED
```

- 모든 핵심 UI는 Runtime Safe Area 내부의 Safe Root를 기준으로 배치한다.
- 핵심 정보 위계:
  1. Objective / Threat / Timer.
  2. Player Status.
  3. World / Enemy / Situation Focus.
  4. Writing Rail / Panel.
  5. Confirm / Recovery / System Feedback.
- 공식 하한:
  - Android Touch target `48dp`.
  - Apple 주요 Control `44pt`.
- 프로젝트 후보는 `TEST_VALUE`:
  - 일반 Control `48 UI unit`.
  - 핵심 Control `56 UI unit`.
  - Rail `12~16%`.
  - Full Writing `36~44%`.
  - UI/Text Scale `100 / 115 / 130%`.
  - 작성 감속 `1.0× / 0.5×`.
- 장식·상세 로그부터 축소하고 목표·위험·상태·작성·복구 행동은 끝까지 보존한다.

책임 원본:

- `docs/planning/MOBILE_LANDSCAPE_UX_FOUNDATION_01_2026-08-02.md`.
- `docs/planning/MOBILE_LANDSCAPE_UX_FOUNDATION_01_DEVICE_CLASS_ADDENDUM_2026-08-02.md`.

## GM-MOBILE-DEVICE-CLASS-01

```yaml
status: USER_APPROVED_ACTIVE
approved_option: A
smartphone: REQUIRED_QUALITY_GATE
tablet: BEST_EFFORT_SMOKE_ONLY
```

### Smartphone 필수 Matrix

- `16:9`.
- `18:9`.
- `19.5:9`.
- `20:9`.
- 좌측 Cutout.
- 우측 Cutout.
- 하단 System indicator·gesture 영역.

### Tablet 경계

- Tablet `4:3 / 3:2`는 실행·Safe Area·핵심 정보·기본 Touch·저장 복구 Smoke Test만 수행한다.
- Tablet 전용 Layout, 동일 시각 품질, 전용 Canvas 확대, Store 정식 지원은 약속하지 않는다.
- Foldable·Multi-window·Portrait Tablet·Tablet 전용 Stylus 최적화는 Vertical Slice 제외다.
- Tablet Smoke에서 공통 저장 손상·중복 Commit·핵심 입력 불능이 발견되면 Smartphone Gate 문제로 승격한다.

책임 원본: `docs/planning/MOBILE_DEVICE_CLASS_01_APPROVAL_2026-08-02.md`.

## MOBILE-FOUNDATION-01 현재 상태

```yaml
status: IN_PROGRESS
resume_save: CONTRACT_DEFINED
landscape_ux: CONTRACT_DEFINED_WITH_TEST_VALUES
device_class: USER_APPROVED_ACTIVE
smartphone_aspect_matrix: DEFINED
tablet_scope: BEST_EFFORT_SMOKE_ONLY
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 다음 작업

```text
Smartphone Landscape Writing/Battle Wireframe 계약
→ Android/iOS·Store·최소 기기·성능 Decision Packet
→ MOBILE-FOUNDATION-01 통합 승인
→ 구현 계획
```

제품 구현·Godot Scene·Script·Resource·Asset 제작은 계속 금지한다.
