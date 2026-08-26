# GRIMOIRE Spell Workflow · Player-Facing Simplification

```yaml
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
decision_revision: 2026-08-26-PLAYER-FACING-SIMPLIFICATION
sync_id: GR-SYNC-20260826-37-SPELL-FLOW-PLAYER-FACING
status: USER_APPROVED_ACTIVE
approval_date: 2026-08-26
approval_source: 사용자 명시 승인 "좋아 그렇게하자"
change_type: PLAYER_FACING_UX_SIMPLIFICATION_ONLY
visual_revision_owner: docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_PLAYER_FLOW_REVISION_2026-08-26.json
product_implementation_mutation: NONE
runtime_authority_change: NONE
```

## 1. 승인된 플레이어 흐름

플레이어에게는 내부 Stage/서비스 구조를 그대로 노출하지 않고 아래 네 단어만 핵심 흐름으로 사용한다.

```text
글자
→ 주문
→ 대상
→ 시전
```

이를 실제 화면 경험 기준으로는 두 덩어리로 묶는다.

```text
주문 만들기
= 글자 선택·작성
+ FIVE_POINT_STAR 회로 조합
+ 완성 주문 이름 확인

주문 쓰기
= 게임 장면에서 대상 지정
+ 필요한 최종 Preview
+ 명시 시전
```

플레이어가 기억해야 하는 질문은 다음 두 개면 충분하다.

1. **이 글자로 어떤 주문을 만들까?**
2. **이 주문을 누구/무엇에게 쓸까?**

## 2. 플레이어 용어와 내부 용어 분리

다음 용어는 구현·데이터·테스트 정본에서 계속 사용하지만 기본 플레이어 UI의 주 용어로 사용하지 않는다.

- `Stock`
- `PreparedSpell`
- `Stage2`
- `Stage3`
- `Main Glyph`
- `Auxiliary Glyph`

플레이어 UI에서는 우선 다음 표현을 사용한다.

```yaml
Stock / Vault source: 글자 / 보관 글자
Stage2 placement: 주문 회로
PreparedSpell: 완성 주문 또는 완성 주문 이름
Stage3 target selection: 대상
Stage3 explicit commit/use: 시전
```

`Main / Auxiliary` 관계는 시스템을 배우는 도움말이나 상세 설명에서는 사용할 수 있지만, 초반 화면에서 먼저 암기시킬 용어가 아니다. 기본 설명은 **가운데 글자가 주문의 중심이고 주변 글자가 성질을 더한다** 수준을 우선한다.

## 3. 완성 주문 이름

회로 조합이 바뀌면 플레이어가 가장 먼저 확인해야 하는 결과는 숫자 목록보다 **완성 주문 이름**이다.

```text
글자 조합 변화
→ 회로 의미 변화
→ 완성 주문 이름 변화
```

단, 현재 승인 범위는 **주문 이름을 결과 요약의 중심에 둔다**는 UX 결정까지다. 실제 명명 문법, 조사/어미, 로컬라이징 규칙, 중복 이름 처리, 이름과 효과 수치의 정확한 대응 알고리즘은 아직 이 결정에서 새로 발명하지 않는다. 해당 규칙은 별도 설계·검증 대상이다.

## 4. 대상 지정 간략화

완성 주문을 선택한 뒤 별도의 복잡한 대상 선택 전용 화면을 필수로 두지 않는다.

권장 플레이어 흐름:

```text
완성 주문 선택
→ 게임 장면으로 복귀/유지
→ 장면의 대상 직접 선택
→ 필요한 최종 Preview
→ 명시 시전
```

대상 선택과 최종 시전은 **주문 쓰기**라는 하나의 UX 덩어리로 취급한다.

## 5. 내부 시스템 불변식

이번 결정은 현재 구현 authority를 제거하거나 단순화하지 않는다.

보존:

- `GM-STAR-CIRCUIT-MASTERY-BALANCE-01`
- `FIVE_POINT_STAR`
- 중앙 Main 1 + 외곽 Auxiliary 0~5 내부 구조
- typed glyph source / reservation / atomic consume
- Task4 Stage2 preparation authority
- immutable `PreparedSpell`
- Task5 Stage3 target/use atomic transaction authority
- explicit target
- final validation/preview가 필요한 경우 시전 전 제공
- explicit exactly-once commit/use
- invalid/cancel/error에서의 기존 rollback/consume 불변식

금지:

- 자동 Target
- 자동 시전
- 회로 고민을 제거하는 자동 최적 조합
- Stock을 완성 주문 보관함으로 재정의
- 플레이어 용어 간략화를 이유로 내부 transaction authority 중복 구현

## 6. 기존 Task와의 매핑

```yaml
Task6_Glyph_Drawing:
  player_group: 주문 만들기
  player_term: 글자
Task7_Circuit_Placement:
  player_group: 주문 만들기
  player_term: 주문 회로 / 완성 주문 이름
Task8_Spell_Use:
  player_group: 주문 쓰기
  player_term: 대상 / 시전
```

Task8은 여전히 Task5 Stage3 authority의 thin UI consumer다. 이번 결정은 Task8 구현 승인이 아니며, 현재 제품 구현 gate `TASK8_PR_PREP_REVERIFY_PENDING`를 자동 해제하지 않는다.

## 7. 시각 방향

최근 생성 시안에서 확인된 방향을 반영한다.

- 글자는 부적·패찰·카드보다 **직접 쓰인 마법 문자**로 읽혀야 한다.
- 획, 필기감, 빛나는 잉크/마력 흔적이 글자 정체성을 만든다.
- FIVE_POINT_STAR 슬롯에는 패찰을 꽂는 것보다 **글자를 회로에 직접 놓거나 쓰는 느낌**을 우선한다.
- 기존 3단 패널 `보관 글자 / 주문 회로 / 준비 주문`은 탐색용 시안으로 보존하지만, 앞으로 플레이어 용어는 **글자 / 완성 주문 이름 / 대상 / 시전** 중심으로 정리한다.
- `준비 주문`은 개발 의미의 PreparedSpell 설명에는 쓸 수 있지만, 기본 결과 라벨은 **완성 주문** 또는 **완성 주문 이름**을 우선한다.

시각 coverage revision:

`docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_PLAYER_FLOW_REVISION_2026-08-26.json`

## 8. Evidence ceiling

```text
PLAYER_FACING_FLOW_DECISION: USER_APPROVED
PRODUCT_IMPLEMENTATION: NOT_CHANGED
TASK8_IMPLEMENTATION: NOT_AUTHORIZED_BY_THIS_DECISION
HUMAN_USABILITY: NOT_RUN
DEVICE_VALIDATION: NOT_RUN
PERFORMANCE_VALIDATION: NOT_RUN
FULL_VERTICAL_SLICE: NOT_RUN
```

이 결정의 성공 여부는 향후 Human Slice에서 다음을 직접 확인해야 한다.

- 플레이어가 `글자 → 주문 → 대상 → 시전`을 별도 설명 없이 재진술할 수 있는가.
- 완성 주문 이름만 보고 회로 변화의 의미를 어느 정도 추론할 수 있는가.
- 대상 선택과 시전을 하나의 자연스러운 행동으로 느끼는가.
- 내부 용어를 숨겨도 비용·위험·실패 책임이 불투명해지지 않는가.
