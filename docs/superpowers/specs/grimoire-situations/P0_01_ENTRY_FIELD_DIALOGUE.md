# GRIMOIRE P0 상황 상세 01 — 진입·필드·대화

## 문서 상태

```yaml
parent: GM-SITUATION-SCREEN-SPEC-01
status: USER_REVIEW_REQUIRED
situations:
  - SIT-GR-001 최초 실행·세이브 선택
  - SIT-GR-002 학교 장면 진입·이상 징후 관찰
  - SIT-GR-003 교수·동급생·동반 정령 대화
implementation: NOT_STARTED
```

---

# [SIT-GR-001] 최초 실행·세이브 선택

## A. 상황 개요

- 발생 이유: 게임 실행 후 플레이 Session을 생성하거나 복원해야 한다.
- 현재 목표: 새 게임 또는 유효 Save를 선택해 첫 학교 Session에 진입.
- 알고 있는 정보: 게임 제목, Continue 가능 여부, 최근 Save 요약.
- 모르는 정보: 새 플레이어는 세계관·글자 규칙을 아직 모름.
- 현재 위험: 잘못된 Slot 덮어쓰기, 손상 Save, 중복 로드.
- 기대 보상: 빠르고 안전한 플레이 진입.
- 감정: 신비로운 기대감, 복귀 플레이어에게는 연속성.
- 핵심 선택: Continue / New Game / Save Slot / Settings / Exit.
- 다음 상황: `SIT-GR-002 학교 장면 진입`.

## B. 근거와 가정

- 확정: 세션 경계 저장, PC 우선, Mobile 후속.
- 실제 구현: 없음.
- 해석: 플레이 가능한 제품에는 최소 진입 화면과 Save Metadata 표시가 필요.
- 제안: ApplicationRoot의 초기 UI 상태로 Main Menu 구현.
- 가정: Vertical Slice는 기본 Save Slot 1개 + 백업 1개로 시작 가능.
- 사용자 결정 필요: Slot 수, Logo·배경 연출, New Game 명칭.

## C. 진입 조건

- 이전 상태: OS Launch 또는 Main 복귀.
- Trigger: `ApplicationRoot` Boot 완료.
- 진행 Flag: 없음.
- Player 상태: 없음 또는 Save Metadata.
- World 상태: WorldHost 비어 있음.
- 진입 불가: ContentRegistry 초기화 실패.
- 중복 방지: `SESSION_LOADING` 진입 즉시 모든 Main 버튼 비활성.

## D. 화면 목적

1. Continue 가능 여부.
2. 최근 Save가 어떤 Session인지.
3. New Game이 기존 기록에 미치는 영향.
4. 선택 후 로딩·오류 상태.

## E. 예상 인게임 화면

- 비율: PC 16:9 Safe Frame.
- Camera: 없음, 정적 UI.
- 플레이 공간: 없음.
- HUD: 없음.
- 입력: 중앙 Action Column.
- Popup: Save overwrite, migration, corrupted save.
- 위험 알림: 상단 Banner.
- 결과 피드백: Loading indicator와 실패 이유.
- 강조: 유효 Continue 또는 New Game.
- 최초 3초: Logo, Continue 가능, 최근 장소·Session.

```text
┌──────────────────────────────────────────────────────────────┐
│ GRIMOIRE                                      설정     종료   │
│                                                              │
│                   [ 이어하기 ]                               │
│                   [ 새 학기 시작 ]                           │
│                   [ 저장 기록 선택 ]                         │
│                                                              │
│ 최근 기록: 현장실습 전 / 00:34:12 / 작은 정령 동행           │
│ Save v1 · Content v1                                         │
└──────────────────────────────────────────────────────────────┘
```

## F. 화면 구성요소

| 요소 | 역할 | 표시 | 숨김 | 입력 | 우선 |
|---|---|---|---|---|---|
| Logo | 제품 식별 | 항상 | 없음 | 없음 | 2 |
| Continue | 최근 Save 로드 | 유효 Save | Save 없음·손상 | Click·Enter | 1 |
| New Game | 초기 State 생성 | 항상 | 로딩 중 | Click | 1 |
| Save Select | Slot 선택 | 다중 Slot | Slot 1개 | Click | 2 |
| Settings | 접근성·음량 | 항상 | Modal 중 | Click | 2 |
| Exit | 앱 종료 | Desktop | Mobile 후보 제외 | Click | 3 |
| Recent Summary | 잘못된 Save 방지 | Continue 가능 | 없음 | 없음 | 1 |
| Error Banner | 손상·불일치 | 오류 | 정상 | 확인 | 1 |
| Loading Blocker | 중복 입력 차단 | 로딩·전환 | 준비 완료 | 없음 | 0 |

## G. 플레이어 입력

| 입력 | 조건 | 반응 | 피드백 | 제한 |
|---|---|---|---|---|
| Mouse Click | 버튼 활성 | Action 요청 | Hover·Pressed | 중복 Click 차단 |
| Enter | Focus 존재 | Focus Action | Focus Ring | Transition 중 무효 |
| Arrow/Tab | Main 상태 | Focus 이동 | Focus 표시 | Modal 밖 이동 금지 |
| Esc | Settings·Modal | 이전 화면 | 닫힘 Animation | Main에서 종료하지 않음 후보 |
| Mobile Touch | 후속 플랫폼 | 동일 Action | Touch State | 현재 P0 PC 제외 |
| Controller | 미지원 | 없음 | `NOT_PROMISED` | 제외 |

## H. 상황 진행 흐름

| 단계 | 자동/입력 | 취소 | 저장 | 실패 | 반복 |
|---|---|---|---|---|---|
| Boot Service 초기화 | 자동 | 불가 | 없음 | 가능 | 재시도 |
| Save Metadata 조회 | 자동 | 불가 | 없음 | 가능 | 가능 |
| Main 표시 | 자동 | 가능 | 없음 | 없음 | 가능 |
| Action 선택 | 입력 | 가능 | 없음 | 없음 | 가능 |
| 조건 검증 | 자동 | 불가 | 없음 | 가능 | 가능 |
| Session 생성·로드 | 자동 | 불가 | New Game 초기 Save 후보 | 가능 | 재시도 |
| Field 전환 | 자동 | 불가 | 안전 Snapshot | 가능 | 1회 |

## I. 시스템 반응

| 행동 | 조건 | 즉시 반응 | 데이터 변화 | 장기 영향 | 다음 |
|---|---|---|---|---|---|
| Continue | Save valid | 입력 잠금 | Save→SessionState | 진행 복원 | SESSION_LOADING |
| New Game | 빈 Slot | 초기화 확인 | 초기 Session 생성 | 새 기록 | SESSION_LOADING |
| New Game | 기존 Slot | 경고 Modal | 없음 | 없음 | MAIN_MENU |
| Load damaged | checksum·schema 실패 | 오류 Banner | 백업 조회 | 복구 가능 | ERROR_RECOVERY |
| Double Click | 첫 요청 접수됨 | 추가 입력 무시 | 없음 | 없음 | 기존 전환 유지 |
| Cancel Modal | 확인 전 | Modal 닫힘 | 없음 | 없음 | MAIN_MENU |

## J. 필요한 시스템

| 시스템 | 역할 | 입력 | 출력 | 연결 |
|---|---|---|---|---|
| Boot | 서비스 초기화 | Project config | ready/error | Content·Save·Settings |
| SaveService | Metadata·Load·Migration | slot id | SaveData/error | Main·Session |
| SessionFactory | 초기 State | NewGameDefinition | SessionState | Flow |
| Flow | 전환 권위 | action request | state change | Transition·World |
| Settings | 접근성·음량 | user changes | SettingsState | UI·Audio |
| ErrorRecovery | 백업·재시도 | load error | recovery action | Save·Main |

## K. Godot 구현 구조

```text
MainMenuScreen [Control]
├─ Background [TextureRect]
├─ SafeArea [MarginContainer]
│  ├─ Header [HBoxContainer]
│  ├─ MainActions [VBoxContainer]
│  ├─ RecentSavePanel [PanelContainer]
│  └─ Footer [HBoxContainer]
├─ ModalHost [Control]
└─ LoadingIndicator [Control]
```

- 책임: Action 의도 수집과 Save Metadata 표시.
- 직접 데이터: `MainMenuViewData` 복사본만.
- 통신: Signal로 ApplicationRoot에 요청.
- 별도 Scene: 재사용 가능한 Full-screen UI Scene.
- 기존 구조 연결: 기존 제품 파일 없음; 신규 필요.

## L. Scene 분리 기준

- 추천: `ApplicationRoot/UIHost`의 Screen Scene.
- 전체 Scene 교체를 피하는 이유: Settings·Save Service·Transition Layer 유지.
- SubViewport: 불필요.

## M. Signal 및 상태 전환

Signals:

```text
new_game_requested(slot_id)
continue_requested(slot_id)
save_select_requested()
settings_requested()
quit_requested()
```

```text
ENTER
→ METADATA_LOADING
→ READY
→ CONFIRMING
→ SESSION_LOADING
→ EXIT
```

- READY: 모든 메뉴 입력.
- CONFIRMING: Modal 내부만 입력.
- SESSION_LOADING: 입력 금지.
- 유지: Settings, Save Metadata.

## N. 데이터 구조

| 데이터 | 필드 | 위치 | 변경 주체 | Save |
|---|---|---|---|---|
| SaveMetadata | slot, checkpoint, location, playtime, version, timestamp | SaveService | SaveService | 별도 index |
| NewGameDefinition | initial location, flags, glyphs, companion | Resource | Content author | 아니오 |
| MainMenuViewData | continue enabled, labels, warnings | runtime DTO | Presenter | 아니오 |
| SettingsState | audio, text, motion, input | ConfigFile 후보 | SettingsService | 예 |

## O. 전환 시 유지 데이터

- 반드시 유지: Settings, Save Metadata, 선택 Slot.
- 초기화: Hover·Focus transient state.
- Save 기록: New Game 초기 State 생성 후 안전 지점.
- 세션 전용: Loading request token.
- BGM: Main BGM 위치는 Field BGM과 별개; Crossfade 후보.

## P. 연출 명세

- Boot Logo 강제 장시간 연출 금지.
- Button 등장 0.3~0.6초 후보, 입력 가능 시점 명확.
- Loading은 입력 차단과 동시에 표시.
- 오류는 화면 흔들림보다 Text·Icon 우선.
- BGM·Logo Style은 ART/AUDIO Gate 후 확정.

## Q. 필요한 애셋

| 애셋 | 용도 | 변형 | 우선 | 임시 대체 |
|---|---|---|---|---|
| Main Background | 첫인상 | New/Continue 공용 | P1 | Gradient 가능 |
| Logo | 제품명 | 언어별 | P1 | Text Label 가능 |
| Button Theme | Action | normal/hover/pressed/disabled/focus | P0 | 기본 Theme |
| Error Icon | Save 오류 | warning/error | P0 | Unicode·텍스트 |
| BGM | Main | 1 loop | P1 | 무음 가능 |

정확한 크기는 `ASSET-SPEC-01`.

## R. 예외 상황

- 더블 Click: Request Token으로 첫 요청만 처리.
- Save가 Metadata 조회 후 삭제됨: Load 시 재검증.
- Version 불일치: Migration 또는 명시적 차단.
- Content 누락: New/Continue 차단과 오류 코드.
- Window resize: Container·Anchor 재배치.
- App 종료 중 Save write: 원자적 temp→rename.
- Audio 중복: AudioDirector 상태 ID 비교.

## S. 완료 기준

- Save 없음·유효·손상·Migration 상태가 구분됨.
- 주요 Action까지 2입력 이하.
- New Game 덮어쓰기 방지.
- 전환 중 중복 요청 없음.
- 실패 후 Main으로 복귀 가능.
- 6개 PC 해상도에서 잘림 없음.

## T. 테스트 체크리스트

### 정상
- [ ] Save 없음에서 New Game 진입.
- [ ] 유효 Save Continue.
- [ ] Settings 복귀 후 Focus 유지.

### 실패
- [ ] 손상 Save 경고·백업.
- [ ] Content version 불일치.
- [ ] 로딩 실패 후 재시도.

### 반복·Save
- [ ] 더블 Click 1회 처리.
- [ ] App 재실행 Metadata 일치.
- [ ] New Game 확인 취소 시 기존 Save 유지.

### 화면·입력
- [ ] 1280×720~3440×1440.
- [ ] Mouse·Keyboard Focus 충돌 없음.
- [ ] Transition 중 입력 차단.

---

# [SIT-GR-002] 학교 장면 진입·이상 징후 관찰

## A. 상황 개요

- 발생 이유: 수업·시험·자유일정·축제 Session의 장소 진입.
- 현재 목표: 장소·목표·상호작용 대상·이상 징후 파악.
- 알고 있는 정보: 현재 일정과 기본 목표.
- 모르는 정보: 문제의 정확한 원인·최적 해법.
- 위험: 필수 정보 누락, NPC·Hotspot 겹침, 잘못된 상태 Layer.
- 보상: 상황 Context와 다음 행동.
- 감정: 학교 생활의 안정감 또는 현장 전 긴장.
- 핵심 선택: 어느 NPC·Hotspot을 먼저 볼지.
- 다음: Dialogue, Schedule, Situation Intro.

## B. 근거와 가정

- 확정: 고정·장면 기반 3/4 필드, 짧은 이동·Hotspot, 학교 Scene 상태 재사용.
- 실제 구현: 없음.
- 해석: 넓은 자유 이동보다 관찰·상호작용 밀도 우선.
- 제안: Location Definition + Variant Layer + Spawn Marker.
- 가정: 한 화면의 동시 핵심 Hotspot은 3~5개.
- 사용자 결정 필요: 이동 범위·입력 키·Camera 연출 폭.

## C. 진입 조건

- 이전: SESSION_LOADING, Dialogue 종료, Field Return.
- Trigger: `load_world(location_id, variant_id)`.
- Flags: Session·Story·one-shot.
- Player: hp/mana, glyphs, schedule tags.
- World: NPC set, Hotspot state, object damage state.
- 진입 불가: Location Resource 또는 required marker 누락.
- 중복 방지: World Ready 전 Interaction disabled.

## D. 화면 목적

1. 현재 장소와 목표.
2. 플레이어·동반 정령 위치.
3. 상호작용 가능한 NPC·대상.
4. 이상 징후·위험과 결과 변화.

## E. 예상 인게임 화면

```text
┌──────────────────────────────────────────────────────────────┐
│ 학교 중정 · 오후                         목표: 교수와 대화     │
│                                                              │
│        [교수]       [마력 수로·이상 효과]                    │
│              [주인공][작은 정령]       [동급생]              │
│                                                              │
│ [Hotspot Prompt]                           Mana / 상태        │
└──────────────────────────────────────────────────────────────┘
```

- Camera: 고정 3/4, 제한된 Focus 이동.
- 강조: 현재 목표 대상과 이상 징후.
- 최초 3초: 장소명, 목표, Player 위치.

## F. 구성요소

| 요소 | 역할 | 표시 | 숨김 | 입력 | 우선 |
|---|---|---|---|---|---|
| Background | 장소 정체성 | 항상 | 없음 | 없음 | 3 |
| Variant Layers | 수업·축제·손상 | 조건 충족 | 미충족 | 없음 | 2 |
| Player SD | 조작 위치 | 항상 | Cutscene 후보 | 이동 | 1 |
| Companion SD | 동행·반응 | 상태 허용 | 특별 연출 | 없음 | 2 |
| NPC | 상호작용 | 배치 조건 | Flag | 접근·Click | 1 |
| Hotspot | 관찰 대상 | active | 완료·잠김 | Interact | 1 |
| Objective | 목표 | 진행 중 | Dialogue 등에서 축약 | 없음 | 1 |
| Interaction Prompt | 가능한 행동 | Focus | Focus 없음 | Confirm | 1 |
| Resource Strip | Mana·상태 | 필요 Session | 대화·Menu | 없음 | 2 |
| Danger Marker | 위험 | 위험 상황 | 안전 | 없음 | 1 |
| Pause | 설정·중단 | Control 가능 | 전환 | Esc | 3 |

## G. 플레이어 입력

| 입력 | 조건 | 반응 | 피드백 | 제한 |
|---|---|---|---|---|
| WASD/Arrow | FIELD_CONTROL | 짧은 이동 | Walk·Target highlight | 장면 경계 |
| Mouse Click target | Click 이동 채택 시 | Focus·경로 후보 | Cursor·outline | 최종 방식 미정 |
| E/Enter | Focus target | Interaction request | Prompt pressed | 1회 token |
| Esc | 전환 아님 | Pause | Overlay | Dialogue 시작 중 차단 |
| Mobile Touch | 후행 | Tap target | outline | PC P0 제외 |

## H. 상황 진행 흐름

```text
World instantiate [자동]
→ Variant·NPC·Hotspot 적용 [자동]
→ Spawn·Camera 배치 [자동]
→ 장소·목표 Intro [자동, Skip 후보]
→ Field 입력 허용 [수동]
→ 이동·Focus [수동, 반복]
→ Interaction 요청 [수동]
→ 조건 검증 [자동]
→ Dialogue / Situation / Exit [자동 전환]
```

- 저장: World Ready 후, 중요 Session 시작 전.
- 실패: 누락 Resource·Marker·invalid interaction.

## I. 시스템 반응

| 행동 | 조건 | 즉시 | 데이터 | 장기 | 다음 |
|---|---|---|---|---|---|
| NPC 상호작용 | active·range | Player lock | interaction seen 후보 | Dialogue effect | DIALOGUE |
| Hotspot 관찰 | active | Focus camera | observed flag | Situation context | FIELD/INTRO |
| 완료 Hotspot 재접근 | repeatable false | 완료 문구 | 없음 | 중복 방지 | FIELD |
| 잠긴 대상 | condition false | 잠금 이유 | 없음 | 다음 조건 안내 | FIELD |
| Exit | next location valid | Transition | location change | Session 진행 | TRANSITION |
| 연속 입력 | request active | 무시 | 없음 | 없음 | 기존 전환 |

## J. 필요한 시스템

| 시스템 | 역할 | 입력 | 출력 | 연결 |
|---|---|---|---|---|
| Location Loader | Scene·Definition | location id | Field ready | Flow·Content |
| Variant Applier | Layer·NPC 상태 | flags | visual/world state | Field·Save |
| Player Movement | 짧은 이동 | input | position | Camera·Interaction |
| Interaction | Focus·조건 | actor/target | request/result | Dialogue·Situation |
| Companion Follow | 동행 | player trail | pose/reaction | Field·Dialogue |
| Objective | 목표 표시 | session state | view data | HUD |
| World State | object state | flags/result tags | applied layers | Return·Save |

## K. Godot 구현 구조

```text
FieldScene [Node2D]
├─ FieldController [Node]
├─ FieldStateMachine [Node]
├─ StageArt [Node2D]
│  ├─ Background [Sprite2D]
│  ├─ VariantLayers [Node2D]
│  └─ Foreground [Node2D]
├─ ActorLayer [Node2D, y_sort_enabled]
│  ├─ PlayerActor [CharacterBody2D]
│  ├─ CompanionActor [CharacterBody2D 또는 Node2D]
│  └─ NPCGroup [Node2D]
├─ InteractionLayer [Node2D]
│  ├─ HotspotGroup [Area2D]
│  └─ ExitGroup [Area2D]
├─ EffectLayer [Node2D]
├─ CameraRig [Node2D]
│  └─ Camera2D
└─ DebugMarkers [Node2D, debug only]
```

- Scene은 Location별 PackedScene 또는 공용 Scene+Art Definition 후보.
- 초기 Slice는 학교 공용 Scene 1개와 현장 Scene 1개로 제한.
- FieldController는 외부 Overlay를 직접 인스턴스하지 않고 Signal.

## L. Scene 분리 기준

- 장소별 World Scene.
- 대화·일정·작성은 Overlay.
- 수업·시험·축제는 별도 Scene이 아니라 Variant 상태 우선.
- SubViewport 불필요.

## M. Signal·상태

Signals:

```text
field_ready(location_id)
interaction_focused(interaction_id)
interaction_requested(interaction_id)
exit_requested(exit_id)
field_snapshot_requested()
```

States:

```text
ENTER → APPLYING_STATE → INTRO → CONTROL → INTERACTION_LOCK → EXIT
```

- CONTROL: 이동·Focus·Pause.
- INTERACTION_LOCK: 이동 금지, Cancel은 요청 유형별.
- 유지: location, spawn marker, object states, BGM key.

## N. 데이터 구조

| 데이터 | 필드 | 위치 | 변경 | Save |
|---|---|---|---|---|
| LocationDefinition | id, scene, variants, markers, audio | Resource | Content | 아니오 |
| VariantDefinition | flags, layer ids, npc set, light | Resource | Content | 아니오 |
| InteractionDefinition | id, kind, condition, payload, repeat | Resource | Content | 아니오 |
| FieldObjectState | object id, active, damage, completed | Session | WorldState | 예 |
| FieldReturnSnapshot | location, variant, spawn, camera, bgm | Session | Flow | 임시·Checkpoint |
| ObjectiveViewData | text, target id, warning | DTO | Presenter | 아니오 |

## O. 유지 데이터

- 반드시: location id, variant id, spawn marker, Story flags, one-shot, object states.
- 초기화: Focus target, prompt animation, transient FX.
- Save: completed interactions, location, spawn, world state.
- 세션 전용: camera interpolation progress.
- BGM: audio state key와 playback resume 후보; 정확한 sample position 저장은 P2.

## P. 연출

- 장소 Intro는 1~2초 후보, Skip 가능.
- 목표 대상은 짧은 Camera focus 또는 outline; 필수 정보를 Camera 이동만으로 전달 금지.
- Companion은 위험 징후에 반응하되 해결법을 표시하지 않음.
- Variant 전환은 layer fade, 장시간 Cutscene 금지.
- Footstep·ambient는 Audio Gate 후.

## Q. 애셋

| 애셋 | 용도 | 상태 | 우선 | 임시 |
|---|---|---|---|---|
| 학교 3/4 배경 | 수업·시험·자유·축제 | Layer 변형 | P0/P1 | Blockout 가능 |
| 현장 배경 | 온실·수로 | 손상·복구 | P0 | Blockout |
| Player SD | 이동·상호작용 | idle/walk/interact | P0 | Capsule·ColorRect |
| Companion SD | follow/react | idle/follow/alert | P0 | 단색 Sprite |
| NPC SD | 교수·동급생 | idle/react | P0 | Placeholder |
| Hotspot Icon | 상호작용 | normal/locked/done | P0 | Shape |
| Environment FX | 이상 징후 | pressure/leak/light thread | P1 | Line2D |

권장 화면 점유율: SD 캐릭터 높이 12~18% viewport 후보. Raster source는 최대 표시 크기의 2배 이상 후보이며 정확한 px는 Asset Spec에서 확정.

## R. 예외

- NPC·Companion 겹침: Collision layer와 visual offset 분리.
- Spawn Marker 누락: 명시적 fallback marker + 오류 로그.
- Hotspot 중복 ID: Content validation 실패.
- Dialogue 전투 동시 Trigger: Flow가 첫 accepted request 외 차단.
- 화면 resize 중 이동: Camera bounds·UI anchor 재계산.
- Save 직후 Variant mismatch: Load 시 flags→variant 재도출.
- 배경 Layer 누락: fallback layer와 debug warning.

## S. 완료 기준

- 첫 3초 내 장소·목표·Player 인지.
- Hotspot 가능·잠김·완료 구분.
- 짧은 이동이 상황 관찰을 방해하지 않음.
- 같은 학교 Scene이 최소 3 Variant로 전환.
- Field Snapshot round-trip.
- NPC·Companion 중복 생성 없음.

## T. 테스트

### 정상
- [ ] 학교 기본·시험·축제 Variant.
- [ ] NPC 대화 진입.
- [ ] Hotspot 관찰→Situation.

### 실패
- [ ] Marker·Layer·NPC Resource 누락.
- [ ] 잠긴 Hotspot 이유 표시.
- [ ] Interaction 연타 차단.

### 반복·Save
- [ ] 일회성 Hotspot 재실행 없음.
- [ ] Save/Load 위치·Variant·NPC 상태.
- [ ] Battle 복귀 Snapshot 일치.

### 화면·입력
- [ ] 16:9·ultrawide Camera·HUD.
- [ ] Keyboard·Mouse Focus 충돌 없음.
- [ ] Dialogue 전환 중 이동 차단.

---

# [SIT-GR-003] 교수·동급생·동반 정령 대화

## A. 상황 개요

- 발생 이유: 수업 설명, 시험 피드백, 자유일정 교류, 현장 관찰, 귀환 기록.
- 목표: 필요한 정보와 관점을 이해하고 선택·관계 반응 확인.
- 알고 있는 정보: 현재 장소·사건.
- 모르는 정보: 타인의 해석·조건·감정.
- 위험: 필수 정보가 표정·선택형 대화에만 숨겨짐, 대화 중 전투 Trigger.
- 보상: Context, 관계 반응, 다른 관점, 다음 목표.
- 감정: 교수의 책임감, 동급생과의 비교, 정령과의 애착.
- 핵심 선택: 응답·관점 선택. 정답 조합 직접 제공 금지.
- 다음: Field, Schedule, Situation Intro, Grimoire.

## B. 근거와 가정

- 확정: 같은 장소 배경, 반신 1명 기본·필요 시 2명, 동반 정령 반응 Slot.
- 실제 구현: 없음.
- 해석: Dialogue는 장소와 목표 연속성을 유지.
- 제안: Data-driven Dialogue Runner + Choice Effects.
- 가정: Slice 핵심 대화는 1~2 speaker portrait와 2~3 choices 이내.
- 사용자 결정 필요: 대화 속도·Auto·Skip·Voice 범위.

## C. 진입 조건

- 이전: Field Interaction, Session intro, Result, Schedule.
- Trigger: Dialogue ID와 Context.
- Flags: required/blocked/alternate lines.
- Player: relationship·schedule tags·result tags.
- World: active location background 유지.
- 진입 불가: Dialogue Resource·speaker fallback 모두 누락.
- 중복 방지: Dialogue active 동안 Battle·Interaction request queue 또는 차단.

## D. 화면 목적

1. 현재 화자와 핵심 문장.
2. 사건 대상·장소와의 관계.
3. 선택지가 만드는 관점·효과.
4. 대화 종료 후 바뀐 목표·관계·Flag.

## E. 예상 화면

```text
┌──────────────────────────────────────────────────────────────┐
│ [기존 학교·현장 배경 유지]                                  │
│   [교수 반신]                          [동급생 반신 후보]     │
│                    [정령 반응 Slot]                          │
├──────────────────────────────────────────────────────────────┤
│ 교수: 글자의 모양보다, 무엇을 흐르게 했는지 설명해 보렴.    │
│                                                              │
│  ▸ 힘을 한곳에 모았습니다.                                  │
│    전체 압력을 낮추려 했습니다.                              │
│    아직 잘 모르겠습니다.                                    │
└──────────────────────────────────────────────────────────────┘
```

- 첫 3초: 화자 이름·대사·현재 장소.
- 위험 정보가 있다면 Dialogue 위에도 icon+text 유지.

## F. 구성요소

| 요소 | 역할 | 표시 | 숨김 | 입력 | 우선 |
|---|---|---|---|---|---|
| Background | 장소 연속 | 항상 | 특수 Cutscene만 | 없음 | 3 |
| Portrait 1 | 주 화자 | line speaker | narration | 없음 | 2 |
| Portrait 2 | 대화 상대 | 필요 | 1명 대화 | 없음 | 3 |
| Companion Slot | 반응 | reaction line | 없음 | 없음 | 3 |
| Nameplate | 화자 | dialogue | narration label | 없음 | 1 |
| Text Box | 내용 | 항상 | 없음 | Advance | 1 |
| Choice List | 선택 | choice node | 일반 line | Click·keys | 1 |
| Objective Chip | 목표 유지 | 위험·중요 대화 | 일반 대화 | 없음 | 2 |
| History | 재열람 | 요청 | 닫힘 | key/button | 3 |
| Auto/Skip | 편의 | 허용 대화 | 중요 첫 설명 후보 | toggle | P1 |

## G. 입력

| 입력 | 조건 | 반응 | 피드백 | 제한 |
|---|---|---|---|---|
| Click/Enter | line complete | next line | cursor·sound | text reveal 중 first input은 reveal 완료 |
| Arrow/Mouse | choice active | focus | focus ring | 조건 잠김 제외 |
| Esc | skippable/choice | Back·Pause 정책 | prompt | 필수 결과 전 종료 금지 |
| History key | dialogue | log open | overlay | choice commit 중 금지 |
| Fast advance | seen line 후보 | speed up | icon | unseen critical line skip 정책 필요 |

## H. 흐름

```text
Dialogue request [자동]
→ Field control lock [자동]
→ Overlay 등장 [자동]
→ Line 진행 [입력/Auto]
→ 조건별 Choice [입력]
→ Effect를 임시 결과로 계산 [자동]
→ 마지막 Line [입력]
→ DialogueResult 확정 [자동]
→ Flag·관계·목표 적용 [자동]
→ Overlay 해제·Field 복귀 [자동]
```

- Save: Dialogue 시작 전 Checkpoint 또는 종료 후. 중간 Save는 P1.
- 실패: Resource 누락·invalid choice effect.

## I. 시스템 반응

| 행동 | 조건 | 즉시 | 데이터 | 장기 | 다음 |
|---|---|---|---|---|---|
| Advance | line active | next/reveal | seen line | skip eligibility | DIALOGUE |
| Choice | condition true | selection lock | result effects pending | relation/flag | DIALOGUE |
| Locked choice | condition false | reason | 없음 | condition 안내 | DIALOGUE |
| Cancel | optional dialogue | confirm | 없음 | 없음 | FIELD |
| Critical missing portrait | fallback exists | silhouette/name | error log | asset backlog | DIALOGUE |
| Dialogue complete | valid result | fade | apply effects once | progression | FIELD/SITUATION |

## J. 시스템

| 시스템 | 역할 | 입력 | 출력 | 연결 |
|---|---|---|---|---|
| Dialogue Runner | line·choice 진행 | definition/context | DialogueResult | UI·Flags |
| Condition Evaluator | line·choice 조건 | SessionState | bool/reason | Dialogue·Schedule |
| Effect Applier | flag·relationship | result | state change | Objective·Save |
| Portrait Presenter | expression fallback | speaker state | texture/pose | UI |
| Text Presenter | reveal·localization | line | rendered text | Settings |
| Flow | lock·exit | request/result | state transition | Field |

## K. Godot 구조

```text
DialogueOverlay [Control]
├─ BackgroundDim [ColorRect, optional]
├─ PortraitLayer [Control]
│  ├─ LeftPortrait [TextureRect]
│  ├─ RightPortrait [TextureRect]
│  └─ CompanionReaction [TextureRect/AnimatedSprite2D]
├─ DialoguePanel [PanelContainer]
│  ├─ NameLabel
│  ├─ DialogueText [RichTextLabel]
│  ├─ ContinueIndicator
│  └─ ChoiceContainer [VBoxContainer]
├─ ObjectiveChip [Control]
├─ HistoryOverlay [Control]
└─ DialogueController [Node]
```

- Data: DialogueDefinition injected.
- UI는 Effect 적용 직접 금지; DialogueResult 반환.
- 재사용: 모든 필드·전투 전후 대화.

## L. 분리 기준

- CanvasLayer Overlay 추천.
- Field Scene 유지.
- 별도 Cutscene Scene은 복잡한 연출이 실제 필요할 때만 P2.
- SubViewport 없음.

## M. Signal·상태

Signals:

```text
line_started(line_id)
line_completed(line_id)
choice_selected(choice_id)
dialogue_cancel_requested()
dialogue_finished(dialogue_result)
```

States:

```text
ENTER → REVEALING → WAITING_ADVANCE → CHOICE → APPLY_PENDING → EXIT
```

- REVEALING: Click은 reveal 완료.
- CHOICE: 선택·History·Pause; 이동 금지.
- APPLY_PENDING: 입력 차단, idempotency token.

## N. 데이터

| 데이터 | 필드 | 위치 | 변경 | Save |
|---|---|---|---|---|
| DialogueDefinition | id, lines, choices, conditions | Resource/JSON | Content | 아니오 |
| DialogueLine | speaker, expression, text key, reaction | nested Resource | Content | 아니오 |
| ChoiceDefinition | label, condition, effects, next | Resource | Content | 아니오 |
| DialogueContext | location, objective, result tags | runtime | Flow | 아니오 |
| DialogueResult | chosen ids, effects, next state | runtime | Runner | 적용 후 Save |
| SeenDialogueState | seen lines/dialogues | Session | Effect | 예 |
| RelationshipState | character id, value/tags | Session | Effect | 예 |

## O. 유지 데이터

- 유지: Field Snapshot, Camera, BGM, current objective, speaker states.
- 초기화: text reveal cursor, focus, temporary choice hover.
- Save: choices, effects, seen flag after completion.
- 세션 전용: pending effect token.
- 대화 중 전투 상태는 생성하지 않는다.

## P. 연출

- Portrait는 화자 변화 시 0.15~0.3초 강조 후보.
- Text 가독성을 위해 Background 대비 조절.
- 표정·Voice 없이도 Text·Name·Icon으로 의미 전달.
- 중요한 위험 대화 중 Objective Chip 유지.
- 정령 반응은 짧고 정답 힌트 도형 금지.

## Q. 애셋

| 애셋 | 용도 | 상태 | 우선 | 임시 |
|---|---|---|---|---|
| 교수 반신 | 수업·평가 | 기본/긍정/엄정 | P0 | silhouette |
| 동급생 반신 | 비교·관계 | 기본/자신/당황 | P0 | silhouette |
| 주인공 반신 | 선택 반응 후보 | 소수 | P1 | 미표시 가능 |
| Companion 반응 | 감정 연결 | idle/alert/pleased | P0 | icon |
| Dialogue Panel Theme | text | normal/choice/warning | P0 | default panel |
| SFX | advance/choice | 2~3종 | P1 | 무음 |

반신 source는 1080p 기준 화면 높이 70~100%를 커버할 수 있는 2배 source 후보. 정확한 px는 Asset Spec.

## R. 예외

- Dialogue 중 Battle Trigger: Flow queue 또는 명시적 차단.
- 빠른 Click: reveal와 advance를 한 프레임에 동시에 처리 금지.
- Choice 조건이 표시 후 변경: Commit 시 재검증.
- Speaker Resource 누락: name+silhouette fallback.
- Localization overflow: Scroll/auto size·font scale test.
- Save 종료 직전: Effect token으로 중복 적용 방지.
- Audio line 중복: line id 기반 stop/crossfade.

## S. 완료 기준

- 화자·대사·Choice를 즉시 식별.
- 필수 정보가 표정·Voice에만 의존하지 않음.
- 조건 잠김 이유 표시.
- Choice Effect 1회만 적용.
- Dialogue 종료 후 목표·Field 입력 정상 복원.
- 긴 한국어 Text와 해상도 안전.

## T. 테스트

### 정상
- [ ] 1인·2인·정령 반응 대화.
- [ ] 조건 Choice와 다음 상태.
- [ ] 수업→Situation 전환.

### 실패
- [ ] Portrait·Text key·next node 누락.
- [ ] Choice 조건 Commit 시 변경.
- [ ] Dialogue 중 외부 Trigger.

### 반복·Save
- [ ] 일회성 대화 재실행 없음.
- [ ] Choice Effect 중복 없음.
- [ ] Save/Load 후 seen 상태.

### 화면·입력
- [ ] Text size·UI scale.
- [ ] Mouse·Keyboard Focus.
- [ ] 빠른 Click reveal/advance 분리.
