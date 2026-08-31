# 공용 서클 · 사건 시계 · 마도 카드 코어 교체 설계

## 상태

```yaml
decision_id: GM-CIRCLE-CLOCK-CARD-CORE-01
feature_id: FTR-CIRCLE-CLOCK-CARD-CORE-01
status: USER_APPROVED_L2__IMPLEMENTATION_PLAN_READY
approved_at: 2026-08-31
spec_review_approved_at: 2026-08-31
implementation_plan: docs/superpowers/plans/2026-08-31-circle-clock-card-core-replacement.md
approval_source:
  - "확정하고 진행해"
  - "별형 주문은 없앨거야"
  - "메인화면에서 수업/실습/결투/축제 선택하는게 아니라 스토리 따라진행해야지"
authority_domain: REPOSITORY_STRUCTURED_CANON
source_role: L2_CORE_REPLACEMENT_DESIGN
publication_policy: source_only
supersedes:
  - GM-STAR-CIRCUIT-MASTERY-BALANCE-01:runtime_circuit_topology
  - GM-STAR-CIRCUIT-MASTERY-BALANCE-01:main_auxiliary_glyph_roles
  - GM-SPELL-WORKFLOW-UI-V2-01:star_circuit_player_flow_only
preserves:
  - direct_glyph_writing
  - explicit_target_selection
  - explicit_exactly_once_commit
  - visible_pre_commit_preview
  - no_auto_target
  - no_auto_commit
  - no_hidden_best_route
implementation: TASK8_STAR_RUNTIME_REMOVED__PARTIAL_CORE_REMAINS
asset_ready: NOT_RUN
machine_verification: PASS_CUSTOM_GODOT_RUNNER_31_SUITES_1370_ASSERTIONS
runtime_verification: EXACT_WORKTREE_GODOT_4_7_1_FRONT_DOOR_AND_EVENT_UI_OBSERVED
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
```

## 1. 결정과 플레이어 약속

GRIMOIRE의 주문 핵심을 `FIVE_POINT_STAR`와 `Main/Auxiliary` 역할 구조에서 완전히 전환한다. 새 런타임의 중심은 역할 없는 공용 글자 1~3개를 겹서클로 조합하는 주문, 그 주문과 행동의 의미를 판정하는 사건 시계, 그리고 같은 글자 언어를 사용하는 마도 카드다.

플레이어는 마법학교의 이야기를 순서대로 경험한다. 수업·실습·결투·축제는 메인 화면에서 고르는 독립 모드가 아니라 서사 일정과 사건에 따라 열린다. 카드 결투도 이야기 안에서 마법사들이 전투를 연습하거나 관계·과제를 해결하는 방식으로 등장한다.

```text
새 기록 / 유효 기록 이어하기
→ 입학식과 프롤로그
→ 수업에서 글자와 겹서클을 배움
→ 실습 사건에서 시계의 압박과 해소를 경험
→ 이야기상 필요한 결투 연습에서 카드 사용
→ 축제·조사·장기 사건으로 확장
```

온실과 묘목은 첫 사건 검증 장소일 뿐, 전체 게임의 중심 내용이나 메인 메뉴의 선택지가 아니다.

## 2. 범위와 제외 범위

### 포함

- 기존 별형 주문 런타임·UI·전용 테스트·소비처의 제거와 공용 서클 시스템으로의 교체
- 1~3개 글자 조합, 겹서클 표현, 조합 Preview, 명시 실행
- 목표 시계와 위협 시계를 중심으로 한 사건 엔진
- 공용 글자를 소비하는 카드 데이터·도감·라운드 상태·규칙 셸
- 이야기 주도형 새 메인 화면과 프롤로그 진입
- 이미지 후보의 필요성·소비처·승인 경계 정의
- 새 코어에 대한 단위·통합·런타임 검증 계약

### 이번 L2에서 확정하지 않는 것

- 카드의 드로우, 멀리건, 선공, 패스, 공격 대상, 필드 슬롯, 피해 수식, 동점 처리, 덱 수, 희귀도
- 카드의 완성형 경쟁 대전 밸런스
- 카드별 수치와 최종 카드 풀
- 장기 저장 데이터의 실제 버전 마이그레이션 구현
- 카드 일러스트의 production batch 및 runtime 승격
- 사람·모바일·성능·접근성·출시 PASS

미확정 카드 룰은 빈칸을 임의의 AI 규칙으로 채우지 않는다. 데이터와 화면에는 `RULESET_PENDING`으로 노출하며, 사용자가 상세 룰을 주면 별도 L2 보충 설계에서 확정한다.

## 3. 새 코어 아키텍처

```text
GlyphDefinition (역할 없는 글자·의미 태그)
        ↓
CircleComposition (글자 1~3개, 겹서클, 논리 조합 서명)
        ↓
CompositionResolver (의미·방법·비용·위험 Preview)
        ├── EventClockResolver (이야기 사건의 목표/위협 변화)
        └── CardResolver (카드의 공용 조합 해석)
                    ↓
         ExplicitAction / Exact-once Result Ledger
                    ↓
       StoryProgress · Event Result · Card Round Result
```

### 3.1 역할 없는 공용 글자

`GlyphDefinition`은 글자의 이름, 직접 필기 표현, 의미 태그, 가능한 방법 태그, 학습·소유 상태를 가진다. `MAIN`, `AUXILIARY`, 중심, 꼭짓점, 슬롯 보너스는 갖지 않는다.

각 `CircleComposition`은 다음을 가진다.

```yaml
glyph_count: 1_to_3
glyph_instance_ids: required
logical_signature: canonical_order_independent
visual_layer_order: presentation_only
duplicate_policy: per_content_rule_not_global_slot_rule
target_independent_preview: required
explicit_target_and_commit: required_before_resolution
```

논리적 조합은 글자의 배열 순서와 무관하게 같은 서명으로 해석한다. 반면 화면에서 겹서클이 놓이는 층 순서는 미적·가독성 목적의 표현 값이며, 숨은 위력 보너스를 만들지 않는다.

조합 Preview는 최소한 다음을 보여 준다.

- 만들어지는 주문 이름 또는 의도
- 사용 글자와 의미 태그
- 사건에 적합한 방법, 부분 적합, 위험의 이유
- 대상 전 비용·위험
- 대상 선택 뒤의 결과 변화와 명시 실행 전 취소 가능 여부

최종 성공률·정확한 피해·카드 수식은 이번 설계의 확정 대상이 아니다. Preview는 구현되지 않은 수치의 확정값을 가장하지 않는다.

### 3.2 사건 시계

사건은 해결과 위험을 각각 추적한다. 시계는 실제 벽시계 시간이 아니라 이야기에 의미 있는 행동·단계·합병증의 누적 상태다.

```yaml
EventDefinition:
  event_id: required
  narrative_owner: required
  goal_clock: required
  threat_clock: required
  phase_triggers: required
  method_conditions: required
  completion_consequences: required

EventClockDefinition:
  clock_id: required
  kind: GOAL | THREAT
  segment_count: 4 | 6 | 8_or_content_override
  public_label: required
  tick_conditions: required
  completion_result: required

EventClockState:
  current_segments: 0_to_segment_count
  resolved_action_ids: exactly_once_set
  visible_scene_state: required
```

초기 검증 사건은 목표 `서리 안정화`와 위협 `온실 균열 확산`을 한 쌍으로 사용한다. `6`과 `4`는 첫 플레이테스트를 위한 시험값이며, 최종 밸런스 수치가 아니다.

시계 변화 규칙은 다음을 지킨다.

1. 대화 열람, 메뉴 탐색, 멈춘 화면은 시계를 움직이지 않는다.
2. 사건의 의미 있는 행동을 확정했을 때만 장면 시간이 진행한다.
3. 글자·조합·대상·방법이 사건 조건에 적합하면 목표를 전진시키거나 위협을 낮출 수 있다.
4. 성공과 위험 증가는 동시에 발생할 수 있으나, 성공을 취소하지 않는다.
5. 한 행동은 하나의 식별된 `ClockResolution`만 적용한다. 재시도·신호 중복·화면 복귀로 시계가 두 번 움직이면 안 된다.
6. 위협 시계 완성은 숨은 게임 오버가 아니라 사건의 세계 상태·선택지·대가를 명시적으로 바꾼다.
7. 단일 정답 조합을 강제하지 않는다. 사건 데이터는 유효한 방법의 태그·이유를 표시하고, 복수의 접근을 허용한다.

### 3.3 마도 카드

카드는 공용 글자를 사용하는 두 번째 소비처다. 이야기 주문과 같은 조합 해석을 쓰지만, 손패·필드·라운드·마나는 이야기 상태와 분리한다.

```yaml
CardDefinition:
  card_id: required
  type: WIZARD | ATTACK_SPELL | DEFENSE_SPELL | SUMMON
  composition: CircleComposition_or_none
  story_unlock: required
  artwork_state: NEEDED | GENERATED_CANDIDATE | USER_APPROVED | IMPLEMENTED

CardRuleset:
  max_circle_count: 3
  rounds: 3
  mana_distribution_status: RULESET_PENDING
  mana_example:
    remaining_mana: 20
    illustrative_round_split: [7, 7, 6]
    is_balance_rule: false
  match_win_condition: FIRST_TO_2_ROUNDS
  unspent_prepared_spell: RESOLVE_ONCE_AT_ROUND_END
  player_remaining_mana: ROUND_JUDGMENT_INPUT
  unresolved_rules: RULESET_PENDING

CardBattleState:
  ruleset_id: required
  story_context_id: required
  round_index: required
  action_ids: exactly_once_set
```

`[7, 7, 6]`과 `20`은 **마력이 20 남은 특정 상황을 설명하기 위한 예시**일 뿐이다. 고정 밸런스, 기본 배분, 검증 조건, 마력 소비 규칙으로 취급하지 않는다. 마력의 실제 분배·소비·회복·라운드별 입력 방식은 `RULESET_PENDING`으로 유지한다.

카드 시스템은 이야기와 무관한 메인 메뉴 대전 허브가 아니다. 결투 수업, 친구와의 연습, 사건 해결 과정에서 필요한 카드 대결로 진입한다. 상세 카드 룰이 정해지기 전의 카드 화면은 도감·획득·조합·규칙 상태를 정확히 보여 주며, 실제 승패 계산을 가장하지 않는다.

## 4. 이야기 주도 메인 화면

메인 화면의 목적은 플레이어가 학교 생활을 자유 모드 목록에서 고르는 것이 아니라, 자신이 남긴 기록을 시작하거나 이어 가게 하는 것이다.

```text
메인 화면
├─ GRIMOIRE 로고와 마법학교 배경
├─ 새 기록 시작 → 입학식 프롤로그
├─ 이야기 이어하기 → 저장된 StoryProgress의 다음 장면
├─ 도감 → 이야기에서 해금한 카드만 읽는 보조 화면; 결투·모드 선택은 금지
├─ 설정
├─ 종료 → 확인 후에만 앱 종료
└─ 저장 데이터가 없는 경우, 이어하기를 비활성 사유와 함께 표시
```

`수업`, `실습`, `결투`, `축제`, `사건 기록`을 메인 메뉴의 모드 선택 버튼으로 두지 않는다. 도감은 해금된 마도 카드와 상세 결투 규칙의 대기 상태만 보여 주는 읽기 전용 보조 화면이다. 나머지 요소는 이야기 장면 안에서 서사 조건을 만족할 때 열리고, 해당 장면의 인물·대화·목표·시계와 함께 제시된다.

메인 화면에는 활성 사건 시계를 두지 않는다. 시계는 사건 안에서만 살아 있는 압박이며, 로고 화면에서 플레이어를 처벌하지 않는다.

### UI와 시각 원칙

- 기존 승인 Logo 01과 Soft Storybook Cel 2D Hybrid / warm academy 톤을 재사용한다.
- 배경 이미지는 배경만 소유한다. 기능 글자·버튼·수치·시계 칸은 Godot UI 레이어가 소유한다.
- 좌측 하단·우측의 의미 없는 빈 프레임을 만들지 않는다.
- 대화 장면은 승인된 금색 장식 테두리 스타일을 유지하되, 메인 메뉴는 대화창을 복제하지 않는다.
- 글자는 부적이나 수집 토큰보다 직접 쓰인 마력 문자로 읽힌다.
- 카드의 학생 인물 일러스트는 상반신, 또래 학생의 인상으로 제한한다. SD는 후보 제작만 가능하며 이동 구현의 필수 요소가 아니다.

## 5. 자산 준비와 승인 경계

새 코어의 첫 사용자 대면 화면에는 다음 후보가 필요하다.

| 소비처 | 필요한 후보 | 상태 | 금지 사항 |
|---|---|---|---|
| 메인 화면 | 마법학교 전경 또는 입학식 직전의 따뜻한 교정 배경 1종 | NEEDED | 기능 문자·메뉴·수치 baked-in |
| 사건 시계 | 상태 변화가 읽히는 UI 표현과 기존 배경 위의 제한적 VFX | BRIEF_READY_AFTER_SPEC_REVIEW | 공포/호러 전환, 실제 시간 압박 |
| 카드 UI | 프레임·카드 뒷면·네 타입의 빈 소비처 규격 | NEEDED | 다른 게임의 프레임 복제, baked 규칙 텍스트 |
| 카드 인물 | 학생 상반신 마법사 후보 | DEFERRED_UNTIL_CARD_CONTENT_EXISTS | 성인 교관 인상, SD 이동 필수화 |

이미지 후보는 이 설계의 사용자 검토와 소비처 브리프 확정 뒤에 하나씩 생성한다. 생성 성공은 사용자 승인, 정본 등록, 런타임 적용, 실제 화면 검증과 별개다.

## 6. 별형 제거와 데이터 안전

### 런타임 제거 대상

- `src/core/star/`의 별형 검증·계산·커밋 전용 코드
- `star_circuit_harness`와 별형 보드·스타 UI 컴포넌트
- 별형만을 전제하는 `PreparedSpell`, 요청, 배치 세션, Product Root 흐름
- 별형 전용 자동 테스트·실행기·런타임 참조
- 더 이상 사용되지 않는 별형 전용 scene/resource/import 부산물

새 공용 서클의 실행·결과 원자성 검증이 통과한 뒤에만 위 파일을 같은 변경 단위에서 제거한다. 삭제 전에 새 시스템과 기존 소비처를 함께 유지하는 장기 호환 계층을 만들지 않는다. 사용자가 요청한 대로 런타임에서 별형 주문은 남기지 않는다.

### 보존 대상

- Git 이력과 과거 승인 문서: 역사 provenance로 보존
- 직접 글자 작성 경험
- 명시 대상 선택과 명시 시전
- 예약·취소·중복 소비 방지·결과 기록의 원자성 원칙
- 사용자 소유의 실제 legacy Star 저장은 보존하며, 삭제·이동·자동 변환하지 않음

실제 legacy Star 저장은 확인됐고 사용자는 이를 보존하도록 결정했다. 새 서클/시계/카드 경험은 `새 기록`에서 별도로 시작한다. 장기 저장 데이터의 실제 버전 마이그레이션은 계속 이번 L2의 제외 범위이며, legacy 저장을 삭제·이동·자동 변환하지 않는다.

## 7. 구현 단계

### Phase A — 새 기준선과 공용 서클

1. 새 GlyphDefinition/Composition 계약과 테스트를 작성한다.
2. 역할 없는 1~3 글자 조합 Preview와 명시 실행 거래를 구현한다.
3. 기존 별형 runtime 소비처를 새 계약으로 교체한다.
4. 기존 별형 코드를 제거하고, runtime 경로에 별형 참조가 남지 않는 정적 검사를 추가한다.

### Phase B — 사건 시계와 첫 이야기 사건

1. EventDefinition, EventClockDefinition, EventClockState, ClockResolution을 구현한다.
2. 정확히 한 번 적용, 취소, 실패, 복귀, 동시 목표/위협 변화의 테스트를 작성한다.
3. 입학식 이후의 첫 실습 사건에 목표/위협 시계를 적용한다.
4. 시계 변화가 장면·대화·결과 기록으로 읽히게 한다.

### Phase C — 이야기 메인 화면과 시각 후보

1. 새 메인 씬을 `project.godot`의 기본 진입점으로 교체한다.
2. 새 기록 시작은 입학식 프롤로그로, 이어하기는 StoryProgress의 다음 장면으로 연결한다.
3. 메인 화면 배경 후보와 UI 레이어를 분리한다.
4. Godot 편집기에서 1280×720 landscape와 모바일 safe area를 확인한다.

### Phase D — 카드 규칙 셸

1. 네 종류의 CardDefinition과 CardRuleset을 구현한다.
2. 이야기에서 얻는 카드 도감과 3서클 조합 표시를 구현한다.
3. 3라운드·2라운드 승리·라운드 종료 1회 해석을 데이터로 검증하고, 마력 분배·소비는 `RULESET_PENDING`으로 유지한다. `[7, 7, 6] / 20`은 예시 메타데이터로만 표시하며 검증·기본값으로 사용하지 않는다.
4. `RULESET_PENDING` 전투 항목은 실제 대전 시작을 막고, 다음 상세 룰 결정으로 연결한다.

## 8. 실패·복구·적대적 검토

| 공격 또는 실패 | 방어 규칙 | 검증 |
|---|---|---|
| 별형 파일만 지우고 새 주문이 비어 버림 | 새 서클 흐름이 실행·결과까지 통과한 뒤 별형을 삭제 | 회귀 테스트 + main scene smoke |
| 메뉴를 읽는 동안 위협 시계가 오름 | 시계는 사건 행동 ID와 phase trigger로만 이동 | clock unit test |
| 같은 결과 신호가 두 번 와서 시계가 중복 이동 | `resolved_action_ids`로 exactly-once 처리 | duplicate resolution test |
| 사건이 한 정답 조합 암기로 변질 | 방법 태그·사유·복수 접근을 데이터로 표시 | content contract test |
| 카드 룰 미확정을 AI 기본값으로 고정 | `RULESET_PENDING`을 데이터와 UI에서 유지 | ruleset completeness test |
| 메인 메뉴가 모드 선택 허브가 됨 | 메인 씬은 새 기록/유효 이어하기/읽기 전용 도감/설정/종료 확인만 소유 | navigation integration test |
| 이미지에 기능 수치가 구워짐 | 기능 텍스트·시계·버튼을 live Control로 분리 | asset/UI ownership review |
| 실제 저장 데이터를 삭제 | 저장 preflight와 비파괴적 readback 후 별도 결정 | migration preflight receipt |

## 9. 수용 기준

다음 조건을 모두 만족하기 전에는 전환을 완료로 주장하지 않는다.

1. 기본 실행점이 별형 Product Root가 아닌 이야기 주도형 새 메인 화면이다.
2. 새 기록은 입학식/프롤로그로 이어지고, 수업·실습·결투·축제는 서사 조건으로만 열린다.
3. 공용 글자 1~3개 조합에 Main/Auxiliary/별 슬롯이 존재하지 않는다.
4. 적합한 글자·대상·방법이 사건 시계의 목표·위협 변화로 실제 반영된다.
5. 메뉴·대화 열람만으로 시계가 진행하지 않는다.
6. 같은 사건 행동을 다시 처리해도 시계·자원·결과가 중복 적용되지 않는다.
7. 카드 데이터는 네 타입과 승인된 라운드/마나 규칙을 표현하며, 미확정 대전 룰은 잠긴 상태로 드러난다.
8. 런타임 `src/`, 기본 씬, 테스트 runner에 별형 주문 소비처가 남지 않는다.
9. 별형 전용 코드·씬·테스트·사용하지 않는 자산은 제거되고, 역사 문서는 `SUPERSEDED`로만 남는다.
10. 자동 테스트, Godot 실행, 실제 편집기 UI 확인을 구분해 기록하며 Human/Device/Performance PASS를 과장하지 않는다.

## 10. 검토 요청

이 문서는 사용자가 확정·검토 승인한 전환 방향의 구조화 설계 원본이다. 구현 계획은 `docs/superpowers/plans/2026-08-31-circle-clock-card-core-replacement.md`에 연결됐다. 코드·씬·자산 변경은 아직 수행하지 않았으며, 다음 단계에서 이미지 후보와 Godot 구현을 진행한다.
