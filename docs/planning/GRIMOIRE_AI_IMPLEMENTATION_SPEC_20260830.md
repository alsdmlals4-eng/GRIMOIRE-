# GRIMOIRE AI Implementation Spec - Long-Horizon Blueprint Pair

```yaml
blueprint_pair_id: GRIMOIRE-HGB-20260830-01
revision: R1
status: USER_FINAL_REVIEW_AWAITING
human_blueprint_source: docs/planning/GRIMOIRE_HUMAN_GAME_BLUEPRINT_20260830.md
human_pdf_derivative: output/pdf/grimoire_HUMAN_GAME_BLUEPRINT_20260830.pdf
adversarial_review: docs/reviews/GRIMOIRE_HGB_20260830_R1_ADVERSARIAL_REVIEW.md
current_project_main_at_authoring: 7fab8f1406ea3cb9b7e002c4c000f2fbad173c53
base_contract_release: v9.4.3
implementation_authority: BLOCKED_UNTIL_USER_APPROVES_EXACT_SCOPE
```

## 1. 승인 범위와 비범위

### 현재 승인된 문서 작업 범위

- 1학년 7 Chapter 장기 구조를 사람용 검수본과 AI/개발/QA용 인계 문서로 정리한다.
- 수업, **온실 지도 실습**, 선택형 실습 전투, 축제 통제 응용, 후속 현장 사건, 마도서 복기, 첫 세계 개정의 연결을 명시한다.
- 현재 W6 구현 기준선과 장기 미구현 범위를 분리한다.
- 최종 PDF에 맞는 사람 검수 질문과 구현 전제조건을 기록한다.

### 현재 비범위

- W7, Chapter 1-7 전체, 축제 game loop, 전투 Scene, 2학년 시스템의 코드/Scene/data 구현.
- Task8 recovery 또는 unrelated open PR 수정.
- 신규 runtime image generation, production asset batch, asset canon 승격.
- Human, device, performance, accessibility, export, full-slice PASS 주장.
- 별도 시험 Chapter, 자동 target/cast, 최적 정답 route, 반복 전투 파밍.

## 2. 프로젝트 정본과 기준 SHA

| 소유 사실 | 권위 문서/실제 자료 | 이 명세에서의 역할 |
| --- | --- | --- |
| 현재 프로젝트 상태 | `AGENTS.md`, `START_HERE.md`, `docs/ACTIVE_CONTEXT.md` | 모든 구현 전 fresh-read 시작점 |
| 플레이어 노출 주문 흐름 | `docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md` | 글자 → 주문 → 대상 → 시전 불변식 |
| 1학년 Macro Loop | `docs/planning/FULL_GAME_MACRO_LOOP_01_APPROVAL_2026-08-02.md` | 수업, 선택, 통제 응용, 현장 책임, 복기 연결 |
| Chapter 리듬 | `docs/planning/FULL_GAME_CHAPTER_RHYTHM_01_APPROVAL_2026-08-02.md` | 다섯 기능과 순서 변주 |
| 1학년 커리큘럼 | `docs/planning/YEAR_ONE_CHAPTER_CURRICULUM_01_APPROVAL_2026-08-11.md` | 7 Chapter와 2-2-3 구조 |
| 세계/인물/3년 방향 | `docs/planning/WORLD_CHARACTER_THREE_YEAR_STORY_01_APPROVAL_2026-08-11.md` | 계열, 인물, 첫 개정 이후 연결 |
| W6 기준선 | `docs/planning/FROSTBLOOM_W6_DECISION_LOOP_VERTICAL_SLICE_01_FEATURE_DESIGN_SPEC_2026-08-28.md`, W6 implementation receipt | 현재 Product Root의 대상 선택/Preview/receipt 경계 |
| 현재 실행점 | `project.godot`, `res://src/ui/spell_workflow/spell_workflow_product_root.tscn` | 기술 가능성 확인의 실제 consumer |

기준 SHA는 이 문서 작성 당시 로컬 `main`의 `7fab8f1406ea3cb9b7e002c4c000f2fbad173c53`이다. 실제 구현을 시작할 때는 이 SHA를 재사용하지 않고, latest completed `origin/main`과 현재 workspace를 다시 읽는다.

### 최신 사용자 방향과 기존 owner의 재조정 경계

최신 사용자 지시는 **온실/묘목을 수업 직후의 첫 지도 실습 사건으로 두고, 수업/실습/전투/축제까지 장기적으로 이어 간다**는 것이다. 기존 C6/W6 문서는 온실을 후반 큰 현장 사건/압축 검증판으로 설명한다. 이 pair는 사용자 방향을 사람용 목표로 우선 기록하지만, 기존 W6 코드·Resource·검증 결과·C6 owner를 자동 수정하지 않는다.

최종 승인 뒤 별도 reconciliation unit은 다음을 먼저 결정한다.

1. 현재 W6 target/Preview/receipt를 첫 지도 실습에 얇게 재사용할지, 아니면 후속 현장 사건으로 보존할지.
2. 온실의 규모, 위협, 결과 상태를 첫 실습에 맞게 줄일지와 W6 human-validation evidence를 어떻게 재해석할지.
3. C6의 후속 큰 현장 사건을 새 owner에서 어떤 구체 내용으로 정할지.

그 전에는 현재 W6를 첫 실습과 runtime-equivalent라고 주장하지 않는다.

## 3. 핵심 규칙과 불변식

1. 플레이어에게 드러나는 주문 흐름은 항상 `글자 → 주문 → 대상 → 시전`이다.
2. 내부 주문 구조는 `FIVE_POINT_STAR`: 중앙 main glyph 정확히 1개와 0-5개 동등한 auxiliary vertex를 유지한다.
3. target은 circuit Preview 뒤에 고르며, final Preview 뒤의 commit은 명시적으로 정확히 한 번만 수행한다.
4. 교수의 예시는 안전한 선례이지 정답 키가 아니다. hidden best route, automatic target, automatic commit은 금지한다.
5. 모든 Chapter는 발견·학습, 선택·준비, 통제 응용, 실전·책임, 복기·다음 질문의 다섯 기능을 보존한다. 장면 순서와 형식은 변주한다.
6. 수업, 축제/일상 응용, 현장 실습/전투, 마도서 복기는 서로 다른 성장 증거를 만든다. 전투는 성장과 평가를 독점하지 않는다.
7. 실패/부분성공/부작용은 삭제하지 않고 결과, 발견, 책임, 복기의 다음 입력으로 보존한다. 정상 완주를 막지 않는다.
8. 온실/묘목은 수업 직후의 **첫 지도 실습 사건**이지 게임 전체의 유일/메인 콘텐츠가 아니다. 현재 W6 구현과 동일시하지 않으며 reconciliation 전에는 설계 의도다.
9. 1학년 Chapter 4 축제는 통제 응용이다. 첫 46분 vertical slice 끝에서는 비플레이형 glimpse만 허용한다.
10. 장기 content/asset을 1학년 Demo의 human/device/full-slice 검증보다 먼저 대량 생산하지 않는다.

## 4. 상태·데이터·이벤트 소유자

| 영역 | 장기 상태/이벤트 | 현재 owner | 구현 전 확인 |
| --- | --- | --- | --- |
| 학습 | 글자 의미, 안전 예시, 관찰 질문, 짧은 작성 | Chapter/수업 design owner | 직접 작성 입력과 Korean readability |
| 주문 만들기 | glyph source, FIVE_POINT_STAR, prepared spell Preview | Spell Workflow/Product Root | typed stock와 prepared spell의 의미가 UI에서 혼동되지 않는지 |
| 주문 쓰기 | target, final Preview, explicit cast, Mana/result receipt | W6 typed context + existing coordinator/ledger | exactly-once, rollback, insufficient Mana, duplicate commit |
| 자유일정 | 휴식/준비/교류/선택형 현장실습 중 중심 행동 하나 | Year-One growth/economy owner | 필수 정보/성장/해법 독점 여부 |
| 통제 응용 | 축제/일상 조건, 초기 설계, 조건 변화, 유지/재설계 | Chapter 4 design owner | value branch가 hidden ranking으로 바뀌지 않는지 |
| 전투/실습 | 한 위협의 환경 불안정, 보호/통제 목표, 안전 Anchor | Battle rules + situation owner | 반복 파밍과 메인 사건 대체 금지 |
| 현장 결과 | protected/lost/side effect/discovery/remaining uncertainty | Result/Grimoire owner | 결과가 UI 수치 등급으로 환원되지 않는지 |
| 포트폴리오 | learning/noncombat application/field responsibility/reflection | Year-One growth/economy owner | 단일 전투/성적 route 독점 금지 |
| 학년말 원리 | 마도서 근거, 보존/변경, 첫 제한 개정 | Year-One Chapter 7 + world owner | save reset/타인 선택 삭제로 해석되지 않는지 |

## 5. 화면·시스템별 구현 책임

| 우선 단위 | 플레이어 경험 | 필요한 입력 | 완료 결과 | 현재 상태 |
| --- | --- | --- | --- | --- |
| A. W6 human validation | 묘목/구조 선택의 동등성, Preview, explicit cast, receipt 이해 | 현재 Product Root, W6 observation script, target device | 사람/기기 관측 evidence | 준비됨, 실행 전 |
| B. First 10 minutes | 수업 5분 → 지도 실습 5분의 학습 전이 | W1-W4 content, direct writing, micro-star, training target | 10분 안 첫 환경 반응 | 설계 완료, 구현 전 |
| C. Chapter 2/3 support | 자유일정과 비교 관찰로 문맥/계열을 읽음 | schedule state, noncombat application, evidence capture | 선택 후 다음 메인 장면으로 복귀 | 설계 완료, 구현 전 |
| D. Chapter 4 festival | 실용/표현/우아함 모두 유효한 통제 응용 | event condition, participant reaction, redesign choice | relation/noncombat evidence + result record | 설계 완료, 구현 전 |
| E. battle practicum | 한 위협의 불안정 원인을 통제/보호 | battle state, anchor/retry, result tag | 현장 기록, 반복 감쇠, schedule close | 설계/부분 자산 후보, 구현 전 |
| F. Chapter 5-7 | 실패 복기, 후속 현장 책임, 첫 세계 개정 | research/craft/result/portfolio, later-field owner | 1학년 first principle and year-two bridge state | 설계 완료, 구현 전 |

각 단위는 독립적으로 user-approved exact scope, data owner, save migration, test/human plan을 정한 뒤에만 구현한다. A를 통과했다고 B-F의 구현 권한이 생기지 않는다.

## 6. 정상·실패·복구·경계 사례

| 사례 | 기대 동작 |
| --- | --- |
| 수업에서 의미를 구분하지 못함 | 재시도/보조 설명은 제공하되, 교수 답안을 강제하거나 다음 진행을 영구 차단하지 않는다. |
| 지도 실습의 FOCUS/DISPERSE 선택 | 둘 다 부분적으로 유효하며 보호 대상과 남는 문제의 형식만 달라진다. best answer 표시 금지. |
| 주문에 target이 없거나 final Preview 전 시전 요청 | explicit target/final Preview 단계로 복귀한다. 자동 표적/자동 commit 금지. |
| Mana 부족, duplicate commit, transaction failure | result/Mana의 부분 반영 없이 기존 atomic rollback/실패 feedback contract로 복구한다. |
| 선택형 전투 실패 | safety Anchor 재시도는 가능하지만 메인 사건을 자동 해결하거나 무한 영구 보상을 만들지 않는다. |
| 축제의 초기 설계가 조건 변화에 맞지 않음 | 유지 또는 재설계의 결과를 설명한다. 효율만으로 hidden grade를 부여하지 않는다. |
| 첫 온실 지도 실습에서 보존 대상을 비교 | 묘목/구조의 가치 차이를 Preview/결과로 설명하되, 숨은 우열이나 큰 현장 사건 수준의 손실을 강제하지 않는다. 현재 W6와의 데이터/consumer reconciliation은 별도 승인 단위다. |
| 1학년 포트폴리오가 낮음 | 메인 진행/핵심 관계/수강을 영구 봉쇄하지 않는다. Bridge 또는 다음 학기 회복 경로를 유지한다. |
| 장기 설계가 현재 W6를 덮으려 함 | W6 human validation을 최우선으로 유지하며, 대량 Chapter/asset 제작을 막는다. |

## 7. 자산 입력과 실제 소비 위치

| 자산/자료 | 현재 상태 | 실제/예정 소비 | 이번 pair의 처리 |
| --- | --- | --- | --- |
| 6 glyph PNG | runtime consumer 존재 | glyph writing/source selection | 재사용, 새 생성 불필요 |
| greenhouse field base | Product Root에 bound | 현행 W6 환경 배경, 첫 지도 실습 후보 공간 | 실제 첫 실습 scene binding은 재조정 전이며, 구현 기준선으로만 노출 |
| school common / battle arena 후보 | source candidate, unbound | 수업/축제, 전투 장면 가능성 | runtime 적용/승격 금지 |
| W6 warm academy board | user-approved planning reference only | 현재 W6 선택 감정의 참고 | 첫 지도 실습의 규모/내용을 확정하는 asset이 아님 |
| class/festival human-blueprint key-scene references | user batch-approved planning references | 사람용 청사진에서 수업·축제의 역할과 장면 순서를 검토 | `CANON_REGISTERED_PLANNING_REFERENCE_ONLY`; runtime 적용·asset batch·character canon·release use 금지 |
| live Korean font/Icon evidence | rights/readability validation 미완료 | 모든 live UI | 기존 asset/right owner에서 후속 검증 |

## 8. 저장·호환·플랫폼 경계

- 플랫폼 기본값은 mobile landscape fixed이며 PC는 후속 플랫폼이다.
- 기능 전환점(수업 종료, 실습 결과, 자유일정 결정, 축제 재설계, 전투 결과, Grimoire 기록)은 save/resume Anchor 후보이다.
- 결과/발견/부작용/remaining uncertainty는 장기 상태로 보존하되, 실패를 지우거나 save reload를 최적 점수 필수 행동으로 만들지 않는다.
- 새 Chapter state를 추가할 때 기존 W6 typed context, prepared spell, result receipt, portfolio evidence의 소유 경계를 침범하지 않는다.
- 한국어 live UI의 폰트 권리/가독성과 Android/Windows export는 현재 `NOT_RUN`; long-term UI 완료로 승격하지 않는다.

## 9. 테스트와 사람 검증 계획

| 단계 | 검증 질문 | 증거 기준 | 현재 상태 |
| --- | --- | --- | --- |
| W6 human validation | 묘목/구조 선택이 동등하게 이해되고 Preview/receipt가 읽히는가? | 관찰 script + 실제 세션 기록 | 준비됨, 미실행 |
| W6 device/performance/accessibility/export/full-slice | target device에서 조작/읽기/성능/내보내기가 가능한가? | 실제 기기와 export evidence | 미실행 |
| First 10 human slice | 10분 안 첫 환경 반응을 보고, 글자 의미와 선택 이유를 설명하는가? | 참가자 관찰, 시간, 회상 | 구현 후 필요 |
| Festival comprehension | 세 해법이 성공 가능한 가치 차이로 읽히며 효율 정답으로 오인되지 않는가? | 플레이 세션과 회상 인터뷰 | 구현 후 필요 |
| Battle responsibility | 전투가 파밍/처치 속도보다 원인 읽기와 보호 판단으로 인식되는가? | 플레이 로그 + 관찰 | 구현 후 필요 |
| Year-One closure | 첫 원리가 1년간의 마도서 근거에서 나왔다고 느끼는가? | 완주 playtest | 구현 후 필요 |

자동 테스트와 static check는 각 기능 계약을 보호할 수 있지만, 위 Human/Device/Performance/Full Slice 질문에 PASS를 주지 않는다.

## 10. 구현 순서·수용 기준·롤백

### 권장 순서

1. **현재 W6 human validation을 실제 실행한다.** 이 pair가 즉시 허가하는 유일한 제품 검증 후속은 기존 current scope 내의 evidence collection이다.
2. 그 증거를 보존한 채, 온실/묘목을 첫 지도 실습으로 재배치하는 reconciliation unit을 user-approved scope로 분리한다.
3. W1-W4를 단일 vertical progression으로 만들되, 수업/지도 실습/자유일정/축제를 각각 독립 검수한다.
4. 선택형 실습 전투를 단일 위협/환경 보호 목표로 도입하고 반복 파밍 방어를 검증한다.
5. C5-C7은 결과/Grimoire/portfolio state가 실제로 작동한 후 별도 구현 계획으로 나눈다.
6. 장기 visual/character/production asset batch는 각 Scene의 concrete runtime consumer와 rights preflight 후에만 시작한다.

### 수용 기준

- 사용자 승인된 unit별로 player promise, 포함/제외, owner, state, edge cases, asset needs, save behavior, automated checks, human test가 문서화된다.
- 성공/부분성공/실패/재시도/귀환이 막다른 경로 없이 의미 있게 다음 상태로 이어진다.
- 장기 설계가 W6의 existing target/Preview/explicit cast/receipt contract를 후퇴시키지 않는다.
- 장면이 runtime에 들어가기 전 `구현 기준선`, `설계 의도`, `사람 검수 전`, `시각 참고` 상태를 혼동하지 않는다.

### 롤백

- 새 Chapter/scene/state는 독립된 user-approved unit으로 작업해 현재 W6 Product Root와 분리한다.
- 문제가 생기면 해당 unit의 scene/data 연결만 되돌리고, existing W6 Resource/coordinator/result ledger를 바꾸지 않는다.
- 장기 visual 후보는 user approval 전 canon/runtime에 승격하지 않으므로 후보 제거만으로 복구 가능해야 한다.

## 11. 사용자 승인 기록

```yaml
review_status: USER_FINAL_REVIEW_AWAITING
user_direction_received: "장기적으로 게임 완성. 온실/묘목은 첫 실습 사건이며 수업/실습/전투/축제까지 진행."
recommended_review_decision:
  include:
    - 장기 1학년 7 Chapter 사람용 구조
    - 수업/실습/전투/축제/현장/복기 연결
    - 온실/묘목을 첫 지도 실습 사건으로 재배치하는 방향
    - W6 검증 우선순위 유지
  exclude:
    - 장기 코드/scene/data/asset 즉시 제작
    - current W6 human/device gate의 우회
    - 기존 W6/C6 owner의 무단 변경
    - W7, Task8, production asset batch 자동 확장
implementation_authority_after_review: USER_MUST_AUTHORIZE_EXACT_UNIT
approval_evidence: null
```

이 문서의 승인 대기 상태는 PDF가 마음에 든다는 감상과 구현 권한을 분리한다. 사용자가 pair ID `GRIMOIRE-HGB-20260830-01`, revision, 포함 단위, 제외 단위를 명시하면 그때 한 unit씩 실행 계획으로 전환한다.
