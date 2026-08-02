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
queued_design_gates: BOSS-PHASE-01 / GRIMOIRE-SCREEN-01 / AUDIO-DIRECTION-01
implementation: NOT_STARTED
codex: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
orientation_authority_head: ebc3f8f38d4346cc8b5751f5981e3c5997d0b41b
orientation_main_commit: 0bb1f4e2ee48f426579228e716abdba7edcbfc9c
orientation_pr: 29
orientation_sheet_sync: SYNCED_TO_MAIN
orientation_sheet_readback: PASS
```

제품용 `project.godot`, Scene, Script, Resource, 게임 데이터, 런타임 Asset은 없다.

## 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ 이 문서
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/PLATFORM_MOBILE_FIRST_02_2026-08-02.md
→ docs/planning/MOBILE_ORIENTATION_01_APPROVAL_2026-08-02.md
→ docs/planning/TOTAL_PLANNING_ADVERSARIAL_AUDIT_2026-08-02.md
→ docs/planning/sync/GM-MOBILE-ORIENTATION-01-MAIN.md
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

## 승인된 시각·Asset 권위

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
- 고정 주인공 1명, 전투 상시 초상 1개.
- 동반 정령·수호 소환수 상태 배지.
- 우측 Writing Panel 축소→확장.
- Grimoire 파생 화면을 Main보다 먼저 설계.
- 기존 16:9 자료는 Landscape 파생 기준이지만 Mobile 적합성은 미검증이다.

## 전투 계약

```text
상단·중앙 = 강한 적 1개체·환경 목표·공격 예고
좌측 하단 = 주인공 초상·HP·마나·상태
좌측 보조 = 동반 정령·수호 상태 배지
우측 = 직접 글자·마법진 작성
```

- 일반 적은 단일 페이즈.
- 적은 일정 시간마다 공격.
- 작성 후 `[구현]`과 마나 검증을 거쳐 즉시 시전.
- 판단·작성 중 타이머 진행, 시스템 해결 중 정지.
- 선택형 작성 감속 초기 후보 `0.5×`는 `TEST_VALUE`.
- 기본 적은 HP 대신 `불안정도`를 사용하며 0이면 진정·해결.
- 플레이어 HP 0 또는 치명적 환경 붕괴가 패배.
- 환경 보존도·부작용·남은 HP·해결 방식은 결과 품질을 만든다.
- 수호 소환수는 다음 공격 피해를 완화하지만 타이머·작성·판단을 대행하지 않는다.

## GM-PLATFORM-02

- 1차 플랫폼: `Mobile`.
- 후속 플랫폼: `PC`.
- 기존 `GM-PLATFORM-01 / PC 우선·Mobile 후속`은 `SUPERSEDED`.
- Touch·Stylus 직접 작성과 화면 내 Undo·부분 삭제·초기화·취소·확정·구현을 우선한다.
- Mouse/Pen/Keyboard는 후속 PC 적응 자료다.

## GM-MOBILE-ORIENTATION-01

- Mobile Vertical Slice 전체 `Landscape 고정`.
- Main·Field·Dialogue·Schedule·Writing·Battle·Result·Grimoire·Settings에 적용.
- Portrait Gameplay·혼합 방향·Runtime 자동 회전 제외.
- 직접 작성 Canvas와 적 위험·상태·작성 정보 동시 판독을 우선.
- 기존 16:9 자료는 파생 기준으로 보존하되 실기기 검증을 대체하지 않음.
- 지원 Aspect·Safe Area·Touch target·Canvas·Text scale은 Mobile Foundation에서 시험값으로 작성.
- Portrait 지원은 별도 Decision 없이는 추가하지 않음.

## Resume·Save 권장 기본안

전체 콘텐츠와 46분 목표는 유지하면서 핵심 경계에 Resume Anchor를 둔다.

```text
첫 수업·교내 연습
→ Anchor A
→ 자유일정 A·실기시험
→ Anchor B
→ 자유일정 B·학교축제
→ Anchor C
→ 자유일정 C·현장 전투
→ Anchor D
→ 현장 환경·귀환·마도서 기록
```

상태 소유권 후보:

```text
Draft → Recognizing → Candidate → Committed → Resolved → Recorded
```

- Commit·Reward·Result·Record는 각각 한 번만 확정.
- interrupted stroke·stale recognition은 안전하게 폐기하거나 복구 이유 표시.
- 이어하기는 마지막 완료 Anchor 또는 복구 가능한 현재 단계에서 시작.

## 완료된 작업

- Base v9.4 운영 계약 채택.
- GitHub·27개 Sheet 탭 감사.
- 프로젝트 코어·Vertical Slice·Art Style·Art Bible·Battle Rules·Asset Spec 승인.
- `GM-PLATFORM-02 / Mobile 우선·PC 후속` main·Sheet 동기화.
- `GM-MOBILE-ORIENTATION-01 / Landscape 고정` 승인.
- 방향 미확정과 가로형·16:9 활성 소비자의 P0 충돌 해결.
- PR #29 main `0bb1f4e...` 병합.
- Sheet `00·02·04·10·60·99` 관련 범위 main SHA Readback PASS.
- PR #29 Generator·Unit·JSON·Registry·Adversarial PASS.

## 현재 작업

```text
Resume Anchor·Save Ownership 명세
→ Landscape Aspect·Safe Area·Touch 정보 위계
→ 작은 화면 Writing/Battle 레이아웃 후보
→ MOBILE-FOUNDATION-01 통합 계약
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

## MOBILE-FOUNDATION-01 범위

- Resume Anchor·Save Ownership.
- Landscape 지원 Aspect·Safe Area·Notch·System gesture.
- Touch·Stylus 입력·복구·확정 상태 계약.
- 작은 화면 Battle/Writing 정보 위계와 가림 방지.
- App pause/resume·background/foreground·interrupted stroke·stale request 방어.
- Device·Memory·Texture·load·frame pacing·battery·thermal 측정 계획.
- 후속 PC 입력 적응 원칙.

## 미검증

- Android/iOS·Store·지원 Aspect·최소 기기.
- Touch target·Canvas·Text scale·인식 알고리즘·허용치·지연.
- 적 공격 간격·피해량·HP·마나·불안정도 변화량·수호 완화율.
- 환경 결과 임계값.
- Godot Runtime·Mobile device·PC 적응·Performance·Accessibility·Human.

제품 구현은 기획 완료 Gate와 사용자 승인 전까지 시작하지 않는다.
