# GRIMOIRE 상황별 화면·상태 아키텍처 벤치마킹

## 문서 상태

```yaml
benchmark_id: GR-BM-SITUATION-SCREEN-01
decision_id: GM-SITUATION-SCREEN-SPEC-01
scale: STANDARD
status: COMPLETE
source_policy: OFFICIAL_GODOT_PRIMARY_ONLY
implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

## 1. 결정 질문

> GRIMOIRE의 필드·대화·일정 선택·별도 전술 전투·마법 작성·결과·마도서 기록을 Godot 4.x에서 어떻게 분리해야 Scene 책임이 명확하고, 상태 유지·저장·테스트·후속 모바일 적응이 가능한가?

## 2. 프로젝트 제약

- PC 우선, Mobile 후속.
- 고정·장면 기반 3/4 필드.
- 같은 장소 배경 위 반신 대화.
- 별도 고정 3/4 전술 전투장.
- 전투 또는 필드 위 마법 작성 Overlay.
- 전투 결과를 원래 필드 상태에 반영.
- 구현 파일은 아직 존재하지 않음.
- Art Style, 내부 해상도, 감속 비율은 미확정.

## 3. 공식 Godot 근거

### 3.1 Scene 조직

Godot 공식 Scene Organization 가이드는 Scene을 단일 책임과 낮은 결합으로 설계하고, 하위 Scene이 외부 환경을 직접 알아야 하는 구조를 피하며, 상위 소유자가 관계와 의존성을 중재하도록 권장한다.

- Source: https://docs.godotengine.org/en/stable/tutorials/best_practices/scene_organization.html
- 적용: `GameFlowController`가 World Scene과 Overlay Scene의 관계를 중재한다.
- 배제: `BattleScene`이 직접 `FieldScene` 경로를 알고 로드하는 구조.

### 3.2 Main / World / GUI 분리

공식 가이드는 Main 아래 World와 GUI를 분리하고, 레벨 변경 시 World 자식을 교체하는 구조를 예시로 제시한다.

- 적용: `ApplicationRoot → WorldHost + UIHost`.
- 효과: Field와 Battle은 독립 실행·테스트 가능, UI와 전환·오디오는 유지 가능.

### 3.3 SceneTree Scene 교체

`change_scene_to_file()`과 `change_scene_to_packed()`는 간단하지만 현재 Scene 참조가 사라지고 전환이 프레임 경계에서 처리된다. 전환 직후 새 Scene에 접근할 수 없으며 기존 참조는 유효하지 않다.

- Sources:
  - https://docs.godotengine.org/en/stable/classes/class_scenetree.html
  - https://docs.godotengine.org/en/4.0/tutorials/scripting/scene_tree.html
- 적용: 전체 앱 Root를 교체하지 않고 `WorldHost` 자식만 명시적으로 교체한다.
- 보호: 전환 전 `FieldReturnSnapshot`을 생성하고 Node 참조를 저장하지 않는다.

### 3.4 Signal

Godot Signal은 객체가 서로 직접 참조하지 않고 사건에 반응하도록 해 결합을 낮춘다.

- Source: https://docs.godotengine.org/en/stable/classes/class_signal.html
- 적용: 하위 화면은 `battle_requested`, `spell_commit_requested`, `result_confirmed` 같은 의도 Signal만 방출한다.
- 보호: UI가 다음 Scene을 직접 로드하거나 도메인 결과를 직접 계산하지 않는다.

### 3.5 Resource

Resource는 Godot 데이터 컨테이너이며 중첩·저장·캐시·Inspector 편집이 가능하다.

- Sources:
  - https://docs.godotengine.org/en/stable/tutorials/scripting/resources.html
  - https://docs.godotengine.org/en/stable/classes/class_resource.html
- 적용: 장소, 상황, 대화, 글자, 조우, 보상, 화면 View Definition을 custom Resource로 관리한다.
- 보호: 런타임 상태와 정적 정의를 같은 Resource 인스턴스에서 직접 변경하지 않는다.

### 3.6 Autoload

Autoload는 Scene 교체 사이에 유지되는 전역 서비스에 적합하지만 모든 시스템을 전역화하면 결합과 상태 누수가 증가한다.

- Sources:
  - https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html
  - https://docs.godotengine.org/en/4.0/tutorials/best_practices/autoloads_versus_internal_nodes.html
- 적용: `ContentRegistry`, `SaveService`, `SettingsService`만 최소 후보.
- 배제: Battle, Dialogue, Spell, Session 전체를 각각 Autoload로 만드는 구조.

### 3.7 저장

공식 저장 가이드는 지속해야 할 객체와 필드를 먼저 식별하고, 저장 가능한 데이터만 직렬화하도록 안내한다.

- Source: https://docs.godotengine.org/en/stable/tutorials/io/saving_games.html
- 적용: ID, 수치, 태그, Spawn Marker, 결과 태그를 저장한다.
- 배제: NodePath, Object instance ID, Scene Node 참조 저장.

### 3.8 Pause·감속

Godot는 SceneTree pause와 Node Process Mode를 제공한다. 그러나 GRIMOIRE의 마법 작성은 완전 정지·감속·실시간이 미확정이므로 전역 pause에 고정하지 않는다.

- Source: https://docs.godotengine.org/en/stable/tutorials/scripting/pausing_games.html
- 적용: `WorldTimeController`가 Active World의 시뮬레이션 속도를 관리하고 Overlay UI는 독립 처리한다.
- 후보: 최종 검증에서 `PAUSE / SLOW / REALTIME` 정책 교체 가능.

### 3.9 UI와 해상도

Godot Control·Container·Anchor는 다양한 화면 크기에 대응하며, 공식 Multiple Resolutions 가이드는 하나의 기준 해상도와 확장 규칙을 권장한다.

- Sources:
  - https://docs.godotengine.org/en/stable/tutorials/rendering/multiple_resolutions.html
  - https://docs.godotengine.org/en/stable/tutorials/ui/gui_containers.html
  - https://docs.godotengine.org/en/stable/classes/class_control.html
- 적용: 16:9 Safe Frame 안에 핵심 UI를 두고 18:9~20:9는 좌우 World·배경 확장.
- 미확정: 정확한 base resolution은 `ASSET-SPEC-01`.

## 4. 접근법 비교

| 접근법 | 장점 | 위험 | 판정 |
|---|---|---|---|
| 모든 상태를 전체 Scene 교체 | 단순한 시작 | UI·오디오·복귀 상태 반복 복원, 참조 무효화 | REJECT_MAIN |
| 하나의 거대 Scene에서 표시/숨김 | 초기 전환 빠름 | 상태 얽힘, 테스트 어려움, Node 비대화 | REJECT |
| Persistent Root + World 교체 + Overlay | 책임 분리, 상태 유지, 독립 테스트 | Flow·Snapshot 계약 선행 필요 | ADOPT |
| 전투를 필드 위 Layer로 중첩 | 필드 연속성 쉬움 | 승인된 별도 전투장과 충돌, 입력·카메라 결합 | REJECT_FOR_GRIMOIRE |
| Field/Battle 별도 Scene + Snapshot 복귀 | 승인 구조 일치, 테스트성 높음 | Snapshot 누락 위험 | ADOPT_WITH_GUARDRAILS |

## 5. ADOPT / ADAPT / REJECT

### ADOPT

- 단일 Application Root.
- `WorldHost`와 `UIHost` 분리.
- Field와 Battle의 별도 PackedScene.
- Dialogue, Spell Composer, Result, Grimoire의 Overlay Scene.
- 상위 Flow Controller가 전환 중재.
- custom Resource 기반 정적 데이터.
- Signal 기반 하위 Scene 통신.
- ID 기반 Save Snapshot.

### ADAPT

- Autoload는 Content, Save, Settings만 최소 사용.
- Main Menu는 독립 전체 Scene보다 Application Root의 초기 UI 상태로 우선 설계.
- 마법 작성 시간은 전역 `Engine.time_scale` 고정보다 World Time Policy로 교체 가능하게 설계.
- Google Sheets는 저작·기획 Workspace, 런타임은 검증된 Resource/JSON Snapshot.

### REJECT

- UI가 마법 인식·문법·피해·보상 계산.
- 하위 Scene이 다음 Scene을 직접 로드.
- 모든 시스템을 Autoload로 구현.
- 모든 상태를 한 Scene에 영구 인스턴스화.
- 전투 종료 후 기존 Node 참조로 필드 복귀.
- 애니메이션 종료를 피해·비용 지급 권위로 사용.
- NodePath·Object ID를 세이브에 저장.
- SubViewport를 일반 UI 분리에 남용.

## 6. GRIMOIRE 적용 계약

```text
ApplicationRoot
├─ GameFlowController
├─ SessionState
├─ WorldHost
│  └─ FieldScene | BattleScene
├─ UIHost
│  └─ MainMenu | Dialogue | Schedule | Spell | Result | Grimoire | Pause
├─ TransitionLayer
└─ AudioDirector
```

전환 계약:

```text
하위 Scene Signal
→ GameFlowController 조건 검증
→ 입력 잠금
→ Snapshot 생성
→ World 또는 Overlay 전환
→ 상태 주입
→ 준비 완료 Signal
→ 입력 해제
```

## 7. 검증 항목

- Field와 Battle을 각각 독립 실행할 수 있는가.
- Overlay가 도메인 계산 없이 View Data만 표시하는가.
- Scene 전환 중 입력이 차단되는가.
- FieldReturnSnapshot으로 위치·NPC·환경·BGM 상태가 복원되는가.
- Save round-trip 후 동일 상태로 재진입하는가.
- 16:9와 초광폭에서 핵심 UI Safe Frame이 유지되는가.
- 마법 작성 시간 정책을 코드 대수술 없이 교체할 수 있는가.

## 8. 판정

```yaml
recommended_architecture: PERSISTENT_APPLICATION_ROOT_WORLD_SWAP_OVERLAY
benchmark_result: PASS
next: WRITE_USER_REVIEWABLE_SITUATION_SCREEN_SPEC
implementation_authority: NONE
```
