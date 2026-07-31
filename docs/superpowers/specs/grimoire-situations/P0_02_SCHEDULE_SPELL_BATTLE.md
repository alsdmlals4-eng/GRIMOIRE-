# GRIMOIRE P0 상황 상세 02 — 자유일정·마법 작성·전투

## 문서 상태

```yaml
parent: GM-SITUATION-SCREEN-SPEC-01
status: USER_REVIEW_REQUIRED
situations:
  - SIT-GR-004 자유일정 선택
  - SIT-GR-005 Situation Challenge 관찰·준비
  - SIT-GR-006 직접 작성·인식·조합·Commit
  - SIT-GR-007 전술 전투·수호 소환
implementation: NOT_STARTED
```

---

# [SIT-GR-004] 자유일정 선택

## A. 상황 개요

- 발생 이유: 수업·시험·축제·현장실습 사이 완충과 준비.
- 현재 목표: `휴식 / 준비 / 교류` 중 다음 중요 일정에 맞는 행동 1개 선택.
- 알고 있는 정보: 다음 일정, 각 행동의 효용 축.
- 모르는 정보: 정확한 미래 결과와 모든 숨은 수치.
- 위험: 단일 최적 루트, 필수 정보 독점, 휴식이 손해 선택이 됨.
- 기대 보상: `CALM / PREPARED / CONNECTED` 태그와 짧은 장면.
- 감정: 숨 고르기, 자기 방식 선택, 관계와 준비의 균형.
- 핵심 선택: 세 행동 중 하나.
- 다음: 짧은 대화·연출 후 다음 중요 Session.

## B. 근거와 가정

- 확정: 자유일정 정확히 3회, 중심 행동 1개, 필수 진행 차단 없음.
- 실제 구현: 없음.
- 해석: 독립 대형 미니게임보다 Card 선택+짧은 Scene이 적합.
- 제안: Field 배경 위 `ScheduleOverlay`.
- 가정: 각 Card는 핵심 효과 1개와 짧은 예시 1개를 표시.
- 사용자 결정 필요: 정확한 수치·관계 표현·시간 소비 표기.

## C. 진입 조건

- 이전: 수업·시험·축제 완료 후 Field.
- Trigger: schedule slot available.
- Flags: current schedule index, completed session.
- Player: tags, hp/mana 후보, relationship.
- World: 학교 장소 Variant.
- 진입 불가: 이미 해당 Slot 완료, 중요 Session 강제 이벤트 중.
- 중복 방지: Slot에 `selection_token`을 발급하고 Commit 후 재사용 금지.

## D. 화면 목적

1. 다음 중요 일정.
2. 세 행동의 서로 다른 효용.
3. 선택이 필수 진행을 막지 않는다는 점.
4. 선택 후 얻은 태그·장면·다음 일정.

## E. 예상 화면

```text
┌──────────────────────────────────────────────────────────────┐
│ 자유일정 A                         다음: 첫 실기시험          │
│                                                              │
│ ┌───────────┐  ┌───────────┐  ┌───────────┐                 │
│ │ 휴식       │  │ 준비       │  │ 교류       │                 │
│ │ CALM       │  │ PREPARED   │  │ CONNECTED  │                 │
│ │ 입력 복구  │  │ 조건 예측  │  │ 다른 관점  │                 │
│ └───────────┘  └───────────┘  └───────────┘                 │
│                                                              │
│ 선택 상세 / 다음 Session에서 작동하는 방식                    │
│ [결정] [뒤로]                                                 │
└──────────────────────────────────────────────────────────────┘
```

- 비율: 16:9.
- Camera: Field 배경 유지·약한 dim.
- 최초 3초: 다음 일정과 세 선택.
- 위험 경고: 선택이 영구 차단을 만들지 않는다는 설명은 Tutorial 또는 Tooltip.

## F. 구성요소

| 요소 | 역할 | 표시 | 숨김 | 입력 | 우선 |
|---|---|---|---|---|---|
| Next Session | 맥락 | 항상 | 없음 | 없음 | 1 |
| Action Cards | 선택 | 3개 | 선택 완료 | Click·keys | 1 |
| Effect Axis | 효용 비교 | Card | 상세 닫힘에도 요약 | 없음 | 1 |
| Detail Panel | 구체 설명 | Focus Card | Focus 없음 | Scroll | 2 |
| Confirm | Commit | Card 선택 | 미선택 | Click·Enter | 1 |
| Back | Field 복귀 | Commit 전 | Commit 후 | Esc | 2 |
| Existing Tags | 중복·상쇄 확인 | 태그 있음 | 없음 | 없음 | 3 |
| Tutorial | 첫 일정 | 재열람 가능 | 이후 자동 숨김 | 확인 | 3 |

## G. 입력

| 입력 | 조건 | 반응 | 피드백 | 제한 |
|---|---|---|---|---|
| Click/Card | READY | Card focus | scale·outline | Commit 전 변경 가능 |
| Arrow/Tab | READY | focus move | focus ring | 3 Card 내 |
| Enter | selected | confirm 또는 Card 선택 | confirm state | 더블 Enter 차단 |
| Esc | Commit 전 | close | Field restore | Commit 후 불가 |
| Mobile Touch | 후행 | tap Card | touch state | PC P0 제외 |

## H. 흐름

| 단계 | 자동/입력 | 취소 | 저장 | 실패 | 반복 |
|---|---|---|---|---|---|
| Slot 검증 | 자동 | 불가 | 없음 | 가능 | 1회 |
| Overlay 표시 | 자동 | 가능 | 없음 | 없음 | 가능 |
| Card 비교 | 입력 | 가능 | 없음 | 없음 | 반복 |
| 선택 Confirm | 입력 | 확인 전 가능 | 없음 | 조건 변경 가능 | 1회 |
| Effect 계산 | 자동 | 불가 | pending | 가능 | idempotent |
| 짧은 Scene·Dialogue | 자동/입력 | 정책별 | 종료 후 | 자산 누락 | 1회 |
| Tag 적용·Checkpoint | 자동 | 불가 | 예 | 저장 실패 | 1회 |

## I. 시스템 반응

| 행동 | 조건 | 즉시 | 데이터 | 장기 | 다음 |
|---|---|---|---|---|---|
| 휴식 | Slot active | Calm preview | `CALM` | 다음 입력 복구 | DIALOGUE/FIELD |
| 준비 | Slot active | Condition preview | `PREPARED` | 위험 source 1개 공개 후보 | DIALOGUE/FIELD |
| 교류 | character available | portrait preview | `CONNECTED`·relation | 다른 관점·수호 timing 후보 | DIALOGUE/FIELD |
| 선택 취소 | Commit 전 | focus reset | 없음 | 없음 | SCHEDULE |
| 중복 Commit | token consumed | 무시 | 없음 | 중복 효과 없음 | TRANSITION |
| invalid action | condition changed | 차단 이유 | 없음 | 없음 | SCHEDULE |

## J. 필요한 시스템

| 시스템 | 역할 | 입력 | 출력 | 연결 |
|---|---|---|---|---|
| Schedule Controller | Slot·Card | schedule state | selection result | Flow·Save |
| Condition Evaluator | 사용 가능성 | SessionState | bool/reason | UI |
| Effect Resolver | 태그·관계 | action id | effects | Session·Dialogue |
| Next Session Presenter | 맥락 | progression | view data | UI |
| Dialogue | 짧은 장면 | scene/dialogue id | dialogue result | Effect |
| Save | 완료 Checkpoint | updated state | success/error | Flow |

## K. Godot 구조

```text
ScheduleOverlay [Control]
├─ Header [Control]
│  ├─ ScheduleLabel
│  └─ NextSessionPanel
├─ ActionCards [HBoxContainer]
│  ├─ ScheduleCardRest
│  ├─ ScheduleCardPrepare
│  └─ ScheduleCardSocialize
├─ DetailPanel [PanelContainer]
├─ ExistingTags [HBoxContainer]
└─ ActionBar [HBoxContainer]
```

- Card는 재사용 UI Scene.
- Controller는 View Data를 주입하고 선택 Result만 반환.
- 실제 효과 계산은 `ScheduleEffectResolver`.
- 기존 제품 구조 없음; 신규.

## L. Scene 분리 기준

- Field 위 CanvasLayer Overlay.
- 선택 후 짧은 Dialogue 또는 Field state animation.
- 별도 Schedule World Scene·미니게임은 금지.

## M. Signal·상태

```text
schedule_card_focused(action_id)
schedule_action_requested(action_id)
schedule_action_confirmed(action_id, token)
schedule_finished(schedule_result)
```

```text
ENTER → READY → SELECTED → CONFIRMING → RESOLVING → SHORT_SCENE → EXIT
```

- READY/SELECTED: 취소 가능.
- RESOLVING 이후: 입력 차단.
- 유지: next session id, tags, relation.

## N. 데이터

| 데이터 | 필드 | 위치 | 변경 | Save |
|---|---|---|---|---|
| ScheduleSlotDefinition | id, next session, actions | Resource | Content | 아니오 |
| ScheduleActionDefinition | id, label, effects, scene | Resource | Content | 아니오 |
| ScheduleState | current slot, completed, tags | Session | Resolver | 예 |
| ScheduleResult | action, effects, dialogue | runtime | Controller | 적용 후 |
| ScheduleViewData | labels, availability, reasons | DTO | Presenter | 아니오 |

## O. 유지 데이터

- 유지: Field background, BGM, next session, relationship, existing tags.
- 초기화: Card hover·selection after close.
- Save: selected action, tags, completed slot, one-shot scene.
- 세션 전용: selection token.
- Camera: Field Camera 고정.

## P. 연출

- Card hover·Focus는 색 외에 크기·Border.
- 선택 후 해당 장소의 짧은 state change 또는 Dialogue.
- 효용을 과장하는 수치 폭발 연출 금지.
- BGM은 장소 유지, 선택 장면에 짧은 layer 후보.

## Q. 애셋

| 애셋 | 용도 | 상태 | 우선 | 임시 |
|---|---|---|---|---|
| Schedule Card Frame | 3행동 | focus/disabled/selected | P0 | Panel |
| Rest Icon | CALM | normal | P1 | text glyph |
| Prepare Icon | PREPARED | normal | P1 | text glyph |
| Social Icon | CONNECTED | normal | P1 | text glyph |
| Short Scene props | 행동 결과 | 3종 최소 | P1 | Field layer |
| SFX | focus/confirm | 2종 | P2 | 무음 |

## R. 예외

- Card 표시 후 NPC unavailable: Commit 재검증.
- 더블 Confirm: selection token.
- Save 실패: 선택 적용을 rollback하거나 재저장 Modal.
- 필수 정보가 교류에만 존재: Content validation으로 금지.
- 휴식 효과 0: minimum benefit validation.
- 긴 Text overflow: Card summary+detail 분리.

## S. 완료 기준

- 세 행동 차이와 다음 일정 이해.
- 모든 선택이 동등 규모 효용.
- 필수 진행 영구 차단 없음.
- 선택 1회 적용·Save.
- 뒤로 가기·Confirm 경계 명확.

## T. 테스트

- [ ] A/B/C 각 Slot에서 세 행동.
- [ ] 선택 취소·재선택.
- [ ] Commit 연타 중복 효과 없음.
- [ ] Save/Load 완료 Slot 재진입 없음.
- [ ] unavailable socialize reason.
- [ ] 1280×720 Card text.

---

# [SIT-GR-005] Situation Challenge 관찰·준비

## A. 상황 개요

- 발생 이유: 수업 수로, 수정구 시험, 축제 장막, 현장 전투·누출 문제를 해결하기 전.
- 목표: 대상·제약·위험·보호 우선순위를 파악하고 Spell 설계 Context 생성.
- 알고 있는 정보: 배운 글자 의미와 현재 목표.
- 모르는 정보: 선택 조합의 실제 결과·숨은 저항.
- 위험: 정답을 UI가 미리 제공하거나 필수 제약이 숨겨짐.
- 보상: 공정한 의사결정과 복수 해법 인식.
- 감정: 관찰·추론·책임.
- 핵심 선택: 대상, 우선순위, Spell 진입 여부.
- 다음: Spell Composer 또는 Battle Active.

## B. 근거와 가정

- 확정: Situation Challenge 공통 계약, 유효 해법 2개 이상, 결과 비용·위험.
- 실제 구현: 없음.
- 해석: 모든 문제는 `Context View Data`를 통해 동일한 관찰 구조를 공유.
- 제안: `SituationIntroOverlay` + World target highlights.
- 가정: 핵심 제약 2~4개, 보호 대상 0~2개.
- 사용자 결정 필요: 수치 공개 수준·예상 경향 표현.

## C. 진입 조건

- 이전: Field Hotspot, Dialogue, Battle Intro.
- Trigger: Situation ID.
- Flags: required learning, prior observation, schedule tags.
- Player: learned glyphs, mana, summon readiness.
- World: target objects·risk sources.
- 진입 불가: required target missing, situation already completed and non-repeatable.
- 중복 방지: `active_situation_id` 단일.

## D. 화면 목적

1. 해결해야 하는 목표.
2. 대상·위험원·보호 대상.
3. 제한·비용·사용 가능한 글자.
4. 선택 후 예상 경향과 불확실성.

## E. 예상 화면

```text
┌──────────────────────────────────────────────────────────────┐
│ 상황: 부유 수정구 이송                  시전 가능 2회          │
│                                                              │
│ [출발] ---- 교차 기류 ---- [안전선]                          │
│                [취약한 수정구]                               │
│                                                              │
│ 제약: 충격 한계 / Mana / 교차 기류                           │
│ 관찰: 빠른 힘은 손상 위험, 넓은 흐름은 시간 소모             │
│ [대상 선택] [마법 설계] [다시 관찰]                          │
└──────────────────────────────────────────────────────────────┘
```

- World 위 Outline·Icon, 하단/측면 Context Panel.
- 첫 3초: 목표, 주 대상, 가장 큰 위험.

## F. 구성요소

| 요소 | 역할 | 표시 | 숨김 | 입력 | 우선 |
|---|---|---|---|---|---|
| Objective | 해결 조건 | 항상 | 완료 | 없음 | 1 |
| Target Highlight | 대상 | 관찰·선택 | invalid | Click | 1 |
| Risk Source | 위험 | observed·mandatory | hidden risk 후보 | 관찰 | 1 |
| Constraint Panel | 횟수·충격·Mana | 항상 | 없음 | 없음 | 1 |
| Protected Target | 보호 우선 | 존재 | 없음 | Select 후보 | 2 |
| Glyph Availability | 배운 글자 | 항상 | 없음 | Spell 진입 | 2 |
| Tendency Preview | 경향 | 조합 후보 후 | 조합 전 | 없음 | 2 |
| Spell Button | Composer | valid context | missing target | Click·key | 1 |
| Observe Again | 정보 재확인 | 항상 | 없음 | Click | 3 |

## G. 입력

| 입력 | 조건 | 반응 | 피드백 | 제한 |
|---|---|---|---|---|
| Click target | selectable | target set | outline·label | invalid 대상 reason |
| Tab/Arrow | target cycle | focus | focus ring | visible targets only |
| Spell key/Button | context valid | Composer request | dim transition | missing target 차단 |
| Esc | optional intro | Field/Battle return | panel close | mandatory first tutorial 후보 |
| Mouse hover | target | details | tooltip | essential info hover-only 금지 |

## H. 흐름

```text
Situation load [자동]
→ World target bind [자동]
→ Objective·constraint 표시 [자동]
→ 관찰 입력 [수동]
→ target·priority 선택 [수동]
→ Context validation [자동]
→ Spell Composer 요청 [수동]
→ Snapshot/Context freeze [자동]
```

- Save: Situation 시작 전 Checkpoint.
- 실패: missing target, invalid data, no learned glyph.
- 반복: 관찰·대상 변경 가능.

## I. 시스템 반응

| 행동 | 조건 | 즉시 | 데이터 | 장기 | 다음 |
|---|---|---|---|---|---|
| Target select | valid | highlight | context target | Spell result 영향 | PREPARATION |
| Wrong target | invalid | reason | 없음 | 학습 | PREPARATION |
| Spell request | context complete | input lock | SpellContext | 없음 | SPELL_COMPOSER |
| Spell request | missing target | blocked | 없음 | 없음 | PREPARATION |
| Schedule tag PREPARED | applicable | risk hint | observed risk | 다음 판단 | PREPARATION |
| Cancel | allowed | close | context clear/retain 정책 | 없음 | FIELD/BATTLE |

## J. 시스템

| 시스템 | 역할 | 입력 | 출력 | 연결 |
|---|---|---|---|---|
| Situation Controller | 전체 상태 | definition, world bind | context/result | Flow |
| Targeting | 대상 목록·선택 | target definitions | target id | Spell·Battle |
| Constraint Presenter | 조건 | situation state | view data | UI |
| Observation | 정보 해금 | hotspots/tags | observations | Grimoire·Result |
| Spell Context Builder | target·constraints | selection | SpellContext | Composer |
| Objective | 완료 규칙 | result state | complete/fail | Result |

## K. Godot 구조

```text
SituationLayer [Node]
├─ SituationController [Node]
├─ TargetRegistry [Node]
├─ ObjectiveTracker [Node]
└─ WorldMarkers [Node2D]

SituationIntroOverlay [Control]
├─ ObjectivePanel
├─ ConstraintPanel
├─ TargetDetailPanel
├─ GlyphAvailabilityStrip
└─ ActionBar
```

- World target는 `SituationTarget` interface/Group 후보.
- Overlay는 target ID만 전달.
- 재사용: 수업·시험·축제·현장 문제 공통.

## L. Scene 분리

- World 내부 Situation Controller + UIHost Overlay.
- 별도 World Scene은 문제 장소가 바뀔 때만.
- SubViewport 없음.

## M. Signal·상태

```text
target_focused(target_id)
target_selected(target_id)
observation_added(observation_id)
spell_context_requested(context)
situation_cancel_requested()
```

```text
ENTER → BINDING → INTRO → OBSERVING → TARGET_SELECTED → READY → EXIT_TO_SPELL
```

- OBSERVING: target 선택·Pause.
- READY: Spell 진입·target 변경.
- 유지: situation, observations, target, constraints.

## N. 데이터

| 데이터 | 필드 | 위치 | 변경 | Save |
|---|---|---|---|---|
| SituationDefinition | id, objective, targets, constraints, outcomes | Resource | Content | 아니오 |
| SituationTargetDefinition | id, role, conditions, world binding key | Resource | Content | 아니오 |
| ObservationDefinition | id, source, text, reveal conditions | Resource | Content | 아니오 |
| SituationRuntimeState | target, observations, attempts | Session | Controller | checkpoint 후보 |
| SpellContext | situation, target, constraints, resources, risk | runtime | Builder | Composer 동안 |

## O. 유지

- 유지: target world state, observation, attempts, resources, schedule tags.
- 초기화: hover, temporary preview.
- Save: situation start, observations 후보, attempts after result.
- 세션: SpellContext.
- BGM·Camera: active world 유지.

## P. 연출

- World 대상 highlight는 pulse+shape+label.
- 위험은 색 외에 hatch·icon·text.
- Objective 등장 후 바로 입력 가능.
- PREPARED hint는 정답이 아니라 위험 source 표시.
- 과도한 zoom·cinematic으로 정보 가림 금지.

## Q. 애셋

| 애셋 | 용도 | 상태 | 우선 | 임시 |
|---|---|---|---|---|
| Target Outline | 대상 | normal/selected/invalid | P0 | Line2D |
| Risk Pattern | 위험 | low/high | P0 | Polygon2D |
| Constraint Icons | Mana/횟수/충격 | 3종 | P0 | text |
| Objective Panel | 공통 | field/battle | P0 | default |
| Situation-specific props | 수정구·장막·관개관 | damage states | P0/P1 | shapes |

## R. 예외

- World object binding 실패: Situation 차단·debug ID.
- target가 제거됨: selection invalidate·rebind.
- 조건이 Composer 진입 직전 변경: Context 재검증.
- hidden info가 필수: Content audit 실패.
- 초광폭에서 marker off-screen: edge indicator.
- Pause 후 target outline 중복: state restore.

## S. 완료 기준

- 목표·대상·위험·제약이 첫 3초 내 인지.
- 2개 이상 유효 해법 가능성이 드러나되 정답 미제공.
- invalid target 이유.
- SpellContext와 UI 일치.
- Field·Battle 모두 재사용.

## T. 테스트

- [ ] 수업·시험·축제·현장 5 Situation.
- [ ] target 없음·invalid·removed.
- [ ] PREPARED hint.
- [ ] Spell 취소 후 context 복원.
- [ ] Save/Load observation·attempt.
- [ ] ultrawide edge marker.

---

# [SIT-GR-006] 직접 작성·인식·조합·Commit

## A. 상황 개요

- 발생 이유: 신규·미숙·중요 글자를 직접 작성하거나 직접 작성한 글자를 조합.
- 목표: Stroke 입력→인식 후보 확인→글자 의미 확정→메인·보조 조합→비용·경향 확인→명시적 시전.
- 알고 있는 정보: 배운 글자 의미, 상황 Context.
- 모르는 정보: 인식 후보와 실제 결과의 정확한 강도.
- 위험: 오인식, 자동 선택, 입력 실패와 설계 실패 혼합, 반복 피로.
- 보상: 내 손으로 주문을 만들었다는 통제감.
- 감정: 집중·긴장·성취.
- 핵심 선택: 후보, 조합, Commit/수정/취소.
- 다음: Spell Resolving→Result 또는 Battle 복귀.

## B. 근거와 가정

- 확정: Mouse drag, pen 보조, Right/Esc 취소, Ctrl+Z, R hold clear, Enter confirm.
- 확정: Commit 전 자원 미소모, 낮은 확신 자동 선택 금지.
- 실제 구현: 없음.
- 해석: 인식기는 UI와 별도 Interface.
- 제안: simulated recognition fixture로 Vertical Slice UI 먼저 검증 가능.
- 가정: Slice 글자 3개, 메인 1+보조 0~1.
- 사용자 결정 필요: 실제 인식 알고리즘, confidence 표시, time policy 수치.

## C. 진입 조건

- 이전: Situation Ready 또는 Battle Active.
- Trigger: valid SpellContext.
- Flags: learned glyph, tutorial stage.
- Player: mana, attempts, input settings.
- World: target·risk snapshot.
- 진입 불가: no target, no glyph, transition active.
- 중복 방지: Composer instance id와 Commit token 단일.

## D. 화면 목적

1. 현재 목표·대상·위험 유지.
2. 내가 그린 Stroke와 시스템 인식 결과.
3. 문법·비용·경향.
4. Commit 이후 실제 결과·원인.

## E. 예상 화면

```text
┌──────────────────────────────────────────────────────────────┐
│ 목표·대상·위험    Main: [흐름] Support: [집중/분산/없음]     │
├──────────────────────────────┬───────────────────────────────┤
│                              │ 인식 후보                     │
│       Stroke Canvas          │ 1. 흐름  높은 확신            │
│       직접 작성 영역          │ 2. 분산  낮은 확신            │
│                              │ 문제 Stroke: 2                │
├──────────────────────────────┴───────────────────────────────┤
│ Undo  현재 획 취소  전체 지우기 | 비용·경향 | [명시적 시전]   │
└──────────────────────────────────────────────────────────────┘
```

- Background는 Field/Battle dim, target silhouette 유지.
- 첫 3초: target, Stroke Canvas, current glyph slot.
- 입력 영역과 버튼 충돌 금지.

## F. 구성요소

| 요소 | 역할 | 표시 | 숨김 | 입력 | 우선 |
|---|---|---|---|---|---|
| Context Header | 목표·대상·위험 | 항상 | 없음 | 없음 | 1 |
| Stroke Canvas | 직접 입력 | DRAWING | token reuse 시 축약 | drag | 1 |
| Stroke Trail | 입력 피드백 | stroke 중·후 | clear | 없음 | 1 |
| Candidate List | 인식 결과 | recognition ready | before recognition | select | 1 |
| Problem Stroke | 복구 | ambiguous | confident | select/inspect | 1 |
| Glyph Slots | main/support | 항상 | 없음 | select | 1 |
| Grammar Status | 유효·충돌·누락 | glyph confirmed | 전 | 없음 | 1 |
| Cost/Risk | Commit 판단 | valid grammar | invalid | 없음 | 1 |
| Undo/Cancel/Clear | 복구 | drawing | resolving | input | 1 |
| Commit | 시전 | all valid | invalid/cost 부족 | click/Enter | 1 |
| Summon Status | 작성 안전 시간 | Battle context | Field context | 없음 | 2 |
| Error Banner | 오류 분류 | error | normal | 없음 | 1 |

## G. 입력

| 입력 | 조건 | 반응 | 피드백 | 제한 |
|---|---|---|---|---|
| LMB drag | canvas active | stroke append | trail | UI 밖 시작 무시 |
| Pen | device | pressure 후보 | trail | pressure 사용 미확정 |
| RMB/Esc | stroke active | current stroke cancel/previous step | erase feedback | Commit 후 불가 |
| Ctrl+Z | stroke exists | last stroke undo | removed stroke highlight | 자원 미소모 |
| R hold | any stroke | confirm clear | hold ring | accidental tap 차단 |
| Candidate click | candidates ready | glyph confirm | selected outline | 낮은 확신도 명시 |
| Wheel/Arrow/Tab | candidate list | focus move | focus ring | canvas drawing 중 금지 |
| Enter | valid focus/commit | confirm | press | 중복 Commit token |
| Mobile Touch | 후행 | stroke | touch trail | PC P0 제외 |

## H. 흐름

| 단계 | 자동/입력 | 취소 | 저장 | 실패 | 반복 |
|---|---|---|---|---|---|
| Context bind | 자동 | 가능 | 없음 | 가능 | 진입마다 |
| Draw | 입력 | 가능 | 없음 | 입력 실패 | 반복 |
| Recognition request | 자동 | 취소 후보 | 없음 | ambiguous | 반복 |
| Candidate confirm | 입력 | 가능 | 없음 | 오선택 | 반복 |
| Glyph slot set | 입력/자동 | 가능 | 없음 | grammar fail | 반복 |
| Grammar validate | 자동 | 가능 | 없음 | 가능 | 변경마다 |
| Cost/tendency preview | 자동 | 가능 | 없음 | cost insufficient | 변경마다 |
| Commit | 입력 | 불가 이후 | 없음 | race condition | 1회 |
| Domain resolve | 자동 | 불가 | 안전 Save 금지 | resistance | 1회 |
| Result return | 자동 | 결과 정책 | 이후 | possible | 1회 |

## I. 시스템 반응

| 행동 | 조건 | 즉시 | 데이터 | 장기 | 다음 |
|---|---|---|---|---|---|
| Stroke 완료 | valid points | trail freeze | StrokeData | 학습 fixture 후보 | RECOGNIZING |
| 인식 ambiguous | confidence low | candidates+problem stroke | attempts++ 후보 | 피로·튜토리얼 | DRAWING |
| Candidate confirm | selected | slot update | glyph id | composition | COMPOSING |
| Grammar invalid | bad relation | conflict highlight | 없음 | 학습 | COMPOSING |
| Cost insufficient | valid spell | Commit disabled | 없음 | 준비 필요 | COMPOSING |
| Cancel | Commit 전 | overlay close | resources unchanged | 없음 | previous state |
| Commit | valid·affordable | input lock | cost pending token | result | RESOLVING |
| Domain success | resolver | effect event | cost/result | world change | RESULT/BATTLE |
| Input failure | no valid candidate | recovery UI | resources unchanged | error log | DRAWING |

## J. 시스템

| 시스템 | 역할 | 입력 | 출력 | 연결 |
|---|---|---|---|---|
| Stroke Capture | points·strokes | pointer events | StrokeData | Recognition |
| Recognition Interface | 후보 | StrokeData/model | candidates | UI |
| Candidate Controller | 사용자 확정 | candidates | glyph id | Grammar |
| Spell Grammar | main/support 유효성 | glyph ids | grammar result | Preview |
| Cost Calculator | 자원 | spell+context | cost result | UI·Commit |
| Tendency Evaluator | 예상 경향 | spell+context | tendency | UI |
| Spell Resolver | 실제 결과 | intent+context | SpellResult | Battle/World |
| Composer Presenter | View Data | all results | UI state | Input |
| Time Controller | world slow | composer state | time policy | Battle/Field |

## K. Godot 구조

```text
SpellComposerOverlay [Control]
├─ ContextHeader [Control]
├─ CompositionPanel [Control]
│  ├─ MainGlyphSlot [Control]
│  └─ SupportGlyphSlot [Control]
├─ StrokePanel [Control]
│  ├─ StrokeInputControl [Control]
│  ├─ StrokeRender [Node2D 또는 Control draw]
│  └─ ClearHoldIndicator [Control]
├─ CandidatePanel [Control]
│  ├─ CandidateList [VBoxContainer]
│  └─ ProblemStrokePanel [Control]
├─ ValidationPanel [Control]
│  ├─ GrammarStatus
│  ├─ CostPreview
│  └─ TendencyPreview
├─ SupportStatusPanel [Control]
└─ ActionBar [Control]
```

도메인 Node 후보:

```text
SpellCompositionController [Node]
├─ StrokeSession [RefCounted owner]
├─ RecognitionAdapter [RefCounted/Node]
├─ GrammarService [RefCounted]
├─ CostService [RefCounted]
└─ SpellResolverInterface [RefCounted]
```

- UI Scene은 계산하지 않음.
- Recognition 구현은 Adapter로 교체.
- simulated fixture는 `RecognitionAdapter` 구현 중 하나.

## L. Scene 분리

- CanvasLayer Overlay 추천.
- Field/Battle World 유지.
- 완전 별도 Scene은 target·risk 가시성을 잃으므로 배제.
- SubViewport는 Stroke 확대가 별도 render 요구를 만들 때만 기술 검토; 기본 불필요.

## M. Signal·상태

Signals:

```text
stroke_started()
stroke_completed(stroke_data)
recognition_requested(stroke_data)
recognition_candidates_ready(candidates)
glyph_candidate_selected(glyph_id)
composition_changed(composition)
spell_commit_requested(intent, token)
spell_commit_cancelled()
spell_resolved(result)
```

```text
ENTER → DRAWING → RECOGNIZING → CANDIDATE_CONFIRM → COMPOSING
→ VALIDATING → READY_TO_COMMIT → RESOLVING → EXIT
```

- DRAWING~READY: 취소 가능·자원 미소모.
- RESOLVING: 입력 금지·Save 금지.
- 유지: SpellContext, strokes, selected glyphs, preview.

## N. 데이터

| 데이터 | 필드 | 위치 | 변경 | Save |
|---|---|---|---|---|
| GlyphDefinition | id, meaning, icon, model ref, learned | Resource | Content | learned state만 |
| StrokeData | points, stroke index, device, bounds | runtime | Capture | 기본 미저장 |
| RecognitionCandidate | glyph, confidence, issues | runtime | Adapter | 미저장·telemetry 후보 |
| SpellComposition | main, support | runtime | Controller | Result 기록 |
| GrammarResult | valid, conflicts, missing | runtime | Grammar | 미저장 |
| CostResult | mana, attempts, allowed | runtime | Cost | Commit 후 PlayerState |
| TendencyResult | precision, stability, risk, uncertainty | runtime | Evaluator | Result record 후보 |
| SpellIntent | context, target, composition, intent tag | runtime | Controller | resolving 동안 |
| SpellResult | outcome, costs, cause, changes | runtime | Resolver | Result→Save |
| InputSettings | tolerance, smoothing, contrast | Settings | Settings | 예 |

## O. 유지

- 반드시: Context, target, risk, Player resources, summon support state.
- 초기화: strokes on exit unless retry policy.
- Save: Commit Result 후 composition·cause in Grimoire; raw stroke는 기본 미저장.
- 세션: candidate confidence, undo stack.
- BGM: writing focus layer, base playback continuity.

## P. 연출

- Overlay dim은 target silhouette 유지.
- Stroke trail은 높은 대비·굵기 설정.
- Recognition 중 spinner가 stroke를 가리지 않음.
- Candidate 선택 시 원본 stroke와 비교.
- Grammar error는 문제 slot·문구·icon.
- Commit은 짧은 lock feedback 후 World effect; Animation이 결과 권위 아님.
- Flash·shake·particle 감소 옵션.

## Q. 애셋

| 애셋 | 용도 | 상태 | 우선 | 임시 |
|---|---|---|---|---|
| Stroke Brush | 획 | normal/error/confirmed | P0 | Line2D |
| Glyph Icons | 흐름/집중/분산 | learned/locked | P0 | text glyph |
| Candidate Card | 후보 | focused/low confidence | P0 | Panel |
| Grammar Icons | valid/conflict/missing | 3종 | P0 | text |
| Risk Icons | overpressure/slow/stable | 의미 | P0 | shapes |
| Spell Commit FX | 시전 전환 | field/battle | P1 | simple line |
| SFX | draw/undo/confirm/error | 4종 | P1 | 무음 |

## R. 예외

- pointer가 canvas 밖으로 나감: stroke 종료 또는 clip 정책 명시.
- 동일 stroke event 중복: event id.
- Recognition 응답 늦음: request id로 stale 결과 폐기.
- Candidate 선택 후 새 인식 응답: composition version check.
- Commit 연타: token.
- Mana가 Preview 후 변경: Commit 시 재검증.
- Battle target 제거: Commit 차단·Context invalidate.
- Pause/Focus loss: current stroke 취소·안전 안내.
- App 종료: Commit 전 마지막 checkpoint 복귀.
- raw input privacy·용량: 기본 Save 금지.

## S. 완료 기준

- 입력·인식·문법·비용·상황 실패 분리.
- Undo·취소·재작성 자원 미소모.
- 낮은 확신 후보 자동 선택 없음.
- target·risk·summon 상태가 작성 중 보임.
- Mouse와 Pen에서 Stroke 누락·중복 없음.
- 7회 작성 목표에서 피로 측정 가능.
- Composer 취소 후 World state 무변경.

## T. 테스트

### 정상
- [ ] 흐름, 흐름+집중, 흐름+분산.
- [ ] Mouse·Pen 입력.
- [ ] candidate select→valid grammar→Commit.

### 실패
- [ ] ambiguous/no candidate.
- [ ] wrong candidate correction.
- [ ] grammar conflict·missing main.
- [ ] mana·attempt 부족.
- [ ] target invalidation.

### 반복·Save
- [ ] Undo 20회·clear·redraw.
- [ ] Commit 더블 입력 1회.
- [ ] Result 후 Grimoire composition 일치.
- [ ] Commit 중 강제 종료는 이전 checkpoint.

### 화면·입력
- [ ] UI scale·ultrawide.
- [ ] canvas와 Button pointer conflict 없음.
- [ ] reduced motion·high contrast.

---

# [SIT-GR-007] 전술 전투·수호 소환

## A. 상황 개요

- 발생 이유: 현장 생태 온실 관개 압력으로 폭주한 정령을 진정.
- 목표: 적을 파괴하지 않고 압력 근원을 끊고 보호 대상을 지킴.
- 알고 있는 정보: 압력원, 정령 상태, 집중·분산 경향.
- 모르는 정보: 정확한 반격 timing·저항.
- 위험: 피격, 대상 손상, 작성 시간 부족.
- 보상: 새로운 활용, 세계 상태 변화, 책임 있는 해결.
- 감정: 긴장, 수호자와의 협력, 설계 성공.
- 핵심 선택: 이동·대상·수호 호출·Spell timing.
- 다음: Battle Result→Field Return.

## B. 근거와 가정

- 확정: 별도 고정 3/4 전술장, 수호형 보조 소환수 1체 우선, 적 1종.
- 실제 구현: 없음.
- 해석: 전투는 주문 설계를 위한 압박 Context이며 소환수 자동 해결 금지.
- 제안: 작은 Arena, telegraph, objective-driven nonlethal result.
- 가정: Player 이동은 제한된 자유 이동, 적 행동은 telegraph 기반 실시간 후보.
- 사용자 결정 필요: Pause/slow/realtime, 이동 범위, summon cost/cooldown.

## C. 진입 조건

- 이전: Field danger trigger→Battle Preparation.
- Trigger: EncounterDefinition.
- Flags: field observation, guardian not defeated, summon available.
- Player: hp, mana, glyphs, schedule tags.
- World: FieldReturnSnapshot.
- 진입 불가: encounter completed non-repeatable, required arena/object missing.
- 중복 방지: active encounter token.

## D. 화면 목적

1. 비살상 목표와 압력원.
2. Player·Enemy·보호 대상 위치.
3. 위험 telegraph와 수호 가능 상태.
4. Spell 결과와 objective progress.

## E. 예상 화면

```text
┌──────────────────────────────────────────────────────────────┐
│ 목표: 폭주 정령 진정  압력원 2/3   보호 대상 80%             │
├──────────────┬───────────────────────────────────────────────┤
│ HP / Mana    │ [보호 묘목]     [폭주 정령]                   │
│ 수호 Ready   │      [수호 범위] [위험 Telegraph]             │
│ 현재 위험    │ [주인공]            [관개 압력원]              │
├──────────────┴───────────────────────────────────────────────┤
│ Target 변경   수호 호출   마법 설계   Pause                  │
└──────────────────────────────────────────────────────────────┘
```

- Camera: 고정 3/4.
- 첫 3초: 목표, Enemy, 압력원, 보호 대상.
- UI: 최소 HUD, World telegraph 우선.

## F. 구성요소

| 요소 | 역할 | 표시 | 숨김 | 입력 | 우선 |
|---|---|---|---|---|---|
| Objective Header | 비살상 목표 | 항상 | Result | 없음 | 1 |
| Player SD | 이동·피격 | 항상 | defeat | 이동 | 1 |
| Enemy SD | 위험·반응 | 항상 | resolved | target | 1 |
| Pressure Source | 핵심 target | active | disabled | select | 1 |
| Protected Target | 손상 상태 | 존재 | 없음 | 없음 | 1 |
| Telegraph | 공격 예고 | enemy action | resolved | 회피 판단 | 1 |
| Guard Summon | 작성 시간 확보 | summoned | inactive | call | 1 |
| HP/Mana | 자원 | 항상 | Overlay에 축약 | 없음 | 1 |
| Spell Action | Composer | valid | lock | input | 1 |
| Pause | 중단 | active | transition | Esc | 3 |

## G. 입력

| 입력 | 조건 | 반응 | 피드백 | 제한 |
|---|---|---|---|---|
| WASD | ACTIVE | Player move | animation | arena bounds |
| Mouse target/Tab | targets | select | outline | invalid reason |
| Summon key/Button | ready | call request | range preview | cost/cooldown |
| Spell key/Button | context valid | Composer | time policy | danger lock 정책 |
| Dodge/quick action | 승인 여부 미정 | 후보 | telegraph | USER_DECISION_REQUIRED |
| Esc | active | Pause | overlay | resolving 중 제한 |

## H. 흐름

```text
Battle Scene load [자동]
→ Objective·actors bind [자동]
→ Intro·목표 재안내 [자동]
→ Battle active [입력]
→ Enemy telegraph [자동]
→ 이동·수호 호출 [입력]
→ Spell Context 선택 [입력]
→ Composer [입력]
→ Resolve·World effect [자동]
→ Objective update [자동]
→ 반복 또는 Battle finish [혼합]
```

- Save: Battle 전과 완료 후; 전투 중 세부 Save는 초기 Slice 제외 후보.
- 실패: Player defeat, protected target loss, timeout 후보.

## I. 시스템 반응

| 행동 | 조건 | 즉시 | 데이터 | 장기 | 다음 |
|---|---|---|---|---|---|
| Move | active | position | Player state | danger avoidance | BATTLE |
| Guard call | ready | summon spawn | cooldown/duration | writing safety | BATTLE |
| Guard call unavailable | cooldown/cost | blocked reason | 없음 | 없음 | BATTLE |
| Spell focus | context valid | slow/dim | SpellContext | 없음 | COMPOSER |
| Focus spell result | hit source | source progress | mana/cost | fast·risk tag | BATTLE/RESULT |
| Spread result | valid area | enemy intensity down | progress/time | safe·slow tag | BATTLE |
| Enemy attack | telegraph expired | domain hit | hp/object state | result cause | BATTLE |
| Objective complete | thresholds | input lock | BattleResult | world change | RESULT |
| Defeat | fail condition | input lock | BattleResult fail | retry/return | RESULT |

## J. 시스템

| 시스템 | 역할 | 입력 | 출력 | 연결 |
|---|---|---|---|---|
| Battle Director | 조우 조정 | encounter·state | events/result | Flow |
| Battle State Machine | phase·input | events | state | all battle |
| Battle Clock | simulation policy | slow/pause | scaled time | AI·telegraph |
| Unit Controller | move·hp | input/events | state | HUD·Result |
| Enemy AI | telegraph·action | battle state | attack event | Clock·Target |
| Objective Tracker | nonlethal progress | spell/attack | complete/fail | Result |
| Summon Controller | call·duration | summon def | support state | Battle·Composer |
| Targeting | target selection | world targets | target id | Spell |
| Damage/Effect Domain | authoritative changes | action result | state events | HUD·Result |

## K. Godot 구조

```text
BattleScene [Node2D]
├─ BattleDirector [Node]
├─ BattleStateMachine [Node]
├─ BattleClock [Node]
├─ Arena [Node2D]
│  ├─ Background [Sprite2D]
│  ├─ Obstacles [StaticBody2D]
│  └─ Bounds [CollisionPolygon2D]
├─ UnitLayer [Node2D, y_sort_enabled]
│  ├─ PlayerBattleActor [CharacterBody2D]
│  ├─ EnemyActor [CharacterBody2D]
│  └─ GuardSummonHost [Node2D]
├─ ObjectiveLayer [Node2D]
│  ├─ PressureSources [Area2D]
│  └─ ProtectedTargets [Area2D]
├─ TelegraphLayer [Node2D]
├─ EffectLayer [Node2D]
├─ BattleCamera [Camera2D]
└─ BattleHUD [CanvasLayer]
```

- BattleDirector가 하위 Node를 초기화하고 Signal 연결.
- Actor는 Scene으로 분리·재사용.
- Field actor와 SpriteFrames·Animation name 공유 후보, Controller 별도.

## L. Scene 분리

- 완전 별도 World Scene 추천.
- UI는 Persistent UIHost 또는 BattleHUD 재사용.
- Spell Composer는 ApplicationRoot Overlay.
- Field 위 Layer 전투는 승인 구조와 결합 위험으로 배제.

## M. Signal·상태

Signals:

```text
battle_ready(encounter_id)
target_changed(target_id)
enemy_telegraph_started(action_id, area)
summon_requested(summon_id)
summon_activated(state)
spell_focus_requested(context)
unit_state_changed(unit_state)
objective_progressed(objective_state)
battle_finished(result)
```

```text
ENTER → INTRO → ACTIVE → TELEGRAPH → ACTION_RESOLVE
→ SPELL_FOCUS → ACTIVE → VICTORY_PENDING/DEFEAT_PENDING → EXIT
```

- ACTIVE/TELEGRAPH: 이동·대상·수호·Spell.
- ACTION_RESOLVE: 입력 정책별 제한.
- VICTORY/DEFEAT: 입력 잠금.

## N. 데이터

| 데이터 | 필드 | 위치 | 변경 | Save |
|---|---|---|---|---|
| EncounterDefinition | arena, units, objectives, rules | Resource | Content | 아니오 |
| EnemyDefinition | stats, actions, telegraphs, reactions | Resource | Content | 아니오 |
| SummonDefinition | role, duration, area, cost, cooldown | Resource | Content | 아니오 |
| ObjectiveDefinition | targets, complete/fail thresholds | Resource | Content | 아니오 |
| BattleRuntimeState | unit/objective/clock | runtime | Director | Battle 전용 |
| BattleResult | outcome, cause, changes, costs | runtime | Director | Result→Save |
| FieldReturnSnapshot | location, marker, object states | Session | Flow | checkpoint |

## O. 유지

- 반드시: FieldReturnSnapshot, Player resources, schedule tags, Companion context.
- 초기화: Enemy transient AI, telegraph animations, summon instance.
- Save: Battle 완료 Result와 world changes; 전투 중 Save 초기 제외.
- 세션: BattleRuntimeState.
- BGM: field→battle crossfade, return key 유지.

## P. 연출

- Field target와 동일한 color·shape·object id.
- Intro 1~2초, 목표 Text 병행.
- Telegraph는 shape+direction+timer/text.
- Guard summon은 Player Spell보다 시각 점유율 작게.
- Spell result FX 후 Objective bar update.
- Victory는 적 파괴 폭발이 아니라 진정·압력 안정 연출.
- Animation과 domain result timestamp 분리.

## Q. 애셋

| 애셋 | 용도 | 상태 | 우선 | 임시 |
|---|---|---|---|---|
| Battle Arena | 온실·수로 | normal/damaged/stabilized | P0 | blockout |
| Player Battle SD | idle/move/spell/hit | field skeleton reuse | P0 | capsule |
| Enemy Spirit | idle/move/attack/hit/calm | 1종 | P0 | shape |
| Guard Summon | appear/guard/expire | 1체 | P0 | shield shape |
| Pressure Source | active/disabled | 2~3개 | P0 | icon |
| Telegraph | area/direction | actions | P0 | Polygon2D |
| Hit/Spell FX | focus/spread | minimal | P1 | Line/Particles |
| BGM/SFX | battle/write/guard/result | states | P1 | placeholder |

## R. 예외

- Summon 중복 생성: host checks active instance/token.
- target 제거 중 Composer: context invalidate.
- Scene exit 전에 BattleResult 미확정: Transition 차단.
- Enemy AI action과 Pause: BattleClock policy.
- Animation hit와 domain hit 불일치: domain event authority.
- protected target 0 이하와 objective complete 동시: deterministic priority.
- resize·focus loss: movement clear, current stroke cancel policy.
- Battle reload: 전투 전 Checkpoint로 복귀.

## S. 완료 기준

- 비살상 목표와 압력원 이해.
- Telegraph·target·summon·resource 판독.
- Guard가 작성 시간만 제공하고 자동 해결하지 않음.
- Focus/Spread가 서로 다른 유효 해법.
- Battle→Composer→Battle state 무손실.
- Result→Field Return 준비 완료.

## T. 테스트

### 정상
- [ ] 집중 빠른 해결·위험.
- [ ] 분산 안전·느림.
- [ ] Guard active 동안 Composer.
- [ ] Objective complete→Result.

### 실패
- [ ] Mana 부족.
- [ ] Guard cooldown.
- [ ] Player defeat.
- [ ] Protected target loss.
- [ ] target invalidation.

### 반복·Save
- [ ] Retry에서 Reward 중복 없음.
- [ ] Summon 중복 없음.
- [ ] Battle 전 Checkpoint 복구.

### 화면·입력
- [ ] 16:9·ultrawide.
- [ ] telegraph 색 외 표현.
- [ ] Pause·Focus loss input clear.
