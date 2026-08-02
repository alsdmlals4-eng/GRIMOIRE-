# GRIMOIRE Active Context

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: chatgpt/grimoire-mobile-first-canon-20260802
pull_request: 27
primary_platform: Mobile
follow_up_platform: PC
platform_decision: GM-PLATFORM-02
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
human_validation: NOT_RUN
canon_sync_state: SYNCED_TO_WORKING_BRANCH
sync_bundle: GR-SYNC-20260802-07
authority_commit: b9279e8c690a8406035675ebbe8a007e9b3f093f
verified_code_head: 3aa1b7cd2bd49362e20982f63abb8182345e14c0
sheet_readback: PASS
generator_check: PASS
unit_json_registry_checks: PASS
adversarial_gate: PASS
main_baseline_commit: 3ecf67cb9e39145976c66cb1f0bc2c42d9c17d03
main_sync: PENDING_USER_REVIEW_AND_MERGE
```

제품용 `project.godot`, Scene, Script, Resource, 게임 데이터, 런타임 Asset은 없다.

## 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ 이 문서
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/PLATFORM_MOBILE_FIRST_02_2026-08-02.md
→ docs/planning/sync/GR-SYNC-20260802-07-WORKING.md
→ 질문 주제의 승인 책임 원본
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ skills/PROJECT_BASE_ADAPTER.json
```

## 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

비타협 코어:

- 의미를 가진 글자와 직접 작성.
- `메인 글자 1개 + 보조 글자 0개 이상`.
- 상황·목표·위험에 따른 주문 설계 판단.
- 입력 실패·문법 실패·상황 설계 실패 분리.
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
고정 3/4 Field
→ 같은 장소 Half-body Dialogue
→ Writing Overlay
→ 별도 3/4 Battle
→ Result
→ 원래 Field 변화 복귀
→ Grimoire 기록
```

- Soft Storybook 배경 + Anime Cel 캐릭터.
- Navy/Gold UI + 고대비 Blue Glyph.
- 고정 주인공 1명, 전투 상시 초상 1개.
- 동반 정령·수호 소환수 상태 배지.
- 우측 Writing Panel 축소→확장.
- Grimoire 파생 화면을 Main보다 먼저 설계.
- 기존 16:9·PC 해상도 기준은 승인 Asset 기준이지만 Mobile 적합성은 미검증이다.

## 전투 계약

```text
상단·중앙 = 강한 적 1개체·환경 목표·공격 예고
좌측 하단 = 주인공 초상·HP·마나·상태
좌측 보조 = 동반 정령·수호 상태 배지
작성 영역 = 직접 글자·마법진 작성
```

- 일반 적은 단일 페이즈.
- 적은 일정 시간마다 공격.
- 작성 후 `[구현]`과 마나 검증을 거쳐 즉시 시전.
- 판단·작성 중 타이머 진행, 시스템 해결 중 정지.
- 기본 적은 HP 대신 `불안정도`를 사용하며 0이면 진정·해결.
- 플레이어 HP 0 또는 치명적 환경 붕괴가 패배.
- 환경 보존도·부작용·남은 HP·해결 방식은 결과 품질을 만든다.
- 수호 소환수는 다음 공격 피해를 완화하지만 타이머·작성·판단을 대행하지 않는다.

## GM-PLATFORM-02

- 1차 플랫폼: `Mobile`.
- 후속 플랫폼: `PC`.
- 기존 `GM-PLATFORM-01 / PC 우선·Mobile 후속`은 `SUPERSEDED`.
- Touch·Stylus 직접 작성과 화면 내 명시적 Undo·부분 삭제·초기화·취소·확정·구현을 재설계한다.
- Mouse/Pen/Keyboard는 후속 PC 적응 자료다.
- Android/iOS, Store, Landscape/Portrait, 최소 기기, 성능 수치, 인식 처리 방식은 미확정이다.

## Base v9.4 운영체계

```yaml
release_commit: a728712cb776ec98f4875914a580fcf7d0156593
evidence_commit: ef1fba11167e4da0b298123b0c85ebd268191a42
finalization_commit: 87a0b54c2847ce4b685879209205957c170cc1cd
registry_sha256: 693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59
canonical_adapter: skills/PROJECT_BASE_ADAPTER.json
canonical_adapter_sha256: 5df9840dd07b0cb93132471d9a2c7e12cc7ebf4d581c8f5cac8c3c26689aacdb
generator: tools/generate_project_operating_views.py
generated_views: CURRENT
```

Snapshot과 Compatibility View는 Generator 생성물이며 직접 편집하지 않는다.

## 완료된 작업

- Base v9.4 운영 계약 채택(PR #26, main `3ecf67c...`).
- 프로젝트 GitHub·27개 Sheet 탭 감사.
- Art Style, Art Bible, 전투 화면·시간·승패 규칙 승인.
- Asset Spec 승인 및 main·Sheet 동기화(PR #24·#25).
- 프로젝트 코어·Vertical Slice·잠긴 시각 기준 보존.
- `GM-PLATFORM-02` GitHub authority와 Sheet 14개 탭 동기화·Readback PASS.
- `60_UX_UI_접근성`의 `GR-UX-13/14` 위치 오류 적대적 교정.
- Generator의 PC·Asset Spec Gate 하드코딩 제거.
- 생성 Snapshot·Compatibility View 재생성.
- PR #27 Generator·Unit·JSON·Registry·Adversarial CI PASS.
- Issue #9 Mobile-first 검증 범위 갱신, Issue #16 완료 처리.

## 현재 작업

Sync Bundle `GR-SYNC-20260802-07`은 `SYNCED_TO_WORKING_BRANCH`다.

남은 운영 작업:

- 사용자 Draft PR #27 검토.
- 승인 시 main 병합.
- 병합 뒤 main·Sheet 재검증과 `SYNCED_TO_MAIN` 영수증.

## 다음 제품 작업

```text
MOBILE-FOUNDATION-01
→ BOSS-PHASE-01·Grimoire/Main 파생 화면 영향 재검토
→ AUDIO-DIRECTION-01
→ Mobile 기준 기획·아트·UX 통합 검수
→ Codex Plan 승인·기술 검수
→ Validation-First 구현
```

## MOBILE-FOUNDATION-01 범위

- Touch·Stylus 입력·복구·확정 상태 계약.
- 방향·비율·Safe Area·Notch·System gesture 결정 패킷.
- 작은 화면 Battle/Writing 정보 위계와 가림 방지.
- App pause/resume·background/foreground·interrupted stroke·stale request 방어.
- Device·Memory·Texture·load·frame pacing·battery·thermal 측정 계획.
- 후속 PC 입력 적응 원칙.

## 미검증

- Mobile OS·Store·방향·최소 기기.
- Touch target·Canvas 크기·인식 알고리즘·허용치·지연.
- 적 공격 간격·피해량·HP·마나·불안정도 변화량·수호 완화율.
- 환경 결과 임계값.
- Godot Runtime·Mobile device·PC 적응·성능·접근성·사람 플레이.

PR #27은 Draft이며 자동 병합하지 않는다.
