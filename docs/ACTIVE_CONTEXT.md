# GRIMOIRE Active Context

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
primary_platform: Mobile
follow_up_platform: PC
platform_decision: GM-PLATFORM-02
mobile_orientation_decision: GM-MOBILE-ORIENTATION-01
mobile_orientation: LANDSCAPE_FIXED
mobile_device_class_decision: GM-MOBILE-DEVICE-CLASS-01
smartphone_quality_gate: REQUIRED
tablet_scope: BEST_EFFORT_SMOKE_ONLY
portrait_gameplay: NOT_SUPPORTED_IN_VERTICAL_SLICE
runtime_rotation: DISABLED_IN_VERTICAL_SLICE
engine_baseline_candidate: Godot 4.7.1 stable
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE
work_mode: PLAN
planning: APPROVED
art_style_01: APPROVED_A_MODIFIED_LOCKED
art_bible_01: APPROVED_DUAL_STANDARD_ART_BIBLE
battle_rules_01: APPROVED_SITUATION_RESOLUTION_RULES
asset_spec_01: APPROVED_SPEC
next_product_gate: MOBILE-FOUNDATION-01
mobile_foundation_status: IN_PROGRESS
resume_save: CONTRACT_DEFINED
landscape_ux: CONTRACT_DEFINED_WITH_TEST_VALUES
smartphone_required_aspect_matrix: DEFINED
queued_design_gates: BOSS-PHASE-01 / GRIMOIRE-SCREEN-01 / AUDIO-DIRECTION-01
implementation: NOT_STARTED
codex: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
decision_main_commit: 2aec51244ea96fc4d4c9088fcb133f41862faa1d
decision_pr: 31
sheet_sync: SYNCED_TO_MAIN
sheet_readback: PASS
main_sync_receipt: docs/planning/sync/GR-SYNC-20260802-08-MAIN.md
```

제품용 `project.godot`, Scene, Script, Resource, 게임 데이터, 런타임 Asset은 없다.

## 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ 이 문서
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS_ADDENDUM_MOBILE_FOUNDATION_2026-08-02.md
→ docs/planning/MOBILE_SESSION_RESUME_SAVE_01_2026-08-02.md
→ docs/planning/MOBILE_LANDSCAPE_UX_FOUNDATION_01_2026-08-02.md
→ docs/planning/MOBILE_LANDSCAPE_UX_FOUNDATION_01_DEVICE_CLASS_ADDENDUM_2026-08-02.md
→ docs/planning/MOBILE_DEVICE_CLASS_01_APPROVAL_2026-08-02.md
→ docs/planning/TOTAL_PLANNING_ADVERSARIAL_AUDIT_ADDENDUM_2026-08-02A.md
→ docs/planning/sync/GR-SYNC-20260802-08-MAIN.md
→ 질문 주제의 승인 책임 원본
→ docs/DEVELOPMENT_GATES.md
→ docs/UX_UI_SYSTEM.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ skills/PROJECT_BASE_ADAPTER.json
```

## 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

비타협 코어:

- 의미를 가진 글자와 직접 작성.
- `메인 글자 1개 + 보조 글자 0개 이상`.
- 상황·목표·위험에 따른 주문 설계 판단.
- 입력 실패·문법 실패·상황 설계 실패·비용 부족 분리.
- 즉각적이고 설명 가능한 세계 변화.
- 학습→증명→표현→응용→발견·기록 순환.

## Vertical Slice

```text
첫 수업·교내 연습
→ 자유일정 A
→ 첫 실기시험
→ 자유일정 B
→ 학교축제
→ 자유일정 C
→ 첫 현장실습
→ 귀환·마도서 기록
```

- 목표 `45~50분`, 콘텐츠 상한 `53분`, 하드 상한 `60분`.
- 글자 `흐름 / 집중 / 분산`.
- 자유일정 `휴식 / 준비 / 교류`.
- 필수 성공 작성 7회, 안내형 복구 포함 목표 상한 10회.
- 같은 문제에서 확인한 글자는 Token으로 재선택 가능.
- 메인 동반 정령 초기 형상 1개, 수호형 보조 소환수 1체.
- 마도서는 과정·결과·부작용·발견을 기록하며 자동 주문 Stock이 아니다.

## 승인된 시각·전투 권위

- Art Style: `ART-STYLE-01 / APPROVED_A_MODIFIED_LOCKED`.
- Art Bible: `ART-BIBLE-01 / APPROVED_DUAL_STANDARD_ART_BIBLE`.
- Asset Spec: `ASSET-SPEC-01 / APPROVED_SPEC`.
- 잠긴 이미지 SHA-256: `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`.
- 원본 수정·재생성·리터치·재배치 금지.

화면 계약:

```text
Landscape 고정 3/4 Field
→ 같은 장소 Half-body Dialogue
→ Landscape Writing Overlay
→ 별도 3/4 Battle
→ Result
→ 원래 Field 변화 복귀
→ Landscape Grimoire 기록
```

- Soft Storybook 배경 + Anime Cel 캐릭터.
- Navy/Gold UI + 고대비 Blue Glyph.
- 우측 Writing Panel 축소 Rail→확장 Panel.
- Grimoire 파생 화면을 Main보다 먼저 설계.
- 기존 16:9 자료는 파생 기준이지만 Mobile 적합성 증거가 아니다.

전투:

- 강한 적 1개체, 일반 적 단일 페이즈.
- 다음 공격 예고·타이머→작성→`[구현]`→마나 검증·즉시 시전.
- 판단·작성 중 타이머 진행, 시스템 해결 중 정지.
- 작성 감속 `0.5×`는 `TEST_VALUE`, 보상 불이익 없음.
- 적은 HP 대신 `불안정도`, 0이면 진정·해결.
- 플레이어 HP 0 또는 치명적 환경 붕괴가 패배.
- 환경 보존도·부작용·남은 HP·해결 방식이 결과 품질을 만든다.

## GM-MOBILE-SESSION-RESUME-SAVE-01

Resume Anchor:

```text
첫 수업·교내 연습 → A
자유일정 A·실기시험 → B
자유일정 B·학교축제 → C
자유일정 C·현장 전투 → D
현장 환경·귀환·마도서 기록 → Slice Complete
```

상태:

```text
Draft → Recognizing → Candidate → Committed → Resolved → Recorded
```

- Transient Buffer·Session Snapshot·Persistent Transaction·Progress Save 분리.
- 중복 Commit·비용·피해·보상·Result·Record 0.
- 완료 획 보존, 미완성 획·stale Recognition 안전 폐기.
- 손상 Save는 직전 안전 Anchor로 복구하고 원인 표시.

## GM-MOBILE-LANDSCAPE-UX-FOUNDATION-01

Safe Root 5구역:

1. Objective / Threat / Timer.
2. Player Status.
3. World / Enemy / Situation Focus.
4. Writing Rail / Panel.
5. Confirm / Recovery / System Feedback.

보존 우선:

- 목표·치명 위험·Timer.
- HP·마나·불안정도.
- 작성 획·후보·오류 원인.
- Undo·취소·확정·`[구현]`.
- 저장·복구 상태.

시험값:

- Android 공식 하한 `48dp`, Apple 주요 Control `44pt`.
- 프로젝트 일반 `48 UI unit`, 핵심 `56 UI unit`.
- Rail `12~16%`, Full Writing `36~44%`.
- UI/Text Scale `100 / 115 / 130%`.
- 작성 감속 `1.0× / 0.5×`.
- Canvas 최소 크기·최종 허용치·Latency 미확정.

## GM-MOBILE-DEVICE-CLASS-01

사용자 승인 A안:

```text
Smartphone Landscape = 필수 지원·정식 품질 Gate
Tablet 4:3·3:2 = Best-effort Smoke Test
Tablet 전용 Layout·동일 품질·정식 지원 = 후속 Decision
```

Smartphone 필수 Matrix:

- `16:9`.
- `18:9`.
- `19.5:9`.
- `20:9`.
- 좌측 Cutout.
- 우측 Cutout.
- 하단 System indicator·gesture 영역.

Tablet Smoke:

- 실행·Landscape 고정.
- Safe Area·핵심 정보 판독.
- 기본 Touch·저장 중단복귀.
- 공통 저장 손상·중복 Commit·핵심 입력 불능은 Smartphone Gate 문제로 승격.

제외:

- Tablet 전용 4:3·3:2 Layout.
- 동일 품질·Store 정식 지원.
- Foldable·Multi-window·Portrait Tablet.
- Tablet 전용 Stylus 최적화.

## 완료된 작업

- Base v9.4 운영 계약 채택.
- 프로젝트 코어·Vertical Slice·Art Style·Art Bible·Battle Rules·Asset Spec 승인.
- `GM-PLATFORM-02 / Mobile 우선·PC 후속` main·Sheet 동기화.
- `GM-MOBILE-ORIENTATION-01 / Landscape 고정` 승인.
- `GM-MOBILE-SESSION-RESUME-SAVE-01` 계약 정의.
- `GM-MOBILE-LANDSCAPE-UX-FOUNDATION-01` 시험값 포함 계약 정의.
- `GM-MOBILE-DEVICE-CLASS-01 / Option A` 사용자 승인.
- PR #31 main `2aec512...` 병합.
- Sheet Main Readback PASS.
- Final Head Generator·Unit·JSON·Registry·Adversarial PASS.

## 현재 작업

```text
Smartphone Landscape Writing/Battle Wireframe 계약
→ Android/iOS·Store·최소 기기·성능 Decision Packet
→ MOBILE-FOUNDATION-01 통합 승인
```

세부 수치와 데이터는 `RECOMMENDED_DEFAULT / TEST_VALUE`로 작성한다. 핵심 방향·범위 충돌만 Grill Me로 사용자에게 질문한다.

## 후속 제품 작업

```text
MOBILE-FOUNDATION-01 승인
→ BOSS-PHASE-01·GRIMOIRE-SCREEN-01
→ AUDIO-DIRECTION-01
→ Mobile 기준 기획·아트·UX 통합 검수
→ 사용자 Codex Plan 승인
→ Codex read-only Plan·기술 검수
→ Validation-First 구현
```

## 미검증

- Smartphone Runtime·실기기·Aspect·Cutout·Touch.
- Tablet Smoke.
- Android/iOS·Store·최소 기기.
- Touch target·Canvas·Text scale·인식 알고리즘·허용치·지연의 최종값.
- Frame rate·Memory·Load·Battery·Thermal.
- 적 공격 간격·피해량·HP·마나·불안정도 변화량·수호 완화율.
- Accessibility·Human playtest·PC 적응.

제품 구현은 `MOBILE-FOUNDATION-01` 통합 승인과 구현 계획 전까지 시작하지 않는다.
