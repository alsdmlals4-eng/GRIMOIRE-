# GR-AUD-PLANNING-REMAINDER-20260802-01 — 정수 소환수·자연충전 Stock 이후 잔여 기획 감사

## 1. 감사 상태

```yaml
audit_id: GR-AUD-PLANNING-REMAINDER-20260802-01
baseline_main: 50a00f9f4ec992338a93e3dc75726b5bc6075a8b
status: COMPLETE_REVISED
p0_open: 0
p1_open: 4
p2_open: 12
p3_deferred: 8
implementation: NOT_STARTED
codex_execution: BLOCKED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

## 2. 핵심 결론

GRIMOIRE의 핵심 재미·전체 구조·Stock·소환수 방향은 유지 가능하다.

이번 재검토에서 확인된 가장 큰 충돌은 다음이었다.

```text
기존 책임 원본
= 완성 주문·하위 글자 준비 Stock 자연충전

PR #51 초기안
= 확인 글자 Token Rack 4칸
```

두 구조는 같은 `[Stock]` 이름을 사용하지만 책임과 플레이 흐름이 다르다. 사용자의 `Stock 자연생성 시간` 설명은 기존 자연충전형 책임 원본과 일치하므로 Token Rack 초안을 폐기하고 기존 구조를 복원했다.

## 3. 이번에 닫힌 항목

### 3.1 Cold-start 정본

직접 교정:

- `START_HERE.md`.
- `docs/ACTIVE_CONTEXT.md`.
- `docs/DEVELOPMENT_GATES.md`.
- `docs/DESIGN_DOCUMENT_REGISTRY.json`.

### 3.2 Stock 상세

```yaml
stock_types: FULL_SPELL_AND_SUB_GLYPH
shared_capacity: 8
one_glyph_charge_seconds: 10
additional_glyph_seconds: 5
active_charge_targets: 1
stock_use_mana_cost: 0
offline_charge: false
```

### 3.3 소환수 상세

```yaml
main_summon: ALWAYS_ACTIVE
additional_active_cap: 1
duration_limit: NONE
cooldown: NONE
summon_spell_mana_cost: 2
support_cycle_seconds: 5
stats:
  stock: INTEGER
  defense: INTEGER
  attack: INTEGER
  heal: INTEGER
```

### 3.4 State/Ledger/Save

`GM-STOCK-SUMMON-STATE-INTERFACE-01`에서 다음을 닫았다.

- Stock 편성·충전 상태 소유권.
- 메인·추가 소환 상태.
- 정수 스탯 파생 공식.
- 소환·Stock 사용 Transaction.
- Exactly-once Event ID.
- 동일 시각 Event 순서.
- Save/Resume 필드와 Offline 금지.

## 4. P0 — 즉시 중단 수준

```yaml
p0_open: 0
```

제품 코드 실행은 여전히 별도 Execution Readiness가 차단한다.

## 5. P1 — 구현 준비 전에 남은 4개

### P1-01 — Mobile HUD Wireframe

동시에 보여야 하는 정보:

- 전체 Stock 준비 용량 `현재/8`.
- 지정 충전 대상·현재/최대·남은 초.
- 활성 `[스톡]` 합계와 다음 5초 주기.
- 메인·추가 소환수 상태.
- `[방어도]·[공격]·[치유]` 정수값.
- 적 의도·불안정도·환경·HP·마나.
- Writing Panel·후보·Commit.

Phone Landscape와 Text Scale 130에서 정보가림이 없어야 한다.

### P1-02 — TDD Plan·Test Matrix 연결

설계 문서의 상태와 Event를 실제 테스트 이름·Given/When/Then으로 연결해야 한다.

필수:

- 소환 교체 Transaction 롤백.
- Stock 사용 Transaction 롤백.
- 중복 `summon_event_id`·`stock_charge_event_id` 0.
- Background Clock 0 진행.
- 방어도 최소 피해 1.
- 공격 불안정도 하한 1.
- 치유 초과 저장 0.
- Save/Resume 뒤 상주 소환 유지.

### P1-03 — Godot Toolchain Preflight

- Godot binary·version.
- renderer.
- headless test 실행.
- Mobile export template.
- 프로젝트 생성 전 경로·권한.

### P1-04 — Base v9.4.3 Plan 재검증·Execution Readiness

- 최종 main 기준 Implementation Plan 재검증.
- State Interface와 기존 Foundation POC 범위 연결.
- `GM-FOUNDATION-POC-EXECUTION-READINESS-01`.
- P0=0·P1=0일 때만 코드 실행.

## 6. P2 — Vertical Slice 제작 전에 남은 12개

### P2-01 — Battle Tuning

- 플레이어 HP·마나.
- 적 불안정도.
- 적 공격 간격·피해.
- `[방어도]·[공격]·[치유]` 정수 스케일.
- 소환 비용 마나 2의 실제 기회비용.

### P2-02 — Result Grading

- 환경 보존도 임계값.
- 완전·부분·피해 감수 성공.
- 소환수 기여 표시와 결과 등급 처리.

### P2-03 — 대표 제작 미니게임

권장: `촉매 배합·안정화 1개`를 실제 구현하고 나머지는 Preview.

### P2-04 — 현장실습 Slice 포함 수

권장: 추가 선택형 전투는 실제 플레이에서 제외하고 Preview만 제공.

### P2-05 — Grimoire Screen

- 준비 Stock과 영구 기록 분리.
- 소환수 정수 기여 기록.
- 결과 태그·학기 평가 근거.

### P2-06 — Main Screen

- 새 게임·이어하기·설정.
- Save 손상·빈 Save·Resume 상태.

### P2-07 — Audio Direction

- Stock 충전·완성·사용.
- `[소환 주문]`·귀환·5초 주기 예고.
- 공격·방어·치유·오류 피드백.

### P2-08 — 접근성·난이도

- 작성 보조 감속.
- 대체 입력.
- 주기 정보의 시각·음향·진동 대체.
- 운동 제약 사용자의 Stock 운용.

### P2-09 — Year-One Chapter Map

- 1학년 3학기.
- 6~8 Chapter.
- 새 원리·일상 응용·현장 책임·복기.

### P2-10 — 커리큘럼·글자 Catalog

- Year-One 계열 수.
- 계열별 기초·심화 글자.
- 수강 슬롯·전문화 시점.

### P2-11 — 성장·평가·경제

- 준비 용량 성장.
- 소환수 스탯 성장.
- 포트폴리오 가중치.
- 재료·레시피·인벤토리.

### P2-12 — Slice 시간 예산

- 장면별 목표 시간.
- 실제/Mock/Preview 구분.
- 대사·이동·작성·제작·전투·결과 시간.

## 7. P3 — Slice 이후

1. Boss 다중 페이즈.
2. 추가 소환 슬롯.
3. 전체 소환수 Roster·성장·탑승.
4. 2·3학년 Chapter·상급 연구.
5. Full Game 실제 콘텐츠 수량.
6. Save Migration.
7. Store·사업화·PC Adaptation.
8. 최종 Art·Audio·Asset 대량 제작.

## 8. 적대적 위험

### 자연충전 대기 플레이

- 적 Attack Timer가 같은 Active Pressure Clock으로 진행한다.
- 소환수 `[스톡]`은 대상 변경을 하지 않는다.
- 무압박 장면에서는 충전과 행동이 정지한다.

### 상시 방어 무적

```text
최종 직접 피해 = max(1, 원피해 - 총 방어도)
```

### 자동 공격의 핵심 재미 침식

- 공격은 상황 태그가 유효해야 한다.
- 불안정도 하한은 `1`이다.
- 마지막 해결 Event는 플레이어가 담당한다.

### Save/Resume 중복

- `summon_event_id`·`stock_charge_event_id`·Transaction ID를 저장한다.
- Background 경과 Event를 만들지 않는다.

## 9. 다음 순서

```text
1. Mobile HUD Wireframe
2. TDD Plan·Test Matrix
3. Godot Toolchain preflight
4. Base v9.4.3 Plan 재검증
5. Execution Readiness
6. Foundation POC 여부 판단
```

## 10. 최종 판정

```yaml
core_concept: APPROVED_AND_COHERENT
stock_model: NATURAL_CHARGE_RESTORED
summon_model: PERSISTENT_INTEGER_STATS_APPROVED
state_interface: APPROVED_DESIGN_ONLY
planning_complete_for_full_vertical_slice: false
planning_sufficient_for_foundation_poc_plan: true
execution_ready: false
```
