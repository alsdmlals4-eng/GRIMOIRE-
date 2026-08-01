# GRIMOIRE 현재 확정 결정 스냅샷

## 1. 상태

```yaml
status: ACTIVE_CANONICAL_DECISION_SNAPSHOT
project: "GRIMOIRE: 세계를 다시 쓰는 법"
baseline_date: 2026-08-01
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
main_sync: PENDING_PR_MERGE
```

최신 사용자 결정: `docs/planning/DECISION_LOG_ADDENDUM_2026-08-01F.md`.

## 2. 프로젝트 코어

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

비타협:

1. 의미를 가진 마법 글자.
2. `메인 글자 1개 + 보조 글자 0개 이상`.
3. 신규·미숙·중요 글자의 직접 작성.
4. 상황·목표·위험에 따른 주문 변형 판단.
5. 즉각적이고 설명 가능한 세계 변화.
6. 입력 실패·문법 실패·상황 설계 실패 분리.
7. 학습→증명→표현→응용→발견·기록 순환.

## 3. Vertical Slice

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
- 공통 `Situation Challenge`, 문제마다 유효 해법 2개 이상.
- 자유일정 `휴식 / 준비 / 교류` 3회.
- 글자 `흐름 / 집중 / 분산`.
- 필수 성공 작성 7회, 안내형 복구 포함 목표 상한 10회.
- 같은 문제의 확인된 글자 Token 재선택 허용.
- 명시적 시전 전 Undo·취소·재작성은 자원 미소모.

## 4. 인물·소환수

- 주인공: 일반 가정 출신 장학생 신입생, 정답 집착에서 책임 설계자로 성장.
- 교수: 의미·조건·책임을 가르치며 정답을 대신 제시하지 않음.
- 동급생: 정석·속도 중심 경쟁자이자 협력자.
- 메인 동반 정령: 작은 늑대형 원소 정령수, Slice 초기 형상 1개.
- 전투 보조: 수호형 1체, 글자 작성·조합·대상·시전을 대행하지 않음.
- 이름은 `NAMING-PASS-01`에서 세계 명명 규칙과 함께 확정하며 현재 Gate를 차단하지 않음.

## 5. 입력·마도서

- PC: LMB Drag 작성, Pen 보조.
- RMB/Esc 취소, Ctrl+Z Undo, R Hold Clear.
- Click/Wheel/Arrow/Tab 후보 이동, Click/Enter 확정.
- Gamepad: `DEFERRED / NOT_PROMISED`.
- 마도서 기록: 상황, 글자·조합, 의도, 결과, 부작용·희생, 발견, 플레이어 명명.
- 자동 최적 추천·기록 클릭 자동 시전 금지.

## 6. ART-STYLE-01

```yaml
status: APPROVED_A_MODIFIED_LOCKED
selected: Soft Storybook Cel 2D Hybrid A 수정안
locked_reference_sha256: b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a
```

원본 수정·재생성·리터치·크롭 대체·Text 교체·Panel 재배치·색 변경 금지.

## 7. ART-BIBLE-01

```yaml
status: APPROVED_DUAL_STANDARD_ART_BIBLE
authority: docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md
next_gate: ASSET-SPEC-01
```

승인 규칙:

- Soft Storybook Environment + Clean Anime Cel Character.
- Navy/Gold UI + High-contrast Blue Glyph.
- 고정 3/4 Field, 같은 장소 Half-body Dialogue, 별도 3/4 Battle, Result 후 Field 복귀.
- 고정 주인공 1명, 전투 상시 초상 1개.
- 동반 정령·수호 소환수는 상태 배지와 짧은 Cut-in/FX.
- Battle Writing Panel은 축소 Rail에서 작성 시 확장.
- 본문 고딕계, 제목 제한적 세리프계 방향.
- Grimoire 파생 화면을 Main보다 먼저 설계.
- 정확한 Pixel·Format·Font·Animation 수량은 Asset Spec에서 확정.

## 8. 전투 화면·조우

### GM-BATTLE-SCREEN-LAYOUT-01

```text
상단·중앙 = 적·환경 목표·공격 예고
좌측 하단 = 주인공 초상·HP·마나·상태
좌측 보조 = 동반 정령·수호 상태 배지
우측 = 직접 글자·마법진 작성 영역
```

아군·수호 소환수 몸체는 전장에 상시 배치하지 않는다.

### GM-BATTLE-SINGLE-ENEMY-FOCUS-01

- Vertical Slice 기본 전투는 강한 적 1개체.
- 잡몹·웨이브 기본 제외.
- 일반 적은 단일 페이즈.
- HP 스펀지 금지; 행동 예고·상태·환경 변화로 깊이 확보.

## 9. 전투 흐름·시간

### GM-BATTLE-ACTIVE-TIMER-INSTANT-CAST-PHASES-01

- 적은 일정 시간마다 공격.
- 플레이어는 작성 후 `[구현]`으로 유효성·마나 검증 뒤 즉시 시전.
- 마나 부족 시 시전하지 않고 Draft 유지.
- 일반 적 단일 페이즈, 보스만 다중 페이즈 허용.

### GM-BATTLE-TIME-FLOW-01

- 판단·작성 중 Timer `1.0×` 진행.
- 선택형 작성 감속 제공; 초기 Prototype 후보 `0.5×`, 최종값 미정.
- 시전·적 공격·보스 전환·Result 해결 중 `0×` 정지.
- Pause·Focus Lost·Blocking Tutorial은 정지.
- 먼저 유효 승인된 Event가 우선하며 동시 해결 금지.
- 적 공격이 먼저 확정되어도 작성 Draft 유지.

## 10. GM-BATTLE-RULES-01

```yaml
status: APPROVED_SITUATION_RESOLUTION_RULES
authority: docs/planning/BATTLE_RULES_01_APPROVAL_2026-08-01.md
```

- 기본 적에게 일반 HP를 두지 않고 `불안정도` 사용.
- 상황에 맞는 주문으로 불안정도 0에 도달하면 마지막 시전 결과로 진정·해결.
- 별도 포획·Finish·두 번째 게이지 없음.
- 주문 결과 축: 불안정도, 다음 공격 위험, 환경 상태, 부작용·희생.
- 플레이어 HP 0 또는 Situation이 선언한 치명적 환경 붕괴가 패배.
- 환경 보존도·남은 HP·부작용·해결 방식이 완전 성공·부분 성공의 결과 품질을 결정.
- 수호 소환수는 수동 발동해 다음 공격의 피해를 완화하고 Draft를 보호하지만 Timer를 정지하지 않음.

## 11. Base v9.3 운영

```yaml
release_commit: 30ca6c7b5f93521f0eb0eed42d01437cd43c50ae
evidence_commit: 462a86db192d23d0f386281a1eb54b0a8cbad62e
registry_sha256: 9847bb2b225c776ad7916930f0f48c490bc2a898bea8e02ea1fdd0e6caac60c1
canonical_adapter: skills/PROJECT_BASE_ADAPTER.json
generator: tools/generate_project_operating_views.py
```

- Snapshot·Compatibility View 직접 편집 금지.
- GitHub·Sheet 승인 정본 즉시 동기화.
- 작업 브랜치와 main 동기화 상태 분리.

## 12. 현재 Gate

| Gate | 상태 |
|---|---|
| 기획 | `APPROVED` |
| Art Style | `APPROVED_A_MODIFIED_LOCKED` |
| Art Bible | `APPROVED_DUAL_STANDARD_ART_BIBLE` |
| Battle Rules | `APPROVED_SITUATION_RESOLUTION_RULES` |
| Asset Spec | `NEXT_PRODUCT_GATE` |
| Boss Phase | `PARALLEL_DESIGN_GATE` |
| Grimoire/Main 파생 화면 | `PENDING_AFTER_ART_BIBLE` |
| Audio Direction | `PENDING_AFTER_ASSET_SPEC` |
| Codex | `BLOCKED` |
| Godot 구현 | `NOT_STARTED` |

## 13. PLAYTEST_TUNING_REQUIRED

- 적 공격 간격·피해량.
- 플레이어 HP·마나.
- 불안정도 변화량.
- 수호 완화율·사용 횟수·재충전.
- 환경 결과 임계값.
- 작성 감속 최종값·복귀 유예.
- 인식 허용치·보정·Latency.

실행 증거 전에는 위 값을 최종 확정하거나 검증 완료로 표시하지 않는다.
