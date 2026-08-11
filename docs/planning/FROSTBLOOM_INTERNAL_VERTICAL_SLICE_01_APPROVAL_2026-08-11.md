# GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01 — 서리꽃 온실 Internal Vertical Slice 승인

## 1. 상태

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
status: USER_APPROVED_DESIGN_SPEC_REVIEW_PENDING
approved_at: 2026-08-11T09:35+09:00
sync_id: GR-SYNC-20260811-10-FROSTBLOOM-INTERNAL-VERTICAL-SLICE
contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5
base_current_main_observed: 315c66eea9614c284b9c11c4d522141065dfa4b0
project_main_at_entry: c80e08799b8bd40ef813017603d266d036243bb5
branch: planning/frostbloom-internal-vertical-slice
persistent_godot_source_mutation: NONE
implementation_plan: BLOCKED_UNTIL_USER_SPEC_REVIEW
```

이 결정은 Internal Vertical Slice의 **콘텐츠 구조·시간·플레이 순서·검증 경계**를 승인한다. 제품 코드, Godot `.gd/.tscn/.tres/.res/project.godot`, 최종 밸런스, 실기기·사람 PASS 주장은 소유하지 않는다.

## 2. 상위 정본과 소유권

이 결정은 다음 정본을 소비한다.

- `GM-YEAR-ONE-CHAPTER-CURRICULUM-01`: 1학년 7 Chapter / 2·2·3, 별도 시험 없음, 서리꽃 온실 Ch6 확장판과 Ch7 첫 작은 세계 재작성.
- `GM-WORLD-CHARACTER-THREE-YEAR-STORY-01`: 정식=안전 선례, 문맥 관찰, 제한된 개정, 마렌·카시안·네아·에일린·모트.
- `GM-YEAR-ONE-GROWTH-ECONOMY-TEST-VALUES-01`: 자유일정 6, 2-of-3 Focus, 4×25 포트폴리오, 제작 6·8·3·12 등 Year-One TEST_VALUE.
- `GM-WRITING-FREQUENCY-01`: 정상 완주 성공 작성 7회, 안내 복구 포함 상한 10회.
- `GM-STAR-CIRCUIT-MASTERY-BALANCE-01`: `FIVE_POINT_STAR` 회로 권위.
- `GM-SPELL-WORKFLOW-UI-V2-01`: 글자 그리기 → 회로 배치 → 주문 사용의 3단계 Workflow, Stage 2/3 책임 경계와 Exactly-once 의미.
- `GM-MOBILE-UX-FLOW-01`, `GM-MOBILE-WRITING-BATTLE-WIREFRAME-01`: Scene-first Focus Task, 상황 보존형 Writing Panel, Draft/Result 복귀 계약.

다음은 보호한다.

- Stock/Summon/Star/Spell Workflow의 기존 수치와 Transaction 의미.
- Task8 PR #116의 `ON_HOLD_USER_REQUEST_COST_DEPENDENCY` 상태.
- Human/device/performance/export/full-slice 검증은 `NOT_RUN` 상태.
- Historical 3×3 회로 자료는 provenance로만 보존하며 current Slice authority가 아니다.

## 3. 핵심 설계 선택

```yaml
slice_model: SINGLE_INCIDENT_SPIRAL
representative_incident: 서리꽃_온실의_심장
actual_play_target_minutes: 46
content_rework_threshold_minutes: 53
hard_stop_minutes: 60
year_one_relationship: COMPRESSED_INTERNAL_VALIDATION_NOT_LITERAL_CHAPTER_TIMELINE
festival_in_slice: PREVIEW_ONLY
required_successful_writing_events: 7
recovery_inclusive_writing_cap: 10
investigation_nodes_available: 4
investigation_nodes_required: 2
free_schedule_windows_in_slice: 1
major_five_point_star_commits_min: 2
```

Internal Slice는 Year-One의 연속 Chapter를 46분에 축약해 재현하는 것이 아니다. 여러 반복 핵심을 **하나의 서리꽃 온실 사건에 인과적으로 연결한 압축 검증판**이다. Year-One Ch6의 확장판은 더 긴 조사·관점·준비·관계·결과를 가진다.

## 4. 46분 Single-Incident Spiral

| 시간 | 실제 플레이 | 핵심 검증 | 작성 |
|---:|---|---|---:|
| 0–6 | 마렌의 안전 선례 시연 + 짧은 필사 교정 | 정식은 유일정답이 아님, 입력/후보/수정 | W1 FLOW, W2 FOCUS, W3 DISPERSE |
| 6–11 | 교내 미니 제작 | 재료 선택·식별·안정화가 사건 준비를 바꿈 | W4 선택 글자 |
| 11–14 | 자유일정 1회 | 휴식/준비/교류/선택형 현장실습 기회비용 | — |
| 14–23 | 온실 진입·조사 4곳 중 2곳 + 비전투 응용 | 문맥 획득, 불확실성, 비전투 의미 적용 | W5 |
| 23–30 | 첫 주요 FIVE_POINT_STAR 설계·대상·Commit | Stage2/Stage3, 보호 우선순위와 대가 | W6 |
| 30–39 | 과거 개정 흔적 발현 + 단일 강한 정령/압력 위기 | 첫 해법을 지우지 않고 새 문맥에 재설계 | W7 |
| 39–44 | Result·세계 변화·마도서 복기 | 결과 원인, 손실, 발견, 책임 기록 | — |
| 44–46 | 축약 포트폴리오 피드백 + 장기 Preview | 평가 납득, Year-One/전문화 약속 분리 | — |

46분은 목표이며 53분 초과는 콘텐츠 재작업 경고다. 60분을 넘는 설계는 Hard Stop이다.

## 5. 작성 계약 W1–W7

정상 완주 성공 작성은 정확히 7회를 목표로 한다.

1. `W1 FLOW` — 안전 선례 실험에서 이동/흐름 의미를 직접 작성.
2. `W2 FOCUS` — 같은 실험에서 좁힘/정밀 차이를 직접 작성.
3. `W3 DISPERSE` — 같은 실험에서 확산/완충 차이를 직접 작성.
4. `W4` — 제작 도구에 상황 의미를 새기는 짧은 작성.
5. `W5` — 조사 중 비전투 응용 작성.
6. `W6` — 첫 주요 FIVE_POINT_STAR 해결 설계.
7. `W7` — 새 문맥이 드러난 뒤 재설계/상황전투 대응.

이미 직접 작성해 확인한 동일 글자의 반복 사용은 Vault/Typed Stock/명시적 재선택을 허용한다. `GM-WRITING-FREQUENCY-01`의 안내 복구 포함 상한 10회를 넘기지 않는다. 낮은 확신 후보 자동확정과 명시적 Commit 전 자원 소비는 금지한다.

## 6. 제작 — 사건 준비에 종속된 대표 미니게임

Slice 제작은 별도 경제 게임이 아니라 온실 사건의 준비다.

- 플레이어는 `식별 → 선택 → 배합/안정화`를 실제 수행한다.
- Slice에서는 이해 가능한 소수 재료만 노출하며, B의 `max 3 inputs` 경계를 넘지 않는다.
- 결과물은 상위호환 장비가 아니라 문맥 도구다. 예: 완충 촉매, 임시 봉합재, 관측 시약.
- 어떤 제작물도 단독 정답·필수 유일 해법이 아니다.
- 선택형 현장실습 반복이 없으면 메인 제작이 불가능해지는 구조를 금지한다.

## 7. 자유일정 — 1회만 실제 플레이

Slice에서는 Year-One의 총 6창을 재현하지 않고 **대표 창 1회**만 실제 플레이한다.

표시 선택은 다음 네 축이다.

- 휴식
- 준비
- 교류
- 선택형 현장실습

각 선택은 시작 문맥·관계 반응·사전 단서의 차이를 만들 수 있지만, 메인 진행·필수 정보·필수 제작 재료를 독점할 수 없다. 현장실습은 더 좋은 영구 성장이나 파밍 지배전략이 아니며 다른 세 선택과 같은 슬롯 비용을 가진다.

B의 `100/50/25/0` 반복 재료 감쇠는 Slice에서 반복 파밍 루프로 풀어내지 않고 장기 Preview/후속 플레이테스트 정본으로 남긴다.

## 8. 조사 4곳 중 2곳

플레이어는 네 관찰 지점 중 두 곳을 선택한다.

| 조사 지점 | 획득하는 사실 |
|---|---|
| 관개관·압력계 | 냉기 외에 유량·압력이 함께 어긋남 |
| 서리꽃 뿌리층 | 식물이 피해 대상이면서 온실 안정 구조 일부임 |
| 정령 흔적 | 정령이 단순 공격자가 아니라 오래된 흔적에 반응함 |
| 오래된 수리 기록 | 과거의 안전한 개정이 현재 조건과 충돌할 가능성 |

어떤 두 조합으로도 합리적 해결이 가능해야 한다. 조사하지 않은 정보는 벌점용 숨은 정답이 아니라 **불확실성**으로 남는다.

NPC 정보 계약은 `관찰 사실 + 인물 관점/편향 + 대가`다.

- 마렌: 방향·안전선만 제시하고 정답 조합은 말하지 않음.
- 카시안: 빠르고 재현 가능한 정식을 선호하지만 틀린 라이벌로 취급하지 않음.
- 네아: 문맥 불일치를 감정·감각으로 반응하지만 정확한 해답을 주지 않음.
- 에일린: 사람·시설·현장 비용을 보여줌.
- 모트: 기록·접근·과거 개정의 위험 맥락을 제공함.

## 9. 첫 주요 해결 — 성공을 취소하지 않는다

첫 `W6` 주요 해결은 반드시 실제 상태를 개선한다. 시설, 생명, 정령 안정, 봉쇄, 전투제압 중 플레이어가 우선한 가치에 따라 일부 상태가 좋아진다.

그 후 **새 문맥**으로 과거 개정 흔적이 드러난다. 이 Reveal은 “첫 답이 틀렸다”가 아니다.

```text
현재 확보한 문맥 안에서는 합리적이었다
→ 실제로 무언가 개선했다
→ 결과가 새로운 증거를 드러냈다
→ 과거의 안전 선례가 현재 조건과 충돌함을 알게 됐다
→ 다음 설계의 책임 범위가 넓어졌다
```

실패·부분성공·첫 선택을 삭제해 정답 루트로 되감는 구조를 금지한다.

## 10. FIVE_POINT_STAR와 다중 해법

현재 회로 권위는 `FIVE_POINT_STAR`다. Historical 3×3 인접회로를 현재 Slice 설계 언어로 사용하지 않는다.

첫 주요 해결과 후반 재설계는 Stage 2/3 경계를 보존한다.

```text
Stage 2: glyph source / circuit placement / base preview
→ Stage 3: explicit target / final expected effect / risk / mana / confirmation
→ atomic use transaction
```

`시설복구 / 생명구조 / 정령교섭 / 봉쇄 / 전투제압`을 정답 루트 버튼으로 노출하지 않는다. 플레이어가 실제로 선택한 Target, Circuit, 도구, 보호 대상, 결과를 바탕으로 사후 Intent/Result 태그를 기록한다. 비등록 합리 해법도 의미·상황 규칙에 부합하면 유효해야 한다.

NPC나 Preview는 정확한 조합, 성공률 최적해, 결말을 추천하지 않는다.

## 11. 후반 위기 — 단일강적 상황전투

과거 개정 충돌로 정령·냉기 압력이 폭주한다. 다수 잡몹·웨이브를 만들지 않는다.

- 강한 정령/압력원 1개체 집중.
- 적 처치보다 원인 해소와 결과 품질을 우선.
- 불안정도 감소, 환경 보존, 선택한 보호 대상 확보가 주요 피드백.
- 정령 파괴는 기본 승리 조건이 아님.
- 마렌은 L3 생명위험에서만 직접 안전 개입하며 평상시 해결을 대신하지 않음.
- `W7`은 새 문맥에 대한 직접 작성/재설계다.

## 12. Result와 Grimoire

Result는 단일 성공등급으로 사건을 압축하지 않는다. 최소 다음 다섯 결과 축을 분리한다.

```yaml
result_dimensions:
  - 시설
  - 생명
  - 정령
  - 관계
  - 발견
```

마도서는 다음 인과를 기록한다.

```text
상황/관찰
→ 사용한 의미·회로·대상
→ 의도
→ 실제 결과
→ 부작용·포기·손실
→ 발견
→ 플레이어 명명/대표 근거
```

마도서는 자동 최적 추천이나 기록 클릭 자동 시전을 제공하지 않는다.

## 13. 축약 포트폴리오

마지막 2분은 `Internal Slice — 축약 포트폴리오 시연`으로 명시한다. 46분 플레이가 실제 한 학기 전체라고 오인시키지 않는다.

B의 네 평가 축을 사용한다.

- 원리 이해
- 문맥 적용
- 책임·회복
- 복기·설명

내부 25×4 숫자, Band, 사건별 -2/-6 보정은 플레이 중 공개하지 않는다. 일반 실패·부분성공 자체에는 별도 숫자 감점을 만들지 않는다. 마렌의 코멘트는 **방금 플레이한 실제 근거 2개 + 보완 질문 1개**처럼 사건 증거를 직접 인용해야 한다.

## 14. 장기 Preview

마지막 Preview는 실제 플레이와 명확히 분리한다.

표시 예:

`PREVIEW — 이 Internal Slice에서 플레이되지 않음`

Preview 범위:

- Year-One 7 Chapter / 2·2·3
- Year-One 자유일정 6회
- Term 2·3 2-of-3 Focus
- 축제 등 다른 학교생활 맥락
- Ch7 첫 독자 원리와 작은 세계 재작성
- 2학년 전문화/Bridge 방향

축제는 46분 실제 플레이에 억지로 삽입하지 않고 Year-One의 별도 맥락 사례로 Preview한다.

## 15. Save/Resume

표준 첫 플레이에 의도적 앱 중단을 강제하지 않는다. 핵심 재미/대표성 측정과 interruption 실험을 분리한다.

실제 Slice에는 다음 안전 Anchor를 둔다.

| Anchor | 위치 |
|---|---|
| A1 | 제작·자유일정 종료 후 |
| A2 | 조사 종료, 첫 주요 주문 직전 |
| A3 | 첫 해결 후 새 문맥이 드러난 직후 |
| A4 | 사건 Result 확정 후, 마도서 직전 |

작성 중 중단은 완료된 Anchor로 단순 롤백하는 대신 Draft/Snapshot 복구 계약을 사용한다. 별도 검증 런에서는 A2/A3 및 작성 중 강제 pause/resume을 실행해 다음을 요구한다.

```text
Draft loss = 0
duplicate Commit = 0
duplicate reward = 0
duplicate Grimoire record = 0
stale result application = 0
```

## 16. 인간 플레이테스트 초기 TEST_VALUE

```yaml
participants_test_value: 6
required_successful_writing: 7
recovery_inclusive_writing_cap: 10
investigation_choice: 2_OF_4
major_star_commits_min: 2
normal_target_minutes: 46
rework_if_over_minutes: 53
hard_stop_minutes: 60
```

핵심 질문:

- 플레이어가 첫 해결 이후 왜 재설계했는지 자기 말로 설명할 수 있는가?
- 서로 다른 합리적 해법이 최소 2개 이상 가능하다고 인지하는가?
- 평가 코멘트의 근거를 자신의 실제 플레이에서 찾을 수 있는가?
- 7회 작성이 핵심 판타지를 강화하는가, 아니면 시스템 회피를 유도하는 피로가 되는가?
- 자유일정·조사 선택 중 어떤 것도 필수 진행의 숨은 정답처럼 느껴지지 않는가?

다음은 Hard Stop/REWORK 신호다.

- 60분 초과.
- 53분 초과가 구조적으로 반복됨.
- 유일한 정답 조합을 NPC/Preview가 사실상 노출.
- 조사 조합/자유일정 선택 때문에 필수 진행이 막힘.
- 첫 주요 해결의 성공을 무효화해 ‘처음부터 틀렸다’로 처리.
- duplicate Result/Reward/Record 1건 이상.
- Draft 손실 또는 stale result 1건 이상.
- 별도 시험이 필요하다는 구조적 인상.

## 17. Stale consumer 정리 대상

이 Decision을 main에 병합할 때 **과거 증거를 삭제하지 않고 current authority만 명확화**한다.

1. `20_코어경험_데모목표`의 current 학교생활 표현 중 `수업·시험·축제·현장` → 별도 시험 없는 현재 구조로 정리.
2. `30_데모범위_품질기준_제작기반`의 3×3 회로 current처럼 보이는 역사 행 → `HISTORICAL_SUPERSEDED_BY_FIVE_POINT_STAR`로 명시.
3. `40_핵심시스템_메인콘텐츠`의 초기 `메인1+보조0~1 / 다중보조 Slice 제외` 소비자 → FIVE_POINT_STAR current authority와 역사/구형 방향을 구분.
4. `80_데모_버티컬슬라이스_플레이테스트`의 `GR-TEST-032` 3×3 회로 문맥 → historical test lineage로 보존하고 current D 검증은 FIVE_POINT_STAR 계보를 사용.

## 18. 명시적 금지

- 체크리스트형 School-Life Sampler로 모든 시스템을 조금씩 넣는 것.
- 46분 실제 플레이에 축제를 강제로 삽입하는 것.
- 별도 시험/시험장/시험 미니게임을 되살리는 것.
- 구형 3×3 회로를 current Slice 권위로 되돌리는 것.
- 교수·동반자·Preview가 정답 조합을 알려주는 것.
- 5개 접근을 정답 루트 버튼으로 고정하는 것.
- 첫 해결을 무효화하는 ‘가짜 선택’ Reveal.
- 다수 잡몹/웨이브·HP 스펀지 중심 전투.
- 실패 기록 삭제, 결과 리셋 파밍, 타인의 선택/기억을 편의적으로 재작성하는 것.
- Human/device/performance/full-slice PASS를 문서 승인만으로 승격하는 것.

## 19. 다음 Gate

Superpowers brainstorming 절차상 이 문서는 사용자 승인 설계를 정본 텍스트로 옮긴 상태다. **작성된 spec을 사용자가 다시 검토하기 전에는 implementation plan을 작성하지 않는다.**

사용자 spec review 승인 후에만 `writing-plans` 절차로 전환한다. Godot 영구 소스 변경은 별도 구현 Gate와 HiGodot 권위가 충족될 때까지 계속 금지한다.
