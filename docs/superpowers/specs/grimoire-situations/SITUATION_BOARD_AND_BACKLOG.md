# GRIMOIRE 상황 보드·전환도·P1~P3 Backlog

## 문서 상태

```yaml
parent: GM-SITUATION-SCREEN-SPEC-01
status: USER_REVIEW_REQUIRED
p0_details: COMPLETE_IN_LINKED_SPECS
implementation: NOT_STARTED
```

---

# 1. P1~P3 요약 명세

## P1 — 핵심 경험 완성

| ID·상황 | 목적 | 화면·구조 | 주요 데이터 | 완료 기준 | 임시 대체 |
|---|---|---|---|---|---|
| `SIT-GR-011 Pause·설정·접근성` | 중단·복구·가독성 | 재사용 `PauseOverlay` | SettingsState | World 정지 정책·Focus 복원 | 기본 Panel |
| `SIT-GR-012 Save Slot·복구` | 명시적 Slot·손상 복구 | Main/ Pause 하위 Screen | SaveMetadata·Migration | 손상·백업·버전 처리 | Slot 1개 |
| `SIT-GR-013 Tutorial Hint·규칙 재열람` | 직접 작성·오류 분류 학습 | Context Hint + Glossary Overlay | TutorialState·Glossary | 필수 정보 독점 없음 | Text callout |
| `SIT-GR-014 축제 장소 상태 변형` | 생활 마법·표현 결과 | 학교 Field Variant | Variant·Result tags | 동일 Scene 재사용·3결과 | 장식 Layer |
| `SIT-GR-019 시험 평가 피드백` | 정답 암기 아닌 이해 증명 | Dialogue+Result variation | evaluation axes | 해법별 설명·진행 차단 없음 | Result text |
| `SIT-GR-020 현장 Briefing` | 목표·비살상 조건 | Dialogue+Situation Intro | encounter context | 전투 전 목표 이해 | static card |

### P1 공통 위험

- Pause가 Spell Resolver·Save transaction을 중간에 정지시켜 상태 손상.
- Tutorial이 정답 조합을 알려 줌.
- Save Slot UI가 Main·Pause에서 서로 다른 Metadata를 표시.
- 축제 Variant가 별도 대형 Map으로 팽창.

## P2 — 다양성·편의·후속 플랫폼

| ID·상황 | 목적 | 구조 | 차단 |
|---|---|---|---|
| `SIT-GR-015 시간대·BGM 상태 변화` | Session 정서 차이 | Location Variant + Audio State | AUDIO-DIRECTION-01 |
| `SIT-GR-016 Mobile 가로 적응` | Touch·Safe area·Resume | responsive UI·touch input adapter | PC Slice 안정화 |
| `SIT-GR-017 고급 기록 비교·필터` | 과거 해법 비교 | Grimoire filter/search | 기록 수 증가 후 |
| `SIT-GR-021 선택형 대화 기록` | 관계 회상 | dialogue log | P0 Dialogue 안정화 |
| `SIT-GR-022 UI Scale·고대비 설정` | 접근성 | Settings+Theme variation | Theme 결정 |
| `SIT-GR-023 Window·Focus 복귀` | Desktop 안정성 | Application notification handling | runtime project |

## P3 — 폴리싱·확장

| ID·상황 | 목적 | 구조 | 차단 |
|---|---|---|---|
| `SIT-GR-018 연출·미세 Animation Polish` | 감정·타격감 | AnimationPlayer·Tween·FX | Art Bible·runtime |
| `SIT-GR-024 고급 Camera Focus` | 변화 강조 | Camera Director | P0 Camera 안정화 |
| `SIT-GR-025 추가 보조 소환 역할` | 전술 다양성 | Summon Definitions | Slice 검증 후 |
| `SIT-GR-026 동반 정령 후속 형상` | 장기 애착 | Form display system | Slice 외 |
| `SIT-GR-027 세션 Recap 연출` | 장기 기억 | Grimoire summary | 콘텐츠 축적 후 |

---

# 2. 전체 상황 전환도

```text
BOOT
└─ MAIN_MENU
   ├─ New Game ───────────────┐
   └─ Continue ───────────────┤
                              ▼
                        SESSION_LOADING
                              ▼
                     FIELD_EXPLORATION
                 ┌────────────┼──────────────┐
                 ▼            ▼              ▼
              DIALOGUE   SCHEDULE_SELECT  SITUATION_INTRO
                 │            │              │
                 └──────┬─────┘              ▼
                        │             BATTLE_PREPARATION
                        │              ┌──────┴──────┐
                        │              ▼             ▼
                        │        BATTLE_ACTIVE   FIELD_SITUATION
                        │              │             │
                        │              └──────┬──────┘
                        │                     ▼
                        │              SPELL_COMPOSER
                        │                     ▼
                        │              SPELL_RESOLVING
                        │                     ▼
                        │             SITUATION_RESULT
                        │              ┌──────┼─────────┐
                        │              ▼      ▼         ▼
                        │           RETRY   CONTINUE   RECORD_DRAFT
                        │              │      │         │
                        │              └──┐   ▼         │
                        │                 │ FIELD_RETURN│
                        │                 │      ▼      │
                        │                 └─ FIELD_REACTION
                        │                        │
                        └────────────────────────┼───────┘
                                                 ▼
                                         GRIMOIRE_RECORD
                                                 ▼
                                         CHECKPOINT_SAVE
                                      ┌──────────┴──────────┐
                                      ▼                     ▼
                               NEXT_SESSION_FIELD       SLICE_END/MAIN
```

전역 Interrupt:

```text
허용 상태 → PAUSED → 원상태
오류 상태 → ERROR_RECOVERY → 안전 Checkpoint 또는 Main
전환 중 → TRANSITION_LOCK → 준비 완료 상태
```

---

# 3. 상태 전환 표

| 이전 상황 | 전환 조건 | 다음 상황 | 유지 데이터 | 전환 방식 |
|---|---|---|---|---|
| Main | New/Continue 검증 | Session Loading | Settings·Save metadata | UI state→World load |
| Loading | Field ready | School Field | SessionState·checkpoint | WorldHost instantiate |
| Field | NPC interaction valid | Dialogue | Field snapshot·BGM | CanvasLayer Overlay |
| Field | Schedule slot active | Schedule | location·next session | CanvasLayer Overlay |
| Field | Situation target valid | Situation Intro | world target·flags | Overlay+world markers |
| Situation Intro | battle encounter | Battle Preparation | FieldReturnSnapshot | Transition lock |
| Preparation | confirmed | Battle | player·summon·context | Field unload→Battle load |
| Field Situation | spell request | Spell Composer | target·constraints | Overlay |
| Battle | spell request | Spell Composer | battle clock·target·summon | Overlay+time policy |
| Composer | cancel before commit | previous | resources unchanged | Overlay close |
| Composer | valid commit | Resolving | SpellIntent·token | input lock |
| Resolving | domain result | Result | costs·cause·world changes | Result Overlay |
| Result | retry allowed | Composer/Battle | RetrySnapshot | state restore |
| Result | accept battle result | Field Return | FieldReturnSnapshot·change set | world swap |
| Result | accept field result | Field | world changes | same world apply |
| Field Return | changes applied | Field Reaction | result tags·NPC state | Camera focus |
| Result/Reaction | record required | Grimoire | GrimoireDraft | full-screen Overlay |
| Grimoire | entry saved | Next Field/End | all save state | checkpoint transition |
| Any safe state | Pause | Pause | current state key | Overlay+process policy |
| Error | recovery selected | Checkpoint/Main | valid persisted data | controlled reload |

---

# 4. 분기 구조

## 4.1 Situation Challenge

```text
상황 관찰
├─ 필요한 정보 확보
│  ├─ 흐름+집중 → 빠름·정밀·손상 위험
│  ├─ 흐름+분산 → 느림·안정·자원 소모
│  └─ 흐름 단독 → 일부 상황에서 실용·힘 부족
├─ 정보 부족
│  ├─ 다시 관찰
│  ├─ PREPARED 태그로 위험 source 확인
│  └─ 불확실성을 감수하고 시도
├─ 비용 부족
│  ├─ 구성 변경
│  ├─ 취소·준비 상태 확인
│  └─ 해당 Session 정책에 따른 복구
└─ 입력 실패
   ├─ Undo·다시 쓰기
   ├─ 후보 직접 선택
   └─ 자원 미소모
```

## 4.2 전투

```text
폭주 정령 전투
├─ 압력원 우선 공격
│  └─ 빠른 진정 / 반격 위험
├─ 정령 공격 강도 분산
│  └─ 안전 시간 확보 / 느린 해결
├─ 수호 소환 사용
│  └─ 작성 시간 확보 / 지속시간·재사용 제한
├─ 보호 대상 손상
│  └─ 부분 성공·tradeoff
└─ Player defeat·critical loss
   └─ Retry 또는 안전 checkpoint
```

## 4.3 결과

```text
Result
├─ SUCCESS
│  └─ Reward→World Apply→Record
├─ PARTIAL
│  └─ Tradeoff 확인→수용/허용 Retry
├─ FAILED_INPUT
│  └─ 자원 미소모→Composer 복구
├─ FAILED_GRAMMAR
│  └─ 문제 Slot 수정
├─ BLOCKED_COST
│  └─ 구성 변경·취소
├─ LIMITED_EFFECT
│  └─ 비용 적용→부분 결과
└─ DEFEAT
   └─ Retry snapshot 또는 checkpoint
```

---

# 5. 시스템 의존 관계

```text
ContentRegistry
├─ Location Definitions
├─ Dialogue Definitions
├─ Schedule Definitions
├─ Situation Definitions
├─ Glyph/Spell Definitions
├─ Encounter Definitions
└─ Reward/Result Definitions

ApplicationRoot
├─ GameFlowController
│  ├─ SessionStateOwner
│  ├─ WorldHost
│  ├─ UIHost
│  └─ TransitionController
├─ AudioDirector
└─ SaveService(Autoload)

FieldWorld
├─ Location/Variant
├─ Player/Companion/NPC
├─ Interaction
├─ Situation Targets
└─ WorldStateRegistry

BattleWorld
├─ BattleDirector
├─ BattleClock
├─ Units/AI
├─ Objective
├─ Summon
└─ Telegraph

Spell Domain
├─ Stroke Capture
├─ Recognition Adapter
├─ Grammar
├─ Cost/Tendency
└─ Resolver

Result Pipeline
├─ Result Validator
├─ Reward Resolver
├─ Retry Policy
├─ World Change Stager
└─ Grimoire Draft
```

## 5.1 금지 의존

- UI→Save 파일 직접 쓰기.
- UI→Battle HP 직접 변경.
- Dialogue→Scene 직접 교체.
- Enemy Animation→Damage 적용.
- Result Animation→Reward 지급.
- Field Node 참조→Save 직렬화.
- Companion→정답 Spell 선택.

---

# 6. 공통 UI와 상황 전용 UI

## 6.1 공통 UI Scene

| UI Scene | 사용처 | 책임 |
|---|---|---|
| `ObjectivePanel` | Field·Battle·Situation | 목표·진행 |
| `ResourceStrip` | Field·Battle·Spell | HP·Mana·시전 횟수 |
| `WarningBanner` | 모든 화면 | 오류·위험·복구 |
| `InteractionPrompt` | Field·Battle target | 가능 행동 |
| `ConfirmCancelBar` | Schedule·Spell·Result·Grimoire | 명시적 Commit |
| `ModalConfirm` | overwrite·retry·exit | 파괴적 행동 방지 |
| `LoadingBlocker` | World·Save 전환 | 입력 잠금 |
| `StatusBadge` | tag·summon·condition | 다중 채널 상태 |
| `ScrollableDetail` | Dialogue history·Result·Grimoire | 긴 한국어 Text |

## 6.2 프로젝트 전용 UI Scene

| UI Scene | 프로젝트 고유 책임 |
|---|---|
| `StrokeInputControl` | 마법 글자 직접 작성 |
| `RecognitionCandidatePanel` | 후보·문제 Stroke·확신 문구 |
| `GlyphCompositionSlots` | Main 1 + Support 0~1 |
| `SituationConstraintPanel` | 충격·압력·보호·시전 횟수 |
| `GuardSummonStatusPanel` | 작성 안전 시간·지속 상태 |
| `GrimoireCausalRecord` | 상황·의도·결과·부작용·발견 |
| `TraitSummaryPanel` | 정밀·안정·표현·책임 문장 |

---

# 7. 재사용 Scene과 프로젝트 전용 Scene

## 7.1 높은 재사용성

- ApplicationRoot.
- GameFlowController pattern.
- TransitionLayer.
- Main Menu Shell.
- Dialogue Overlay Shell.
- Result Cause Chain Shell.
- Pause·Settings.
- Save Metadata·Error recovery.
- Objective·Warning·Confirm components.
- Location Variant·World State target interface.

## 7.2 GRIMOIRE 전용

- 학교·온실 Field Scene.
- 전술 온실 Arena.
- 글자 Stroke·Recognition·Grammar.
- 흐름·집중·분산 data.
- 수호형 Summon.
- 비살상 폭주 정령 Objective.
- 자유일정 3행동과 tags.
- 마도서 Record·Trait summary.

---

# 8. 상황별 인게임 화면 보드

## ① `SIT-GR-001 최초 실행·세이브 선택` — P0

```text
┌──────────────────────────────┐
│ LOGO        설정             │
│       [이어하기]             │
│       [새 시작]              │
│ 최근 장소·시간·Save version  │
└──────────────────────────────┘
```

- 핵심 행동: Continue/New Game.
- 최초 정보: Save 가능 여부.
- 시각 기준: 전체 Art Style 공유, 최종 미정.
- 시스템: Boot, Save Metadata, Session Factory.
- 이전/다음: Boot→Main→Field.
- 현재: 문서·파일 없음, 신규 필요.

## ② `SIT-GR-002 학교 장면 진입·관찰` — P0

```text
┌──────────────────────────────┐
│ 장소·목표                    │
│ 교수  수로 이상  동급생      │
│      주인공·정령             │
│ Prompt             Mana      │
└──────────────────────────────┘
```

- 행동: 짧은 이동·NPC·Hotspot.
- 정보: 장소, 목표, 이상 징후.
- 시각: 3/4 고정 Field, SD.
- 시스템: Location Variant, Interaction, Companion.
- 이전/다음: Load→Field→Dialogue/Situation.
- 현재: 문서 확정, 구현 없음.

## ③ `SIT-GR-003 교수·동급생·정령 대화` — P0

```text
┌──────────────────────────────┐
│ 기존 장소 배경               │
│ 교수 반신   정령 반응         │
│ 이름·대사                    │
│ 선택지 1/2/3                 │
└──────────────────────────────┘
```

- 행동: 대사 진행·관점 선택.
- 정보: 화자·핵심 문장·선택 영향.
- 시각: 반신+같은 배경.
- 시스템: Dialogue, Condition, Effect.
- 다음: Field/Situation/Schedule.
- 현재: 표현 구조 확정, 구현 없음.

## ④ `SIT-GR-004 자유일정 선택` — P0

```text
┌──────────────────────────────┐
│ 다음: 실기시험               │
│ [휴식] [준비] [교류]         │
│ CALM PREPARED CONNECTED      │
│ 상세             [결정]      │
└──────────────────────────────┘
```

- 행동: 3개 중 1개.
- 정보: 다음 일정·효용 축.
- 시스템: Schedule, Tags, Short scene.
- 다음: Dialogue→Next session.
- 현재: 규칙 확정, 구현 없음.

## ⑤ `SIT-GR-005 Situation Challenge 관찰` — P0

```text
┌──────────────────────────────┐
│ 목표·제약·위험               │
│ Target / 보호 대상 / 압력원   │
│ 관찰 정보                    │
│ [대상] [마법 설계]           │
└──────────────────────────────┘
```

- 행동: 대상·우선순위·Spell 진입.
- 정보: 목표, 위험, 비용, 유효 target.
- 시스템: Situation, Targeting, Context.
- 다음: Spell/Battle.
- 현재: 콘텐츠 확정, 구현 없음.

## ⑥ `SIT-GR-006 직접 작성·조합` — P0

```text
┌──────────────────────────────┐
│ 목표·Target·Risk             │
│ [ Stroke Canvas ]  후보      │
│ Main [흐름] Support [ ]      │
│ Undo Clear 비용 [시전]       │
└──────────────────────────────┘
```

- 행동: Draw, candidate, composition, Commit.
- 정보: 인식·문법·비용·경향.
- 시각: World dim+target 유지.
- 시스템: Capture, Recognition, Grammar, Resolver.
- 다음: Result/Battle.
- 현재: 입력 계약 확정, 기술 미정.

## ⑦ `SIT-GR-007 전술 전투·수호 소환` — P0

```text
┌──────────────────────────────┐
│ 비살상 목표·위험 단계        │
│ 묘목  정령  압력원            │
│ 주인공  수호 범위             │
│ Mana 수호 [마법 설계]        │
└──────────────────────────────┘
```

- 행동: 이동·target·수호·Spell.
- 정보: Telegraph·압력원·보호 상태.
- 시각: 별도 고정 3/4 전술장.
- 시스템: BattleClock, AI, Objective, Summon.
- 다음: Result.
- 현재: 화면 구조 확정, Runtime 없음.

## ⑧ `SIT-GR-008 결과·원인 복기` — P0

```text
┌──────────────────────────────┐
│ 결과: 부분 성공              │
│ 입력→문법→비용→상황→결과     │
│ 보호 / 포기 / 부작용 / 발견  │
│ [기록] [재시도] [수용]       │
└──────────────────────────────┘
```

- 행동: 결과 수용·재시도·기록.
- 정보: Outcome·cause·cost·tradeoff.
- 시스템: Result, Reward, Retry, Ledger.
- 다음: Field Return/Composer.
- 현재: 규칙 확정, 구현 없음.

## ⑨ `SIT-GR-009~010 필드 복귀·마도서 기록` — P0

```text
┌──────────────────────────────┐
│ 변화한 온실 Field            │
│ 보호 묘목 / 손상 관개관       │
│ 기록: 상황·의도·결과·발견    │
│ 이름 [_______] [확정·저장]   │
└──────────────────────────────┘
```

- 행동: 변화 관찰·기록 명명·Save.
- 정보: 실제 World 변화·부작용·next goal.
- 시스템: Snapshot, World Apply, Grimoire, Checkpoint.
- 이전/다음: Result→Return→Record→Next.
- 현재: 데이터 의미 확정, 구현 없음.

---

# 9. Vertical Slice P0 검증 순서

```text
1. Main New Game
2. School Field load
3. Professor Dialogue
4. First Situation target
5. Simulated Recognition Spell Composer
6. Result Cause Chain
7. Field World Change
8. Grimoire Save
9. Free Schedule selection
10. Battle World swap
11. Guard Summon + Spell
12. Battle Result + Field Return
13. Full 46-minute route
```

각 단계는 이전 단계의 독립 테스트가 통과하기 전 확장하지 않는다.

---

# 10. 공통 완료 Gate

- [ ] 실제 제품 파일 존재 여부와 문서 상태 일치.
- [ ] 각 P0 Scene 독립 로드 가능.
- [ ] 하위 Scene이 Flow를 직접 전환하지 않음.
- [ ] 입력·문법·비용·상황 실패 구분.
- [ ] Reward·World Change·Grimoire Entry 중복 없음.
- [ ] Save round trip.
- [ ] 16:9·ultrawide 안전.
- [ ] Art placeholder와 final asset 상태 분리.
- [ ] Runtime·사람 검증 전 완료 주장 없음.

---

# 11. Base 승격 후보

1. 필수 기준 화면 4종을 먼저 감사하는 Workflow.
2. 화면과 실제 상황 변형을 `SCREEN → SIT` 트리로 연결.
3. 상황별 A~T 명세 구조.
4. Persistent Root + World Swap + Overlay + Snapshot.
5. Result idempotency와 World return ledger.
6. P0 board와 단계별 Vertical Slice 검증.

# 12. 프로젝트 전용 유지

- 마법 글자 작성·인식·문법.
- `흐름 / 집중 / 분산`.
- 학교 일정·축제·현장실습.
- 수호형 소환수와 늑대형 동반 정령.
- 마도서의 인과 기록.
- 온실 관개 압력과 비살상 정령 진정.
