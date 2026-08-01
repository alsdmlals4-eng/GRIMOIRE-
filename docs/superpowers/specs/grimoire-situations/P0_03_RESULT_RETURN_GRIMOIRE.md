# GRIMOIRE P0 상황 상세 03 — 결과·필드 복귀·마도서 기록

## 문서 상태

```yaml
parent: GM-SITUATION-SCREEN-SPEC-01
status: USER_REVIEW_REQUIRED
situations:
  - SIT-GR-008 결과·원인·보상 복기
  - SIT-GR-009 원래 필드 복귀·환경 변화
  - SIT-GR-010 귀환·마도서 기록·Checkpoint
implementation: NOT_STARTED
```

---

# [SIT-GR-008] 결과·원인·보상 복기

## A. 상황 개요

- 발생 이유: Spell 또는 Battle Domain이 결과를 확정함.
- 현재 목표: 결과, 원인, 비용, 포기한 것, 다음 행동을 이해하고 수용·재시도·기록 선택.
- 알고 있는 정보: 작성한 글자·대상·의도.
- 모르는 정보: 실제 저항·부작용·새 발견.
- 위험: 성공·실패 이유 혼합, 애니메이션과 데이터 불일치, 보상 중복.
- 기대 보상: 설명 가능한 결과, 새로운 활용·태그, 다음 학습 목표.
- 감정: 성취·아쉬움·책임.
- 핵심 선택: 결과 수용, 허용된 재시도, 기록.
- 다음: Battle 계속, Field Return, Grimoire Record.

## B. 근거와 가정

- 확정: 성공·부분 성공·입력 실패·설계 실패 구분.
- 확정: 마도서에 상황·의도·결과·부작용·발견 기록.
- 실제 구현: 없음.
- 해석: Result UI는 `SituationResult`를 표시하고 계산하지 않음.
- 제안: 인과 Chain `입력→인식→문법→비용→상황→결과`.
- 가정: Outcome 종류 `SUCCESS / PARTIAL / FAILED_INPUT / FAILED_GRAMMAR / BLOCKED_COST / LIMITED_EFFECT / DEFEAT`.
- 사용자 결정 필요: 재시도 허용 범위·평가 언어·보상 수치.

## C. 진입 조건

- 이전: SPELL_RESOLVING, BATTLE_VICTORY_PENDING, BATTLE_DEFEAT_PENDING.
- Trigger: authoritative `SituationResult`.
- Flags: attempt count, retry rule, session goal.
- Player: costs applied or not applied according to result stage.
- World: pending world changes.
- 진입 불가: result id 없음, result validation 실패.
- 중복 방지: `result_token`과 `reward_application_id` 유일.

## D. 화면 목적

1. 결과 종류와 목표 달성 여부.
2. 왜 그런 결과가 발생했는가.
3. 소비·손상·보호·포기한 것.
4. 기록·재시도·복귀 선택.

## E. 예상 인게임 화면

```text
┌──────────────────────────────────────────────────────────────┐
│ 결과: 부분 성공                   세계 변화: 묘목 보호        │
├──────────────────────────────┬───────────────────────────────┤
│ 입력      흐름 인식 성공      │ 보호        희귀 묘목          │
│ 문법      흐름+집중 유효       │ 포기        관개관 내구도       │
│ 비용      Mana -2             │ 부작용      과압                │
│ 상황      우회관 연결 성공      │ 발견        정밀 우회           │
├──────────────────────────────┴───────────────────────────────┤
│ [기록]            [재시도]            [결과 수용]              │
└──────────────────────────────────────────────────────────────┘
```

- 배경: 결과가 발생한 World를 dim 상태로 유지.
- 최초 3초: Outcome, 목표 달성, 가장 큰 비용·부작용.
- 결과 피드백: World Preview와 Text가 일치.

## F. 화면 구성요소

| 요소 | 역할 | 표시 조건 | 숨김 | 입력 | 우선 |
|---|---|---|---|---|---|
| Outcome Header | 성공·부분·실패 | 항상 | 없음 | 없음 | 1 |
| Objective Status | 목표 달성 | 항상 | 없음 | 없음 | 1 |
| Causal Chain | 원인 설명 | 항상 | 축약 가능 | row expand | 1 |
| Cost Panel | 자원·피해 | 비용 있음 | 없음 | 없음 | 1 |
| Tradeoff Panel | 보호·포기 | 상황 결과 | 해당 없음 | 없음 | 1 |
| World Preview | 환경 변화 | change 있음 | 없음 | preview | 2 |
| Discovery | 새 활용 | 발견 있음 | 없음 | 없음 | 2 |
| Reward | 관계·태그·해금 | 지급 대상 | 없음 | 없음 | 2 |
| Retry | 재시도 | rule 허용 | 금지 | Click | 1 |
| Record | 마도서 | 기록 가능 | 입력 실패 등 정책 | Click | 1 |
| Accept | 다음 진행 | result valid | resolving | Click | 1 |
| Error Recovery | invalid result | 오류 | 정상 | retry/load | 0 |

## G. 플레이어 입력

| 입력 | 조건 | 시스템 반응 | 시각 피드백 | 실패·제한 |
|---|---|---|---|---|
| Click/Enter Accept | valid result | confirm request | button lock | 1회 token |
| Retry | retry allowed | restore policy | warning·preview | cost rollback rule 필요 |
| Record | recordable | draft entry | new badge | 자동 시전 없음 |
| Expand cause | chain row | detail | arrow | 정보만 |
| Esc | optional result | 없음 또는 Pause | reason | 결과 미확정 종료 금지 |
| Tab/Arrow | active | focus move | focus ring | disabled skip |

## H. 상황 진행 흐름

| 단계 | 자동/입력 | 취소 | 저장 | 실패 | 반복 |
|---|---|---|---|---|---|
| Result validate | 자동 | 불가 | 금지 | 가능 | 1회 |
| Result UI bind | 자동 | 불가 | 금지 | 가능 | 1회 |
| Outcome 확인 | 입력 | 불가 | 금지 | 없음 | 반복 열람 |
| Retry/Record/Accept | 입력 | 선택 전 | 없음 | 조건 차단 | 정책별 |
| Reward apply | 자동 | 불가 | 중간 저장 금지 | 가능 | idempotent |
| World change stage | 자동 | 불가 | pending | 가능 | 1회 |
| Next state | 자동 | 불가 | 안전 지점 후 | 가능 | 1회 |

## I. 시스템 반응

| 행동 | 조건 | 즉시 반응 | 데이터 변화 | 장기 영향 | 다음 상태 |
|---|---|---|---|---|---|
| Accept | success/partial | 입력 잠금 | reward+tags pending | 진행·world | FIELD_RETURN |
| Retry | retry allowed | confirmation | attempt state restore | 학습·시간 | SPELL/BATTLE |
| Retry | not allowed | blocked reason | 없음 | 결과 수용 | RESULT |
| Record | recordable | draft create | Grimoire draft | 기억·발견 | RESULT/RECORD |
| Input failure | Commit 전 | recovery emphasis | resource unchanged | 학습 | SPELL_COMPOSER |
| Cost blocked | insufficient | no execution | 없음 | 준비 필요 | SPELL_COMPOSER |
| Limited effect | resistance | partial result | costs applied | world partial | RESULT |
| Duplicate Accept | token consumed | ignore | 없음 | 중복 지급 방지 | TRANSITION |

## J. 필요한 시스템

| 시스템 | 이 상황 역할 | 입력 | 출력 | 연결 |
|---|---|---|---|---|
| Result Validator | 결과 무결성 | SituationResult | valid/errors | Flow·UI |
| Result Presenter | View Data | result | ResultViewData | UI |
| Reward Resolver | 태그·관계·해금 | result | RewardApplication | Session·Save |
| Retry Policy | 복구 범위 | result/context | retry allowed/state | Spell·Battle |
| Grimoire Draft | 기록 초안 | result | draft entry | Grimoire |
| World Change Stager | 변경 예약 | result tags | staged changes | Field Return |
| Idempotency Guard | 중복 차단 | token | accepted/rejected | all |

## K. Godot 구현 구조

```text
ResultOverlay [Control]
├─ OutcomeHeader [Control]
├─ ObjectiveStatus [Control]
├─ CausalChainPanel [VBoxContainer]
├─ TradeoffPanel [Control]
├─ CostPanel [Control]
├─ WorldChangePreview [Control]
├─ RewardPanel [Control]
├─ DiscoveryPanel [Control]
├─ ActionBar [HBoxContainer]
└─ ResultController [Node]
```

도메인:

```text
ResultApplicationCoordinator [Node]
├─ ResultValidator [RefCounted]
├─ RewardResolver [RefCounted]
├─ RetryPolicy [RefCounted]
├─ WorldChangeStager [RefCounted]
└─ GrimoireDraftFactory [RefCounted]
```

- UI는 `ResultViewData`만 보유.
- Reward와 World Apply는 UI Animation이 아니라 Coordinator가 수행.
- Scene 재사용: 시험·축제·전투·환경 문제.

## L. Scene 분리 기준

- CanvasLayer Overlay 추천.
- World Scene 유지해 결과 Preview 연결.
- 결과를 완전히 별도 Scene으로 전환하면 장소 인과가 약해지므로 배제.
- SubViewport 불필요; Preview는 World target highlight 또는 Texture 후보.

## M. Signal 및 상태 전환

Signals:

```text
result_bound(result_id)
retry_requested(result_id)
record_requested(result_id)
result_accept_requested(result_id, token)
reward_applied(application_id)
world_change_staged(change_set_id)
result_finished(next_state)
```

States:

```text
ENTER → VALIDATING → PRESENTING → DECISION
→ APPLYING_REWARD → STAGING_WORLD_CHANGE → EXIT
```

- PRESENTING/DECISION: 정보 열람·허용 Action.
- APPLYING 이후: 입력·Save 금지.
- 유지: result, cause chain, retry snapshot, pending world changes.

## N. 데이터 구조

| 데이터 | 주요 필드 | 저장 위치 | 변경 주체 | 저장 필요 |
|---|---|---|---|---|
| SituationResult | id, outcome, cause, costs, changes, discoveries | runtime | Domain Resolver | 적용 후 기록 |
| CauseStep | phase, status, label, detail | nested | Resolver | Grimoire 일부 |
| RewardApplication | id, flags, relation, unlocks, resource deltas | runtime | Reward Resolver | 예 |
| RetrySnapshot | resources, target, attempt, battle state policy | session | Retry Policy | 세션 전용 |
| WorldChangeSet | object id, state change, layer tags | runtime | Stager | Field 적용 후 예 |
| GrimoireDraft | context, intent, composition, outcome, side effect | session | Factory | 확정 후 예 |
| ResultViewData | localized labels, icons, action availability | runtime DTO | Presenter | 아니오 |

## O. 화면 전환 시 유지 데이터

- 반드시 유지: SituationResult, Player resource final state, Retry policy state, FieldReturnSnapshot.
- 초기화: Button focus, panel expand, temporary preview animation.
- Save 기록: Reward·World apply 완료 후.
- 세션 중: raw RetrySnapshot, pending change set.
- Camera: World Camera 유지.
- BGM: Result layer를 잠깐 적용하고 Field/Battle base 유지.

## P. 연출 명세

- Outcome은 Text·Icon·shape로 표시.
- 인과 Chain은 위에서 아래 순서 고정.
- World Preview는 실제 change target와 동일 id·색·형태.
- 실패 시 붉은 Flash·강한 흔들림보다 원인·복구 우선.
- Reward animation은 지급 완료 후 표시하거나 지급 상태와 동기.
- 부분 성공은 실패처럼 보이지 않고 tradeoff를 명확히 보여 줌.

## Q. 필요한 애셋

| 애셋 | 용도 | 상태·변형 | 우선 | 임시 대체 |
|---|---|---|---|---|
| Outcome Icon | success/partial/fail/blocked | 4~6종 | P0 | text+shape |
| Cause Step Icon | input/grammar/cost/context/result | 5종 | P0 | initials |
| Tradeoff Icon | protected/lost/side effect | 3종 | P0 | text |
| Reward Badge | discovery/relation/tag | 최소 | P1 | label |
| Result Panel Theme | 전체 | semantic states | P0 | default Theme |
| SFX | outcome/reward/error | 최소 3종 | P1 | 무음 |

크기: UI Icon은 base resolution 확정 전 `1em~1.5em` font-relative size 후보. 정확 px는 Asset Spec.

## R. 예외 상황

- Result id 중복: application ledger에서 1회만 처리.
- Reward 지급 중 App 종료: transaction journal 또는 이전 checkpoint+재적용 id.
- Retry 후 비용 rollback 오류: RetryPolicy가 authoritative snapshot 사용.
- UI와 Domain result 불일치: ViewData 생성 시 validation fail.
- World target 삭제: Field Return에서 fallback state·warning.
- Result Action 연타: token consumed.
- Save 시점 오류: 적용 중 Save 금지.
- Localization 누락: error key fallback, 진행 차단은 critical field만.

## S. 완료 기준

- Outcome·원인·비용·tradeoff를 도움 없이 설명 가능.
- 입력 실패와 실행 후 제한 결과 구분.
- 재시도 허용·비허용 이유 명확.
- Reward와 world change 1회 적용.
- Result UI와 SessionState 일치.
- 결과 수용 후 올바른 다음 상태.

## T. 테스트 체크리스트

### 정상
- [ ] 완전 성공.
- [ ] 부분 성공.
- [ ] 전투 승리.
- [ ] 신규 발견·관계·태그.

### 실패
- [ ] 입력 실패·문법 오류·비용 부족·상황 저항.
- [ ] Defeat.
- [ ] invalid result data.

### 반복·저장
- [ ] Accept 연타 중복 Reward 없음.
- [ ] Retry 후 결과 변경.
- [ ] App 종료·재실행 transaction 복구.

### 화면·입력
- [ ] 긴 Cause Text.
- [ ] 1280×720·ultrawide.
- [ ] Keyboard focus·disabled actions.

---

# [SIT-GR-009] 원래 필드 복귀·환경 변화

## A. 상황 개요

- 발생 이유: 별도 Battle 또는 Situation 해결 결과를 원래 장소에 반영해야 함.
- 현재 목표: 같은 사건·장소로 돌아왔음을 인식하고 결과 변화를 확인.
- 알고 있는 정보: 방금 수용한 Result.
- 모르는 정보: NPC·환경의 후속 반응.
- 위험: 잘못된 Spawn, 이전 손상 상태, NPC 중복, BGM 재시작, 변경 누락.
- 기대 보상: 내가 만든 마법이 실제 세계를 바꿨다는 증거.
- 감정: 해소·책임·성취.
- 핵심 선택: 변화 관찰, NPC 반응, 다음 기록.
- 다음: Dialogue 또는 Grimoire Record.

## B. 근거와 가정

- 확정: 전투 종료 후 결과를 원래 Field 환경에 반영.
- 확정: 필드와 전투는 같은 장소의 색·건축·대상 식별 요소 공유.
- 실제 구현: 없음.
- 해석: Node 보존보다 ID Snapshot 재구성 방식이 안전.
- 제안: `FieldReturnSnapshot + WorldChangeSet + WorldStateApplier`.
- 가정: Battle 진입 Marker와 복귀 Marker는 보통 동일 또는 명시적 return marker.
- 사용자 결정 필요: 복귀 Camera 연출 길이, BGM playback 위치 보존 수준.

## C. 진입 조건

- 이전: Result Accept·Reward staged.
- Trigger: `field_return_requested(snapshot, change_set)`.
- Flags: encounter complete, result tags.
- Player: final hp/mana.
- World: location id, variant, object states.
- 진입 불가: snapshot invalid, location missing.
- 중복 방지: change set application ledger.

## D. 화면 목적

1. 원래 장소와 Player 위치.
2. 바뀐 대상·환경.
3. NPC·동반 정령의 즉시 반응.
4. 다음 목표·기록.

## E. 예상 화면

```text
┌──────────────────────────────────────────────────────────────┐
│ 생태 온실 · 관개 수로                 목표: 결과 확인          │
│                                                              │
│ [안정된 압력원]      [진정한 정령]                            │
│       [보호된 묘목]    [손상된 관개관]                        │
│               [주인공][동반 정령]                            │
│                                                              │
│ 변화: 묘목 우선 보호 / 관개관 과압                            │
└──────────────────────────────────────────────────────────────┘
```

- Camera: 복귀 Marker에서 시작→변화 대상 1~2개 짧게 Focus→Player.
- 첫 3초: 장소 동일성, 가장 큰 변화, Player 위치.

## F. 화면 구성요소

| 요소 | 역할 | 표시 | 숨김 | 입력 | 우선 |
|---|---|---|---|---|---|
| Field Background | 장소 연속 | 항상 | 없음 | 없음 | 2 |
| Applied Layers | 손상·복구 | result tags | 미적용 | 없음 | 1 |
| Changed Objects | 결과 증거 | change set | 없음 | 관찰 | 1 |
| Player/Companion | 복귀 | ready | transition | 이동 | 1 |
| NPC Reactions | 후속 | 조건 | 없음 | interact | 2 |
| Change Summary | 변화 요약 | 최초 복귀 | 확인 후 축약 | advance | 1 |
| Objective | 다음 행동 | apply 완료 | transition | 없음 | 1 |
| Transition Blocker | 원자적 적용 | loading/applying | ready | 없음 | 0 |

## G. 플레이어 입력

| 입력 | 조건 | 반응 | 피드백 | 제한 |
|---|---|---|---|---|
| Advance/Skip | return focus | 다음 focus | indicator | apply 전 불가 |
| WASD | CONTROL | 이동 | animation | intro 종료 후 |
| Interact | changed object/NPC | observation/dialogue | prompt | 중복 flag |
| Esc | control | Pause | overlay | apply 중 금지 |
| Mouse click | focus target 후보 | interaction | outline | 이동 방식 결정 필요 |

## H. 흐름

```text
전환 입력 잠금 [자동]
→ Field Scene instantiate [자동]
→ Snapshot base state 적용 [자동]
→ WorldChangeSet 검증 [자동]
→ 변경을 원자적으로 적용 [자동]
→ Camera·BGM 복구 [자동]
→ 변화 Focus·Summary [자동/Skip]
→ NPC·Companion reaction [자동/입력]
→ Field control 해제 [자동]
→ Dialogue/Record [입력/자동]
```

- Save: 변경 Apply와 Reward 적용이 모두 끝난 뒤.
- 실패: missing object·duplicate apply·invalid marker.

## I. 시스템 반응

| 행동/조건 | 즉시 반응 | 데이터 변화 | 장기 영향 | 다음 상태 |
|---|---|---|---|---|
| valid return | Field load | snapshot state | 장소 연속 | FIELD_RETURN |
| change set apply | layers/object update | world states·flags | 이후 방문 반영 | FIELD_RETURN |
| object missing noncritical | fallback+warning | unresolved record | asset/data fix | FIELD_RETURN |
| critical object missing | input blocked | none | recovery required | ERROR_RECOVERY |
| change observed | prompt | observed flag | Grimoire detail | FIELD |
| NPC reaction | dialogue | seen flag·relation | 서사 반응 | DIALOGUE |
| duplicate apply | ledger match | skip | 중복 방지 | FIELD |

## J. 필요한 시스템

| 시스템 | 역할 | 입력 | 출력 | 연결 |
|---|---|---|---|---|
| Field Loader | World 재생성 | location definition | field ready | Flow |
| Snapshot Validator | 복귀 값 검증 | snapshot | valid/fallback | Loader |
| WorldStateApplier | change 적용 | set+field registry | apply report | Save·Result |
| Application Ledger | 중복 차단 | change id | applied state | Save |
| Camera Return Director | focus sequence | marker+targets | complete | Flow |
| AudioDirector | BGM 상태 | return key | crossfade/resume | Field |
| Reaction Router | NPC·Companion | result tags | dialogue ids | Dialogue |

## K. Godot 구현 구조

```text
FieldReturnCoordinator [Node]
├─ SnapshotValidator [RefCounted]
├─ WorldStateApplier [Node]
├─ ReturnCameraDirector [Node]
├─ ReturnSummaryPresenter [Node]
└─ ApplicationLedgerAdapter [RefCounted]
```

Field Scene 요구 Node:

```text
FieldScene
├─ SpawnMarkers [Node2D, group: spawn_marker]
├─ WorldStateRegistry [Node, group: world_state_target]
├─ VariantLayers
├─ ActorLayer
└─ CameraRig
```

- World target는 stable `state_target_id` 필요.
- Scene NodePath가 아니라 ID로 찾음.
- Field Scene이 준비되기 전 변경 적용 금지.

## L. Scene 분리 기준

- Battle World 삭제→Field World instantiate.
- Persistent ApplicationRoot 유지.
- Result Overlay는 Apply 시작 시 닫거나 Transition Layer 아래 유지.
- Field와 Battle 동시 유지하지 않음이 기본.

## M. Signal 및 상태 전환

Signals:

```text
field_return_started(snapshot_id)
field_world_ready(location_id)
world_change_apply_started(change_set_id)
world_change_applied(report)
return_focus_completed()
field_return_finished()
```

States:

```text
ENTER → LOADING_FIELD → APPLYING_SNAPSHOT → APPLYING_CHANGES
→ RETURN_FOCUS → READY → EXIT_TO_FIELD
```

- READY 전 모든 World 입력 금지.
- 유지: snapshot, change set, application id.

## N. 데이터 구조

| 데이터 | 주요 필드 | 저장 위치 | 변경 주체 | 저장 필요 |
|---|---|---|---|---|
| FieldReturnSnapshot | location, variant, marker, camera key, bgm key, object baseline | Session | Flow | checkpoint 후보 |
| WorldChangeSet | id, target changes, layer tags, npc reactions | Runtime/Result | Stager | 적용 후 예 |
| WorldObjectState | target id, state, values | Session | Applier | 예 |
| ApplicationLedger | change/reward ids | Save | Coordinator | 예 |
| ReturnViewData | summary, focus targets | runtime | Presenter | 아니오 |

## O. 유지 데이터

- 반드시: Player final hp/mana, Companion state, result tags, return marker, change set.
- 초기화: Battle actors·AI·telegraph·summon instance.
- Save: world object state, encounter complete, ledger, location/spawn.
- 세션: Camera focus progress.
- BGM: return key; exact sample position는 P2.

## P. 연출 명세

- Transition 0.3~0.8초 후보, loading 길면 indicator.
- Camera는 변화 1~2개만 Focus, Skip 가능.
- 변화 Summary는 Text+World highlight.
- 진정한 정령은 파괴 연출 대신 호흡·빛 안정.
- Companion 반응은 감정, 해결 정답 재설명 금지.
- BGM는 Battle tension→Field aftermath crossfade.

## Q. 필요한 애셋

| 애셋 | 용도 | 상태·변형 | 우선 | 임시 대체 |
|---|---|---|---|---|
| Field result layers | 손상·복구 | seedlings/structure variants | P0 | tint·shape |
| Calmed spirit | 전투 후 | calm/exit | P0 | color change |
| Object state sprites | pressure/pipe/canopy | before/after | P0 | overlay |
| Return summary UI | 변화 요약 | success/partial | P0 | panel |
| Transition FX | battle↔field | 1 공용 | P1 | fade |
| Ambient/BGM | aftermath | state | P1 | base loop |

## R. 예외 상황

- 잘못된 Spawn: fallback marker+error.
- target ID 변경: content version migration·alias 후보.
- Reward 적용됐으나 world apply 실패: transaction status와 recovery.
- NPC 중복: Variant Applier가 id registry로 1개만 생성.
- BGM 중복: state key 비교.
- Player가 Collision 내부 Spawn: nearest safe marker 후보.
- Camera focus target 없음: Summary만 표시하고 control 복귀.
- resize 중 Focus: safe frame 재계산.

## S. 완료 기준

- 같은 장소로 즉시 인식.
- 결과 변화가 실제 World에 보임.
- Player 위치·NPC·Companion 중복·오류 없음.
- ChangeSet 1회 적용.
- Save/Load 후 변화 유지.
- Critical target 누락 시 안전 차단·복구.

## T. 테스트 체크리스트

### 정상
- [ ] seedlings prioritized.
- [ ] structure prioritized.
- [ ] battle victory return.
- [ ] festival canopy variant.

### 실패
- [ ] missing marker.
- [ ] missing target.
- [ ] apply exception.
- [ ] duplicate change id.

### 반복·저장
- [ ] 재방문 시 변화 유지.
- [ ] Retry 후 이전 변화 미잔존.
- [ ] Save/Load location·spawn·BGM key.

### 화면·입력
- [ ] Transition 중 입력 차단.
- [ ] Camera focus Skip.
- [ ] ultrawide changed object visible/edge marker.

---

# [SIT-GR-010] 귀환·마도서 기록·Checkpoint

## A. 상황 개요

- 발생 이유: 수업·시험·축제·현장 결과를 학습과 다음 일정으로 연결.
- 현재 목표: 상황·의도·조합·결과·부작용·발견을 확인하고 기록 이름을 정함.
- 알고 있는 정보: 방금 경험한 결과와 비용.
- 모르는 정보: 다음 수업·장기 활용.
- 위험: 마도서가 완성 주문 자동 시전 목록이 됨, 기록 누락, Save 실패.
- 기대 보상: 자신의 해결 방식에 의미를 부여하고 다음 목표 생성.
- 감정: 성찰·성장·애착.
- 핵심 선택: 발견 이름·기록 확정, 다음 학습 목표 확인.
- 다음: 다음 Session Field 또는 Slice 종료.

## B. 근거와 가정

- 확정: 마도서 기록 필드와 자동 주문 stock 금지.
- 확정: 귀환 시 `정밀/안정/표현/책임` 성향을 문장 요약.
- 실제 구현: 없음.
- 해석: 기록 화면은 Inventory 대응이자 Session 종결 화면.
- 제안: Draft→Review→Name→Confirm→Checkpoint.
- 가정: 플레이어 명명은 기본 제안 이름을 수정 가능, 빈 이름 허용 정책 필요.
- 사용자 결정 필요: 직접 Text 입력 여부, 이름 길이, 성향 계산 표현.

## C. 진입 조건

- 이전: Result Record 요청, Field Return reaction 완료, Session conclusion.
- Trigger: GrimoireDraft 존재.
- Flags: record not confirmed, current session result.
- Player: learned glyphs, progression.
- World: 귀환 장소 또는 Full-screen overlay.
- 진입 불가: draft critical fields missing.
- 중복 방지: entry id와 result id 1:1 ledger.

## D. 화면 목적

1. 무엇을 해결했는가.
2. 어떤 의도와 글자를 사용했는가.
3. 실제 결과·부작용·포기한 것.
4. 발견 이름·다음 학습 목표·Save 완료.

## E. 예상 화면

```text
┌──────────────────────────────────────────────────────────────┐
│ 마도서 기록 · 현장실습                                      │
├───────────────────────┬──────────────────────────────────────┤
│ 상황                  │ 생태 온실 관개 수로                  │
│ 글자·조합             │ 흐름 + 집중                          │
│ 의도                  │ 묘목을 먼저 살린다                   │
│ 실제 결과             │ 묘목 보호 / 관개관 과압              │
│ 부작용·포기           │ 구조물 내구도                         │
│ 발견                  │ 좁은 우회관으로 압력을 집중           │
├───────────────────────┴──────────────────────────────────────┤
│ 기록 이름: [ 정밀 우회 __________________ ]                   │
│ 성향 요약: 빠른 해결을 택하고 그 손상을 기록했습니다.        │
│ [확정·저장]     [결과 다시 보기]                             │
└──────────────────────────────────────────────────────────────┘
```

- 처음 3초: 상황명, Outcome, 사용 글자.
- Full-screen Overlay 또는 장소 배경 약하게 유지.

## F. 화면 구성요소

| 요소 | 역할 | 표시 조건 | 숨김 | 입력 | 우선 |
|---|---|---|---|---|---|
| Session Header | 기록 맥락 | 항상 | 없음 | 없음 | 1 |
| Causal Fields | 전체 과정 | 항상 | 없음 | expand | 1 |
| World Result | 변화 | change 있음 | 없음 | preview | 2 |
| Discovery | 새 활용 | 발견 | 없음 | 없음 | 1 |
| Name Input | 플레이어 명명 | naming enabled | read-only 정책 | text | 1 |
| Trait Summary | 정밀·안정·표현·책임 | computed | 없음 | 없음 | 2 |
| Next Goal | 다음 학습 | available | Slice end 후보 | 없음 | 1 |
| Confirm Save | 기록 확정 | valid draft | saving | Click·Enter | 1 |
| Review Result | 이전 Result | 항상 | 없음 | Click | 3 |
| Save Status | 진행·완료·오류 | confirm 후 | normal | retry | 0 |

## G. 플레이어 입력

| 입력 | 조건 | 시스템 반응 | 피드백 | 실패·제한 |
|---|---|---|---|---|
| Text input | naming active | draft name update | caret/count | IME·length validation |
| Enter/Confirm | valid | entry finalize+save | progress | double submit token |
| Result review | available | Result detail open | overlay | read only |
| Esc | before confirm | confirm leave | modal | draft loss warning |
| Tab | fields/actions | focus | ring | IME 중 예외 |
| Mobile keyboard | 후행 | text input | safe area | P2 |

## H. 상황 진행 흐름

| 단계 | 자동/입력 | 취소 | 저장 | 실패 | 반복 |
|---|---|---|---|---|---|
| Draft validate | 자동 | 불가 | 없음 | 가능 | 1회 |
| Entry bind | 자동 | 가능 | 없음 | 가능 | 1회 |
| Review | 입력 | 가능 | 없음 | 없음 | 반복 |
| Name | 입력 | 가능 | draft memory | validation | 수정 반복 |
| Trait/Next Goal | 자동 | 가능 | 없음 | missing rule | 1회 |
| Confirm | 입력 | 이후 불가 | transaction 시작 | 가능 | 1회 |
| Entry+Progress apply | 자동 | 불가 | pending | 가능 | idempotent |
| Checkpoint save | 자동 | 불가 | 예 | 가능 | retry |
| Next Session | 자동/입력 | 불가 | 완료 | 가능 | 1회 |

## I. 시스템 반응

| 행동 | 조건 | 즉시 반응 | 데이터 변화 | 장기 영향 | 다음 상태 |
|---|---|---|---|---|---|
| Name edit | valid text | preview | draft name | player ownership | RECORD |
| Empty/invalid name | policy false | error | 없음 | 없음 | RECORD |
| Confirm | valid draft | input lock | entry+progress pending | learning history | SAVE |
| Duplicate confirm | token consumed | ignore | 없음 | duplicate 없음 | SAVE |
| Save success | transaction complete | success state | checkpoint | Continue | NEXT_SESSION |
| Save failure | file error | retry/export info | in-memory state retained | no loss | ERROR_RECOVERY |
| Review Result | entry not final | read only detail | 없음 | understanding | RECORD |
| Cancel | before final | warning | draft retained/discard policy | 없음 | FIELD/RECORD |

## J. 필요한 시스템

| 시스템 | 역할 | 입력 | 출력 | 연결 |
|---|---|---|---|---|
| Grimoire Draft Factory | Result→Draft | result/context | draft | Result |
| Grimoire Controller | Review·Name·Confirm | draft | entry result | UI·Save |
| Trait Summarizer | 성향 문장 | decisions/results | summary | UI·Progress |
| Progression Resolver | 다음 학습 | entry/session | next goal | Flow |
| Entry Ledger | result 1:1 | ids | duplicate guard | Save |
| SaveService | checkpoint | SaveData | success/error | Main·Flow |
| IME/Text Input | naming | input events | string | UI |

## K. Godot 구현 구조

```text
GrimoireScreen [Control]
├─ Header [Control]
├─ RecordScroll [ScrollContainer]
│  └─ CausalRecordFields [VBoxContainer]
├─ WorldChangePreview [Control]
├─ DiscoveryPanel [Control]
├─ NameEditor [LineEdit 또는 TextEdit]
├─ TraitSummary [RichTextLabel]
├─ NextGoalPanel [Control]
├─ SaveStatusPanel [Control]
└─ ActionBar [Control]
```

도메인:

```text
GrimoireCoordinator [Node]
├─ DraftValidator
├─ EntryFactory
├─ TraitSummarizer
├─ ProgressionResolver
├─ EntryLedgerAdapter
└─ CheckpointCoordinator
```

- LineEdit IME·한글 입력 확인 필요.
- Entry는 runtime State이고 static Definition 아님.
- 자동 시전 API를 제공하지 않는다.

## L. Scene 분리 기준

- Full-screen CanvasLayer Overlay 추천.
- Session 배경은 World 아래 유지 가능.
- Main Inventory처럼 별도 World Scene 불필요.
- 결과 Review는 nested Overlay 또는 Panel.

## M. Signal 및 상태 전환

Signals:

```text
grimoire_draft_bound(draft_id)
entry_name_changed(text)
entry_confirm_requested(draft_id, token)
entry_finalized(entry_id)
checkpoint_save_requested(checkpoint_id)
checkpoint_saved(checkpoint_id)
grimoire_finished(next_session_id)
```

States:

```text
ENTER → VALIDATING → REVIEWING → NAMING → READY
→ FINALIZING → SAVING → SAVED → EXIT
```

- REVIEWING/NAMING/READY: 취소 정책.
- FINALIZING/SAVING: 입력 차단.
- 유지: draft, result ids, next goal, transaction id.

## N. 데이터 구조

| 데이터 | 주요 필드 | 저장 위치 | 변경 주체 | 저장 필요 |
|---|---|---|---|---|
| GrimoireDraft | result id, context, intent, composition, outcome, side effect, discovery | Session | Factory | 확정 전 세션 |
| GrimoireEntryState | entry id, all fields, player name, timestamp, source row ids | Save | Coordinator | 예 |
| TraitSummaryResult | precision, stability, expression, responsibility, sentence key | runtime | Summarizer | summary 저장 후보 |
| ProgressionResult | next session, learned state, objective | runtime | Resolver | 예 |
| EntryLedger | result id→entry id | Save | Coordinator | 예 |
| CheckpointData | session snapshot | Save | SaveService | 예 |

## O. 화면 전환 시 유지 데이터

- 반드시: Draft, Result, Player/Companion state, progression state.
- 초기화: text focus, scroll position 정책, save spinner.
- Save: finalized entry, ledger, learned glyph state, next session, world state.
- 세션: unconfirmed draft.
- Camera/BGM: 장소 배경 유지 또는 Record audio layer.

## P. 연출 명세

- Page/ink visual은 Art Style 승인 후.
- 각 기록 필드는 순서대로 짧게 등장하되 Skip 가능.
- Name Confirm 시 과도한 마법 효과보다 ink settle·sound 후보.
- Save 완료는 명확한 icon+text.
- Save 실패는 기록을 사라지게 하지 않고 in-memory 유지.
- Trait summary는 평가 점수보다 문장 중심.

## Q. 필요한 애셋

| 애셋 | 용도 | 상태·변형 | 우선 | 임시 대체 |
|---|---|---|---|---|
| Grimoire Background | 기록 화면 | page/cover 후보 | P1 | Panel |
| Field Icons | 상황·의도·결과 | 6~7종 | P0 | text labels |
| Glyph Icons | 흐름·집중·분산 | learned | P0 | text |
| Save Status | saving/success/error | 3종 | P0 | text |
| Trait Markers | 정밀·안정·표현·책임 | 4종 | P1 | labels |
| SFX | page/name/save | 3종 | P2 | 무음 |

## R. 예외 상황

- 한글 IME Confirm과 화면 Confirm 충돌: text focus 중 Enter 처리 분리.
- 이름 길이·금지 문자: inline validation.
- Draft critical field 누락: fallback 생성 또는 기록 차단·오류 ID.
- Save 공간·권한 실패: retry·다른 Slot·Main 복귀 전 경고.
- Entry 중복: ledger.
- App 종료 중 Save: temp file·atomic rename.
- Content update로 label key 누락: stored raw id+fallback text 정책.
- Result Review 닫기 연타: Overlay stack token.

## S. 완료 기준

- 기록 필드 7개가 결과와 일치.
- 자동 주문 stock·추천 기능 없음.
- 한글 이름 입력·취소·Confirm 정상.
- Entry와 Result 1:1.
- Save 실패 시 데이터 유실 없음.
- Checkpoint Load 후 동일 기록·다음 목표.
- 다음 Session 또는 Slice 종료로 정상 전환.

## T. 테스트 체크리스트

### 정상
- [ ] 수업·시험·축제·현장 기록.
- [ ] 이름 수정·확정.
- [ ] Trait summary·next goal.
- [ ] Save success→Continue.

### 실패
- [ ] 빈 이름·길이 초과.
- [ ] draft field 누락.
- [ ] disk write failure.
- [ ] content version mismatch.

### 반복·저장
- [ ] Confirm 연타 duplicate entry 없음.
- [ ] Save/Load 모든 필드 일치.
- [ ] 동일 result 재기록 차단.
- [ ] App 종료 복구.

### 화면·입력
- [ ] 한글 IME.
- [ ] 1280×720 긴 문장 Scroll.
- [ ] Keyboard focus·Esc Modal.
