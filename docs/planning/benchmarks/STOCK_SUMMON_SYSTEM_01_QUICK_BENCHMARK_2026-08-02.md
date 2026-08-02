# GR-BM-STOCK-SUMMON-01 — Stock·소환수 피로 완화 QUICK Benchmark

## 1. 결정 질문

> 직접 작성의 손맛과 상황 설계 판단을 유지하면서, Stock과 소환수의 주기 자동 지원이 반복 피로를 줄이되 방치 플레이·자동 정답·무한 자원을 만들지 않으려면 어떤 구조와 초기 수치를 사용해야 하는가?

```yaml
benchmark_id: GR-BM-STOCK-SUMMON-01
scale: QUICK_PLUS_PATTERN_REVIEW
status: COMPLETE
project: GRIMOIRE
completed_at: 2026-08-02T22:36:00+09:00
external_claim_scope: MECHANIC_PATTERN_ONLY
```

## 2. 프로젝트 전제

- 직접 작성은 핵심 입력이지만 획 반복량 자체가 핵심 재미는 아니다.
- Stock은 같은 문제에서 확인한 글자를 재선택하는 최소 계약이 있다.
- 메인 소환수는 상시 활성이다.
- 기타 소환수는 `[소환]` 주문으로 활성화한다.
- 활성 소환수는 일정 시간마다 지정 주문을 사용하거나 Stock을 충전한다.
- 플레이어의 상황 판독·의미 조합·Commit·결과 책임은 유지해야 한다.

## 3. 외부 직접 사례

| 사례 | 관찰 | 유효 이유 | 위험 | 판정 |
|---|---|---|---|---|
| Final Fantasy XIV Scholar Fairy | 소환된 Fairy가 피해를 받은 아군에게 정해진 치유 행동을 자동 사용한다. 자동 지원의 역할과 발동 조건이 좁고 예측 가능하다. | 소환수가 플레이어의 모든 판단을 대체하지 않고 정해진 지원 역할만 수행하는 패턴 | 자동 지원이 너무 강하면 수동 판단의 가치가 낮아짐 | `ADAPT` — 소환수별 역할·대상 규칙을 고정하고 표시 |
| League of Legends Lulu/Pix | 동반체가 플레이어의 공격이라는 명확한 조건에 맞춰 추가 발사한다. | 자동 행동을 독립 AI가 아니라 플레이어 행동에 연결할 수 있음 | 플레이어 행동과 무관한 상시 DPS가 되면 방치화 | `ADAPT` — 메인 소환수 Stock 보충을 최근 직접 확인 글자와 연결 |
| Diablo IV Necromancer Minions | 플레이어가 소환 계열과 유형을 선택하고, 활성 Minion은 자동 행동하며 일부는 별도 명령 효과를 가진다. | 호출·편성 판단과 활성 후 자동 행동을 분리하는 패턴 | 다수 소환·상시 자동 공격이 핵심 플레이를 대체할 수 있음 | `ADAPT` — 메인+보조 1체 상한, 자동 소환 연쇄 금지 |
| League of Legends Ziggs Passive | 일정 주기로 다음 기본 행동을 강화하고, 다른 행동이 주기를 단축한다. | 주기 지원을 누적 자동 발사보다 `준비 완료 1회` 상태로 보존하는 근거 | 여러 회 충전되면 폭발적 누적·대기 최적화 발생 | `ADAPT` — Stock 생성은 준비 1회 보류, 반복 누적 금지 |

공식 출처:

- FINAL FANTASY XIV Job Guide: Scholar — `https://na.finalfantasyxiv.com/jobguide/scholar/`
- League of Legends Champion: Lulu — `https://www.leagueoflegends.com/en-us/champions/lulu/`
- Diablo IV Quarterly Update: Necromancer — `https://news.blizzard.com/en-us/article/23816542/diablo-iv-quarterly-updatejune-2022`
- League of Legends Champion: Ziggs — `https://www.leagueoflegends.com/en-us/champions/ziggs/`

## 4. 내부 설계 패턴 비교

### Stock 저장 단위

| 대안 | 장점 | 핵심 위험 | 판정 |
|---|---|---|---|
| 완성 주문 Stock | 가장 편하고 빠름 | 대상·상황·의미 조합을 우회하며 마도서와 자동 시전 슬롯이 중복 | `REJECT` |
| 범용 Charge Pool | UI와 밸런스가 단순 | 어떤 글자를 이해하고 재사용하는지 의미가 사라짐 | `REJECT` |
| 확인된 글자 Token Rack | 직접 작성의 학습 흔적을 보존하고 조합·대상 판단은 유지 | 슬롯 관리가 과하면 인벤토리화 | `ADOPT` |

### 소환수 자동화 구조

| 대안 | 장점 | 핵심 위험 | 판정 |
|---|---|---|---|
| 상시 자유 AI 다중 소환 | 화려하고 편함 | 자동 전투·대상 블랙박스·화면 과밀·중복 Tick | `REJECT` |
| 수동 단발 스킬만 | 통제 가능 | 사용자가 정의한 주기 지원과 직접 작성 피로 완화가 약함 | `REJECT_AS_PRIMARY` |
| 메인 상시 + 명시적으로 소환한 보조 1체 + 결정론적 Tick | 정체성·편의·전술 선택을 동시에 유지 | 주기·출력·충전량이 높으면 대기 플레이 | `ADOPT` |

## 5. GRIMOIRE 적용 결론

1. Stock은 `확인된 글자 Token`만 저장한다.
2. 완성 주문·대상·상황 조건·자동 최적 조합은 저장하지 않는다.
3. Slice Stock Rack은 4칸으로 시작한다.
4. 동일 글자 중복은 최대 2개다.
5. 메인 소환수는 최근 직접 확인한 글자와 연결된 Stock 지원을 제공한다.
6. 기타 소환수는 플레이어가 `[소환]` 주문을 Commit한 뒤 제한 시간 동안만 주기 행동한다.
7. Slice 동시 활성 상한은 `메인 1 + 보조 1`이다.
8. 자동 주문은 주요 Situation을 종결하거나 불안정도 0을 만들지 못한다.
9. Tick은 적 공격과 같은 `Active Pressure Clock`을 사용하고 Pause·Resolve·Background에서 정지한다.
10. Offline catch-up과 자동 소환 연쇄를 금지한다.

## 6. 적대적 결론

추천값의 목적은 자동화량을 최대화하는 것이 아니다.

```text
직접 작성이 절반 이상 남음
+ Stock이 반복 획을 줄임
+ 소환수가 예측 가능한 보조 리듬을 만듦
+ 새로운 상황 판단과 최종 Commit은 플레이어에게 남음
```

다음 조건이 발생하면 수치를 하향하거나 구조를 재작업한다.

- 직접 작성 비율이 40% 미만으로 내려감.
- 소환수 행동만 기다리는 시간이 유효 전략이 됨.
- Stock이 항상 가득 차서 직접 작성이 비효율 선택이 됨.
- 자동 주문이 전투 불안정도 또는 환경 목표의 25%를 초과해 해결함.
- 다음 Tick·대상·출처를 플레이어가 설명하지 못함.
