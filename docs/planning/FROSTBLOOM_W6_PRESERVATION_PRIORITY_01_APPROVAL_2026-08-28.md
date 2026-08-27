# GM-FROSTBLOOM-W6-PRESERVATION-PRIORITY-01 — W6 보존 우선순위 선택

## 1. 결정 상태

```yaml
decision_id: GM-FROSTBLOOM-W6-PRESERVATION-PRIORITY-01
parent_decision: GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01
approval: USER_APPROVED_RECOMMENDED_OPTION_A
approval_source: 2026-08-28 user message "권장안대로 진행해"
github_issue: 221
scope: FIRST_MAJOR_FROSTBLOOM_SOLUTION_TARGET_PRIORITY
work_mode: PLAN
implementation_authority: NONE
production_asset_authority: NONE
runtime_validation: NOT_RUN
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```

## 2. 결정

W6의 첫 주요 Frostbloom 해결에서 플레이어는 같은 불안정 현상에 대해 다음 두 **동등하게 유효한 보존 우선순위** 중 하나를 직접 고른다.

| Player-facing target | 보존하는 가치 | 포기하거나 남기는 가치 |
| --- | --- | --- |
| **희귀 묘목 우선** | 서리꽃에 노출된 희귀 묘목의 생장·회복 가능성 | 온실 구조의 균열과 다음 환경 위험 일부가 남는다. |
| **온실 구조 우선** | 유리 지붕·지지대·관개 구조의 붕괴 위험 | 희귀 묘목 일부가 더 큰 스트레스 또는 보존도 손실을 겪는다. |

두 선택은 적·현상의 불안정도를 해소하는 같은 상황 해결 안에 속한다. 하나를 “정답”, “안전”, “추천”, “최적”으로 표시하지 않으며, 장기 보상·관계·성공률에 숨은 우열을 붙이지 않는다.

## 3. 플레이어 가치 추적

```yaml
player_promise: "나는 주문의 위력을 고르는 것이 아니라, 지금 이 온실에서 무엇을 먼저 지킬지 책임 있게 정한다."
meaningful_choice: "희귀 묘목의 회복을 먼저 지킬지, 온실 자체의 붕괴 위험을 먼저 막을지 고른다."
expected_experience: "둘 다 살리고 싶지만 지금은 한쪽을 우선해야 한다. 시전 전에 남는 위험을 이해했고, 결과를 내 선택으로 설명할 수 있다."
research_question: "신규 플레이어가 두 대상의 보존 가치와 포기한 가치를 읽고, 자신이 고른 이유를 말할 수 있는가?"
observable_signal:
  - "시전 전 플레이어가 두 대상 중 무엇을 먼저 지키는지와 남는 위험을 설명한다."
  - "결과 Receipt에서 실제로 보존된 것과 남은 손실을 자기 선택과 연결한다."
  - "두 선택을 색상이나 외형만 다른 동등한 버튼으로 오해하지 않는다."
evidence_ceiling: INTERNAL_DESIGN_AND_AUTOMATED_CONTRACT_ONLY_UNTIL_HUMAN_PLAYTEST
slice_acceptance: "Human Slice에서 대상 선택 이유와 결과 인과를 설명할 수 있으면 유지한다. 그렇지 않으면 문구·정보 계층·시각 대비만 먼저 재작업한다."
```

## 4. 기존 권위와의 정합성

```text
direct glyph writing
→ FIVE_POINT_STAR circuit
→ existing W6 base preview
→ explicit preservation target
→ Bounded Consequence Forecast
→ explicit cast exactly once
→ actual consequence receipt
→ Result / Grimoire causal debrief
```

- `GM-SPELL-WORKFLOW-UI-V2-01`의 **글자 → 주문 → 대상 → 시전**을 유지한다.
- `GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01`의 `KNOWN_IMPROVEMENT`, `UNCERTAIN_CONSEQUENCE`, `FINAL_TARGET_SUCCESS_BREAKDOWN`, `MANA_COST`와 명시 Commit을 그대로 소비한다.
- `GM-BATTLE-RULES-01`의 불안정도·환경 보존도·부분 성공·부작용/희생·결과 기록을 소비한다.
- 현재 Product Root의 `WARD`/`FLOWER`는 thin prototype의 역할 표지다. 이를 최종 Frostbloom 대상명이나 Scene 구현 사실로 해석하지 않는다.

## 5. Preview·결과 계약

### 5.1 Target Preview

대상 선택 뒤, 실제 UI는 다음을 라이브 텍스트·아이콘·상태 표현으로 읽게 한다. 배경이나 생성 이미지에 기능 문구·수치·정답 표식을 굽지 않는다.

| Field | 희귀 묘목 우선 | 온실 구조 우선 |
| --- | --- | --- |
| 확인된 기대 | 묘목의 현재 냉해·생장 압력을 완화 | 균열·지지대·관개 구조의 붕괴 압력을 완화 |
| 남는 위험 | 구조 균열과 다음 환경 위험 | 묘목의 스트레스와 회복 지연 |
| 미확인 | 정령 반응 및 조사되지 않은 결합 영향 | 정령 반응 및 조사되지 않은 결합 영향 |
| Commit | 해당 대상에 한 번 명시 시전 | 해당 대상에 한 번 명시 시전 |

`UNKNOWN_FACTS_NOT_INVENTED`를 유지한다. 미확인 정령 반응이나 옛 수복 구조는 hidden wrong-answer, hidden Mana surcharge, 사후 훈계가 아니다.

### 5.2 Result Receipt

결과는 최소 다음 세 가지를 분리한다.

1. 실제로 보존·개선된 대상
2. 선택 때문에 남은 환경 위험 또는 보존도 손실
3. 아직 관찰되지 않은 사실

결과는 전체 점수나 선악 평가로 합치지 않는다. 이후 Reveal이 오더라도 이 첫 수용 결과의 실제 개선을 되돌려 거짓으로 만들지 않는다.

## 6. 범위와 금지

### In scope

- W6 단일 상황의 두 대상 우선순위와 Preview/Receipt 의미.
- Frostbloom 계획·Notion Flow/Visual 설명·planning visual brief.
- Human Slice에서 검증할 선택 이해 관찰 항목.

### Out of scope

- Godot Scene, Node, GDScript, Data/Resource, 전투 수치, Mana/성공률 공식.
- 신규 캐릭터 identity, 대사, 보상, 경제, 관계 수치, time-pressure 시스템.
- production asset batch, generated runtime asset, `FrostbloomBattleScene` binding.

### Prohibited

- 자동 Target·자동 Cast·Commit 전 소비·Best Route·named intent menu.
- 한 선택을 성공, 다른 선택을 실패로 고정하는 숨은 판정.
- 기능 텍스트·수치·상태 truth를 배경 또는 planning board에 굽기.

## 7. 대안 검토와 최종 판정

| Option | 판정 | 이유 |
| --- | --- | --- |
| A. 희귀 묘목 우선 vs 온실 구조 우선 | **ADOPT** | 기존 환경 보존도·부분 성공·Result/Grimoire 계약과 직접 맞고, 첫 선택의 이유를 즉시 설명하기 쉽다. |
| B. 빠른 해결 vs 안전한 안정화 | ADAPT LATER | 긴장에는 유효하나 timer·위험 수치가 먼저 필요해 현재 첫 검증 범위를 넓힌다. |
| C. 즉시 효과 vs 조사·기록 | REJECT FOR W6 | 발견의 가치는 있으나 첫 주요 시전을 늦추고, W6의 기존 조사/Forecast 구조와 중복된다. |

**Differentiation:** 피해량 최적화가 아니라 현재 세계의 서로 다른 보호 가치를 저울질한다.

**Remaining uncertainty:** 두 보호 가치가 모바일 화면에서 동등하게 읽히는지, 플레이어가 이를 숨은 정답 문제로 오해하지 않는지는 Human/Device test 전까지 미확정이다.

## 8. Project Incident / Solution / Lesson

```yaml
incident: "Current Product Root has two valid targets, but no canonical first-situation trade-off that lets a player predict what each target protects and leaves behind."
solution: "Bind W6's two target roles to rare seedlings versus greenhouse structure, reusing existing Forecast and Result authorities."
lesson: "A target-choice UI becomes meaningful only when preservation value and forgone value are both visible before explicit commit."
base_promotion: NO_BASE_PROMOTION
base_promotion_reason: "The target identities and W6 progression are GRIMOIRE-specific; Base already requires player-value traces and visible trade-offs."
```

## 9. Validation and next gate

```yaml
automated_contract: REQUIRED_BEFORE_FUTURE_IMPLEMENTATION
human_slice_questions:
  - "무엇을 먼저 지켰고, 무엇이 남는다고 예상했나요?"
  - "다른 대상을 고르면 무엇이 달라질 것 같았나요?"
  - "결과에서 실제로 지킨 것과 포기한 것을 찾을 수 있었나요?"
current_evidence: PLANNING_ONLY
next_design_gate: PROJECT_CORE_SCENE_VISUAL_BOARD_TEXT_BRIEF_APPROVAL
next_product_gate: TASK9_USER_VERTICAL_SLICE_VALIDATION_PENDING
```

## 10. 적대적 검토

| Failure assumption | 판정 | Guard |
| --- | --- | --- |
| 두 대상 중 하나가 사실상 정답이다. | REJECTED | 두 Preview 모두 실제 보존·남은 위험·공통 미확인을 표시하고, 보상·관계·성공률에 숨은 우열을 두지 않는다. |
| Unknown이 사후 벌점이나 답안 키가 된다. | REJECTED | Unknown은 Bounded Forecast의 범주형 미확인으로만 남고, 숨은 Mana/성공률 벌점으로 쓰지 않는다. |
| 현재 Product Root의 WARD/FLOWER가 Frostbloom final 구현으로 오인된다. | REJECTED | 역할 표지로만 기록하고 final 대상명·Scene binding이 아니라고 명시했다. |
| 사용자 제공 이미지가 캐릭터·세계·UI 정본을 다시 정한다. | REJECTED | reference-only 범위와 금지 표현을 visual brief에 분리했다. |
| planning board가 production asset 또는 Human UX PASS로 승격된다. | REJECTED | brief 상태를 `TEXT_BRIEF_READY__USER_IMAGE_APPROVAL_REQUIRED`로 고정했고, 후속 결과도 `GENERATED_EXPLORATION`으로 제한한다. |

결론: `NO_CONFLICT` — 현재 승인 범위 안의 기획 충돌은 발견되지 않았다. 선택의 공정성·가독성은 Human/Device test 전까지 `NOT_RUN`이다.
