# GR-BM-SUMMON-ACTIVE-3-WORK-QUALITY-01 — 보조 소환수 3체·작업 품질 QUICK Benchmark

## 1. 상태

```yaml
benchmark_id: GR-BM-SUMMON-ACTIVE-3-WORK-QUALITY-01
status: COMPLETE
scale: QUICK_PLUS_INDUSTRY_PRACTICE
completed_at: 2026-08-03T00:04:00+09:00
related_decisions:
  - GM-SUMMON-SYSTEM-01
  - GM-GRILL-WORK-QUALITY-GATE-01
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

## 2. 결정 질문

1. 메인 소환수와 별도로 보조 소환수 최대 3체를 허용하면서 자동화 지배·스탯 몰아넣기·Mobile HUD 과밀을 어떻게 막는가.
2. 앞으로 GrillMe 질문과 실질 작업마다 벤치마킹·현업 비교 권장안·적대적 검토를 누락하지 않고, 한글 깨짐과 Unicode 손상을 어떻게 차단하는가.

## 3. 비교축

- 활성 개체 수와 역할 선택의 의미.
- 같은 역할 중첩과 자동화 지배 위험.
- 교체·명령·대상 규칙의 명확성.
- Mobile HUD 정보량과 상세 정보 접근 방식.
- 저장·복귀 시 다중 Event 결정성.
- UTF-8·Unicode 정규화·깨진 문자 검증 방식.

## 4. 직접·인접 사례

| 사례 | 공식 관찰 | 유효 이유 | 위험 | 판정 |
|---|---|---|---|---|
| Diablo IV Necromancer Book of the Dead | `Skeletal Warriors / Skeletal Mages / Golem` 세 소환 범주를 각각 전문화하며, 군단 구성 자체를 플레이스타일 선택으로 만든다. | 세 개의 역할 슬롯을 단순 수량이 아니라 서로 다른 책임으로 분리하는 근거 | 개체 수와 공격력이 많아지면 플레이어 주문보다 군단 DPS가 중심이 될 수 있음 | `ADAPT` — 보조 3칸은 역할군 선택으로 사용하고 자동 종결 금지 |
| FINAL FANTASY XIV Summoner | 소환 전환 시 현재 Pet이 전장을 떠나며, Gauge가 현재 소환·잔여 상태를 집중 표시한다. | 교체를 명시적 상태 전환으로 다루고 HUD를 현재 활성 상태 중심으로 제한 | GRIMOIRE의 무기한 상주 정체성과는 맞지 않음 | `ADAPT` — 상주는 유지하되 교체 대상을 명시하고 상세 정보는 선택한 슬롯에만 확장 |
| Guild Wars 2 Mechanist | 플레이어와 함께 싸우는 하나의 Jade Mech를 전문화 정체성의 중심으로 사용한다. | 메인 동반체를 보조 슬롯과 분리해 정체성을 유지하는 근거 | 단일 동반체만으로는 사용자가 원하는 다중 편성 부족 | `ADOPT` — 메인 1체는 별도 상시 슬롯 유지 |
| Dota 2 7.00 HUD | 주 조작 화면의 점유를 줄이고, 다른 Unit 상세는 측면 Query로 확인하도록 HUD를 재구성했다. | 다중 개체 정보를 항상 펼치지 않고 요약 Rail과 상세 Query로 나누는 현업 UI 패턴 | 요약이 지나치면 대상·주기·출처를 놓칠 수 있음 | `ADAPT` — 보조 3슬롯 요약 + 탭한 1슬롯 상세 |
| Unicode Standard Annex #15 | NFC 등 정규화 형식은 동등한 문자열에 안정된 이진 표현을 제공한다. | 한글 조합형·분해형 혼재와 비교 실패를 자동 검출하는 표준 근거 | 정규화만으로 잘못된 인코딩·대체문자까지 전부 검출하지 못함 | `ADOPT` — UTF-8 strict decode + NFC + replacement/control/mojibake 검사 결합 |

## 5. 공식 출처

- Diablo IV Quarterly Update — Necromancer / Book of the Dead: `https://news.blizzard.com/en-us/article/23816542/diablo-iv-quarterly-updatejune-2022`
- FINAL FANTASY XIV Job Guide — Summoner: `https://na.finalfantasyxiv.com/jobguide/summoner/`
- Guild Wars 2 — Meet the Mechanist: `https://www.guildwars2.com/en/news/meet-the-mechanist/`
- Dota 2 7.00 — New HUD: `https://www.dota2.com/700/hud/`
- Unicode Standard Annex #15 — Unicode Normalization Forms: `https://unicode.org/reports/tr15/`

외부 사례는 구조 원리만 사용하며 고유 명칭·수치·연출을 복제하지 않는다.

## 6. 대안 비교

### A. 보조 3체 자유 중복

장점:

- 편성 자유가 가장 큼.
- 특정 역할 특화 빌드가 쉬움.

위험:

- 생산형 3체로 Stock 대기시간이 사실상 사라질 수 있음.
- 수호형 3체로 상시 방어가 전투 위험을 제거할 수 있음.
- 공격형 3체가 플레이어 대신 상황을 대부분 해결할 수 있음.
- 동일 아이콘·주기·대상 정보가 Mobile HUD를 과밀하게 만듦.

판정: `REJECT_FOR_PROTOTYPE`.

### B. 메인 1체 + 보조 최대 3체, 역할 중복 금지

장점:

- 네 역할 중 세 가지를 선택하는 명확한 기회비용.
- 역할별 수치 상한을 기존 정수 모델 안에서 유지 가능.
- 3칸 HUD의 의미가 서로 달라 빠르게 판독 가능.
- 향후 소환수 개별 성장과 관계 콘텐츠로 확장 가능.

위험:

- 동일 역할 특화 편성은 제한됨.
- 역할 분류가 불명확한 혼합형 소환수는 후속 규칙이 필요함.

판정: `ADOPT_RECOMMENDED`.

### C. 보조 Roster는 3체지만 동시 활성은 1체

장점:

- 기존 HUD와 밸런스를 거의 유지.

위험:

- 사용자의 `보조소환수 최대 3체` 의도인 동시 편성 재미를 충족하지 못함.

판정: `REJECT`.

## 7. GRIMOIRE 권장 계약

```yaml
persistent_main_summon: 1
additional_active_summon_cap: 3
total_active_summon_cap: 4
secondary_slot_ids: [S1, S2, S3]
secondary_role_duplicate_cap: 1
secondary_roles:
  - PRODUCTION
  - GUARDIAN
  - ASSAULT
  - RECOVERY
```

- 보조 3체는 네 역할 중 최대 세 역할을 선택한다.
- Slice·Prototype에서는 보조 사이 같은 역할 중복을 금지한다.
- 메인 동반 정령의 `[스톡] 1`은 보조 역할 중복 판정에서 제외한다.
- 생산형 보조 1체와 메인을 합친 활성 `[스톡]` 상한은 `3`을 유지한다.
- 보조 각 1체의 Prototype 값은 `[스톡] 2 / [방어도] 2 / [공격] 2 / [치유] 2`다.
- 모든 보조는 고정 역할·고정 대상 규칙을 사용한다.
- 슬롯이 가득 찬 경우 교체할 `S1/S2/S3`를 명시하고 새 `[소환 주문]` Commit과 마나 `2`를 다시 지불한다.
- 보조별 5초 행동 주기는 독립 보존하되, 같은 시각 Event는 슬롯 순서 `S1 → S2 → S3`로 처리한다.
- 자동 공격은 불안정도 하한 `1`과 마지막 해결 금지를 유지한다.

## 8. Mobile HUD 권장안

```text
메인 소환수 배지
+ 보조 S1 / S2 / S3 압축 Rail
+ 선택 슬롯 상세 Panel
```

압축 슬롯 필수 정보:

- 역할 아이콘과 소환수 식별자.
- 대표 정수 스탯.
- 다음 행동까지 남은 초.
- 유효·봉인·무효 상태.

선택 슬롯 상세:

- 대상 규칙.
- 적용 전·후 예상값.
- 귀환·교체.
- 마지막 Event 출처.

세 소환수의 모든 상세 문구를 동시에 상시 노출하지 않는다.

## 9. 작업 품질 운영 권장안

모든 GrillMe 결정과 실질 작업은 다음 순서를 사용한다.

```text
결정 질문
→ 범위별 QUICK/STANDARD/DEEP 벤치마킹
→ 직접 사례 + 인접 사례 + 현업/표준 근거
→ ADOPT/ADAPT/REJECT
→ 프로젝트 권장안
→ 적대적 검토
→ UTF-8·NFC·깨진 문자 Gate
→ GitHub·Sheet Readback
```

설계 의미가 없는 SHA·링크·오탈자 동기화는 `BENCHMARK_APPLICABILITY = N/A_NO_DESIGN_CHANGE`로 기록할 수 있으나, Text Integrity와 Readback은 생략하지 않는다.

## 10. Text Integrity Gate

Hard failure:

- UTF-8 strict decode 실패.
- Unicode replacement character `U+FFFD` 존재.
- 파일 중간 BOM 또는 허용되지 않은 제어문자.
- NFC 비정규화 텍스트.
- 알려진 mojibake 패턴 발견.
- JSON parse 실패.

Readback sentinel:

```text
소환수
자연충전
적대적 검토
벤치마킹
마도서
```

GitHub와 Sheet 재조회에서 위 문자열이 깨지지 않아야 한다.

## 11. 적대적 판정

보조 3체는 단순 상향이 아니다. 다음 위험을 동반한다.

- 5초마다 최대 3개 Event가 발생해 결과 로그가 과밀해짐.
- 공격·치유·Stock 지원이 동시에 발생하면 플레이어 인과 이해가 낮아짐.
- 세 소환수와 Writing Panel을 함께 표시하면 Mobile 화면이 붕괴할 수 있음.
- 보조 3체의 관계·애니메이션·FX를 모두 실제 Slice에 넣으면 제작 범위가 증가함.

따라서 다음 가드레일을 필수로 한다.

```yaml
role_duplicate_prohibited_in_slice: true
compact_three_slot_hud_required: true
deterministic_event_order_required: true
per_summon_result_source_required: true
slice_visible_secondary_models: 3_or_less
runtime_and_human_validation: NOT_RUN
```

## 12. 결론

```yaml
summon_cap_recommendation: MAIN_1_PLUS_SECONDARY_3
secondary_role_model: CHOOSE_3_OF_4_UNIQUE_ROLES
mobile_information_model: COMPACT_RAIL_PLUS_SELECTED_DETAIL
work_quality_model: BENCHMARK_PLUS_INDUSTRY_RECOMMENDATION_PLUS_TEXT_INTEGRITY
final_balance: NOT_PROVEN
implementation_ready: false
```