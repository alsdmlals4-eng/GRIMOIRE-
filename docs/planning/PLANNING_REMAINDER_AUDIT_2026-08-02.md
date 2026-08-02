# GR-AUD-PLANNING-REMAINDER-20260802-01 — Stock·소환수 상세화 이후 잔여 기획 감사

## 1. 감사 상태

```yaml
audit_id: GR-AUD-PLANNING-REMAINDER-20260802-01
baseline_main: 50a00f9f4ec992338a93e3dc75726b5bc6075a8b
status: COMPLETE
p0_open: 0
p1_open: 7
p2_open: 12
p3_deferred: 8
implementation: NOT_STARTED
codex_execution: BLOCKED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

## 2. 결론

GRIMOIRE의 핵심 재미·전체 게임 Macro Loop·Chapter 기능·다계열 성장·보상·실패 평가·3학년 범위는 방향 수준에서 승인되어 있다.

그러나 다음은 아직 완결되지 않았다.

> 시스템을 더 추가하는 문제가 아니라, 승인된 시스템들이 어떤 데이터와 수치로 연결되고 Vertical Slice에서 무엇을 실제로 증명할지 닫는 작업이 남아 있다.

가장 위험한 미완료 영역은 `직접 작성 ↔ Stock ↔ 소환수 ↔ 적 타이머 ↔ Save/Resume ↔ 결과 Ledger`의 인터페이스다.

## 3. P0 — 즉시 작업 중단 수준

```yaml
p0_open: 0
```

현재 승인 문서만 작성하는 것은 가능하다. 제품 코드 실행은 별도 Execution Readiness가 계속 차단한다.

## 4. P1 — 다음 구현 준비 전에 반드시 닫을 항목

### P1-01 — Cold-start 권위 문서 직접 교정

대상:

- `docs/ACTIVE_CONTEXT.md`
- `docs/DEVELOPMENT_GATES.md`
- `docs/DESIGN_DOCUMENT_REGISTRY.json`

현재 문제:

- 과거 첫 실기시험·수동 수호 소환수·이전 main/Sync가 남아 있다.
- Registry는 PC 우선·Base v9.3·ASSET-SPEC Gate를 가리킨다.
- 최신 핵심 계층·Stock·소환수·Base v9.4.3·main 상태와 충돌한다.

판정: `CANON_RECONCILIATION_REQUIRED`.

### P1-02 — Stock 상세 계약

상태: `GM-STOCK-SYSTEM-01` 권장 기본값 작성 완료.

남은 검증:

- Rack·Anchor floor·직접 작성 비율이 핵심 필기 경험을 보존하는지.
- Token 소비와 Result Ledger의 원자성.
- Save/Resume·Pending 교체·Anchor 재진입 악용.

### P1-03 — 소환수 상세 계약

상태: `GM-SUMMON-SYSTEM-01` 권장 기본값 작성 완료.

남은 검증:

- 주기 지원이 대기 플레이를 만들지 않는지.
- 메인 상시 지원이 다른 선택의 상위호환이 아닌지.
- 자동 주문 기여 상한과 보호율.
- 이전 Battle Rules 수동 소환 규칙의 직접 대체 반영.

### P1-04 — Stock·Summon 상태·Ledger·Save Schema

필수 소유권:

- `stock_token_id`
- `stock_source`
- `anchor_stock_floor_applied`
- `pending_stock`
- `summon_event_id`
- `active_summon_id`
- `remaining_active_pressure`
- `next_tick_remaining`
- `actions_applied`
- `resummon_cooldown`

상태·Transaction 계약이 설계 문서와 TDD Plan에 직접 연결돼야 한다.

### P1-05 — Vertical Slice 작성·자동화 예산 재산정

기존 `직접 작성 7회`를 그대로 유지하면 Stock·소환수의 피로 완화 목적과 충돌한다.

권장 예산:

```text
의미 있는 주문 해결 7~10회
직접 작성 4~6회
Stock 보조 2~4회
소환수 자동 행동 1~3회
```

시간 예산 46분 목표·53분 상한에서 다시 검증해야 한다.

### P1-06 — Stock·Summon Mobile HUD 계약

필수 표시:

- Stock 4칸과 Pending 상태.
- 메인 소환수 READY·다음 Tick.
- 활성 보조 소환수·남은 시간·다음 행동.
- 자동 주문 대상 규칙.
- 재소환 대기시간.
- Result·Grimoire 기여 출처.

기존 Writing Panel과 적·환경·타이머를 가리지 않아야 한다.

### P1-07 — Stock·Summon 전용 검증 항목

필수 Test:

1. 직접 작성 비율과 피로.
2. Stock 소비·취소·마나 부족 원자성.
3. Anchor reload 반복 보정 방지.
4. 소환수 Pause·Background·Save/Resume Tick.
5. 자동 주문의 승리 종결 차단.
6. 무한 Stock·재소환 Cooldown 우회.
7. Main+Secondary 상태의 작은 화면 판독.

## 5. P2 — Vertical Slice 콘텐츠 제작 전에 닫을 항목

### P2-01 — BATTLE-TUNING-01

- 적 공격 간격.
- 플레이어 HP·마나.
- 적 불안정도.
- 글자별 변화량.
- 공격 피해와 상태 효과.
- 소환 비용·자동 주문 출력과의 조합.

### P2-02 — RESULT-GRADING-01

- 환경 보존도 임계값.
- 완전·부분·피해 감수 성공 구분.
- 소환수 자동 기여가 결과 등급에 미치는 방식.

### P2-03 — Slice 대표 제작 미니게임 확정

현재 후보:

- 문자 획·마력 보정.
- 재료 식별.
- 촉매 배합·안정화.

권장: `촉매 배합·안정화 1개`를 대표로 확정하고 다른 후보는 Preview 또는 본편으로 미룬다.

### P2-04 — 자유일정 현장실습 Slice 포함 수

현재 포함 횟수가 미정이다.

권장: 46~53분 Internal Slice에는 추가 선택형 전투를 넣지 않고, 선택 카드·결과 Preview로만 보여 준다. 실제 전투는 첫 현장실습 1회로 집중한다.

### P2-05 — Grimoire Screen

- Stock Rack과 영구 기록의 명확한 분리.
- 결과 태그·학기 평가 근거.
- 소환수 기여 기록.
- 상황·글자·의도·결과·부작용·발견 탐색.

### P2-06 — Main Screen

- 새 게임·이어하기·설정.
- Resume 상태·손상 Save·빈 Save.
- 수집형 로비 UI 금지.

### P2-07 — Audio Direction

- 획·후보·Stock 획득·Token 소비.
- 소환·Tick 예고·자동 주문·Ready 상태.
- 적 공격·불안정도·결과·오류 피드백.
- 무음·진동 해제 대체.

### P2-08 — 접근성·난이도 기본 정책

- 작성 보조 감속 기본 OFF 유지 여부.
- 직접 작성 대체 입력의 범위.
- 반복 피로·운동 제약 사용자의 Stock floor.
- 소환수 Tick 정보의 시각·음향·진동 대체.

### P2-09 — Year-One Chapter Map

방향은 `6~8 Chapter 후보`지만 실제 Chapter 목록·학기별 질문·사건·복기 연결이 없다.

필요:

- 1학년 3학기 구조.
- Chapter별 새 원리·일상 응용·현장 책임.
- 동반자·교수·동급생 관계 변화.
- 첫 독자 원리 결말.

### P2-10 — 커리큘럼 숫자와 글자 Catalog

- Year-One 계열 수.
- 계열별 기초·심화 글자 수.
- 공통 문법과 계열 전용 문법.
- 수강 슬롯 수.
- 전문화 시점.
- 공통 사건 재사용 규칙.

### P2-11 — 성장·평가·경제 기본값

- 포트폴리오 증거 가중치.
- 숨김 감점 상한.
- 학기말 등급 경계.
- 자유일정 창 수.
- 재료·레시피·인벤토리 상한.
- 반복 보상 감쇠.

### P2-12 — Slice 콘텐츠 예산

현재 대표 시스템 요구가 많다.

필수 재산정:

- 장면별 목표 시간.
- 실제/Mock 구분.
- 대사·이동·작성·제작·전투·결과 시간.
- 감량 우선순위.

## 6. P3 — Vertical Slice 검증 후 결정해도 되는 항목

1. Boss 다중 페이즈 상세.
2. 소환수 4단계 성장·탑승.
3. 전체 소환수 Roster와 획득 방식.
4. 2·3학년 상세 Chapter·상급 연구.
5. Full Game 12~18+ Chapter·5+계열 실제 수량.
6. Year-One 저장의 Full Game 승계·Migration.
7. Store·사업화·최소 기기·PC Adaptation 출시 상세.
8. 최종 Art·Audio·Asset 대량 제작량.

## 7. 문서·Sheet 정합성 추가 발견

- `01_작업순서`의 Grill merge cadence 일부 행이 과거 counter와 pending을 유지한다.
- 여러 과거 Decision 행은 `main pending` 상태로 남아 있어 최신 완료 행과 혼재한다.
- `51_미니게임` 일부 입력이 PC Mouse·Keyboard 우선으로 남아 있다.
- `ACTIVE_CONTEXT`와 `DEVELOPMENT_GATES`는 별도 시험·수동 수호 계약을 유지한다.
- `DESIGN_DOCUMENT_REGISTRY`는 PC 우선·Base v9.3이다.

이 항목은 기획 변경이 아니라 최신 정본으로의 교정이다.

## 8. 적대적 우선순위

```text
1. Cold-start 정본 직접 교정
2. Stock·Summon 상세 Decision 동기화
3. State/Ledger/Save 인터페이스
4. 작성·자동화·시간 예산
5. Mobile HUD·검증 항목
6. Slice 제작 미니게임·콘텐츠 범위
7. Battle/Result 수치
8. Grimoire/Main/Audio
9. Year-One Chapter·커리큘럼·성장경제
10. 실행 준비 Gate
```

## 9. 최종 판정

```yaml
core_concept: APPROVED_AND_COHERENT
system_taxonomy: APPROVED
stock_detail: RECOMMENDED_DEFAULTS_DEFINED
summon_detail: RECOMMENDED_DEFAULTS_DEFINED
planning_complete_for_full_vertical_slice_production: false
planning_sufficient_for_foundation_poc_design: true
execution_ready: false
```

기획의 큰 방향을 다시 열 필요는 없다. 다만 P1을 닫지 않고 구현에 들어가면 Stock·소환수·타이머·저장의 소유권 충돌을 코드에서 임의로 결정하게 된다.
