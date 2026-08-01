# GRIMOIRE Active Context

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
primary_platform: PC
follow_up_platform: Mobile
engine_baseline_candidate: Godot 4.7.1 stable
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE
work_mode: PLAN
planning: APPROVED
art_style_01: APPROVED_A_MODIFIED_LOCKED
art_bible_01: APPROVED_DUAL_STANDARD_ART_BIBLE
battle_rules_01: APPROVED_SITUATION_RESOLUTION_RULES
next_product_gate: ASSET-SPEC-01
parallel_design_gate: BOSS-PHASE-01
implementation: NOT_STARTED
codex: BLOCKED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
canon_sync_state: SYNCED_TO_MAIN
authority_main_commit: a088252349bee94cecef94b216c8cc5e0b9162cb
```

제품용 `project.godot`, Scene, Script, Resource, 게임 데이터, 런타임 Asset은 없다.

## 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ 이 문서
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG_ADDENDUM_2026-08-01F.md
→ 질문 주제의 승인 책임 원본
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ skills/PROJECT_BASE_ADAPTER.json
```

## 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

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
- 메인 동반 정령 초기 형상 1개.
- 수호형 보조 소환수 1체.
- 마도서는 과정·결과·부작용·발견을 기록하며 자동 주문 Stock이 아니다.

## 잠긴 비주얼 권위

- Decision: `ART-STYLE-01 / APPROVED_A_MODIFIED`.
- Art Bible: `ART-BIBLE-01 / APPROVED_DUAL_STANDARD_ART_BIBLE`.
- SHA-256: `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`.
- 원본 수정·재생성·리터치·재배치 금지.

### 화면 계약

```text
고정 3/4 Field
→ 같은 장소 Half-body Dialogue
→ Writing Overlay
→ 별도 3/4 Battle
→ Result
→ 원래 Field 변화 복귀
→ Grimoire 기록
```

### Art Bible 핵심

- Soft Storybook 배경 + 선명한 Anime Cel 캐릭터.
- Navy/Gold UI + 고대비 Blue Glyph.
- 고정 주인공 1명, 전투 상시 초상 1개.
- 동반 정령·수호 소환수 상태 배지.
- 우측 Writing Panel은 축소 Rail에서 작성 시 확장.
- 본문 고딕계, 제목 제한적 세리프계 방향.
- Grimoire 파생 화면을 Main보다 먼저 설계.
- 정확한 Pixel·Format·Font·Animation 수량은 `ASSET-SPEC-01`.

## 전투 계약

### 화면

```text
상단·중앙 = 강한 적 1개체·환경 목표·공격 예고
좌측 하단 = 주인공 초상·HP·마나·상태
좌측 보조 = 동반 정령·수호 상태 배지
우측 = 직접 글자·마법진 작성
```

아군·수호 소환수 몸체는 전장에 상시 배치하지 않는다.

### 흐름

- 적은 일정 시간마다 공격.
- 작성 후 `[구현]` 승인과 마나 검증을 거쳐 즉시 시전.
- 판단·작성 중 타이머 진행.
- 시전·적 공격·보스 전환 해결 중 타이머 정지.
- 선택형 작성 감속 제공, 초기 Prototype 후보 `0.5×`, 최종값 미정.
- 일반 적은 단일 페이즈.

### 승패

- 적의 기본 상태는 HP가 아니라 `불안정도`.
- 상황에 맞는 주문으로 불안정도 0에 도달하면 진정·해결.
- 플레이어 HP 0 또는 선언된 치명적 환경 붕괴가 패배.
- 환경 보존도·부작용·남은 HP·해결 방식은 결과 품질을 만든다.
- 수호형 소환수는 다음 공격의 피해를 완화하지만 타이머·작성·판단을 대행하지 않는다.

## Base v9.3 운영체계

```yaml
release_commit: 30ca6c7b5f93521f0eb0eed42d01437cd43c50ae
evidence_commit: 462a86db192d23d0f386281a1eb54b0a8cbad62e
registry_sha256: 9847bb2b225c776ad7916930f0f48c490bc2a898bea8e02ea1fdd0e6caac60c1
canonical_adapter: skills/PROJECT_BASE_ADAPTER.json
generator: tools/generate_project_operating_views.py
```

Snapshot과 Compatibility View는 생성물이며 직접 편집하지 않는다.

## 완료된 운영 작업

- Base `main` 구조와 v9.3 Release·Evidence Pin 확인.
- 프로젝트 GitHub·27개 Sheet 탭 전수 감사.
- 콜드 스타트·Registry·Adapter·Generated View·CI 교정.
- Art Bible과 상황 해결형 Battle Rules 승인·정본화.
- PR #22를 main Merge Commit `a088252349bee94cecef94b216c8cc5e0b9162cb`로 병합.
- CI `ci-gate`·`adversarial-gate` 성공.
- main 권위와 Google Sheet Readback 성공.
- 최종 영수증: `docs/planning/sync/GR-SYNC-20260801-05-MAIN.md`.

## 다음 제품 작업

```text
ASSET-SPEC-01
→ BOSS-PHASE-01·Grimoire/Main 파생 화면
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ Codex Plan 승인·기술 검수
→ 구현
```

## 미검증

- 적 공격 간격·피해량·플레이어 HP·마나.
- 불안정도 변화량.
- 수호 완화율·사용 횟수.
- 환경 결과 임계값.
- 실제 인식 알고리즘·허용치·지연.
- Godot Runtime·PC 입력·Mobile·성능·접근성·사람 플레이.
