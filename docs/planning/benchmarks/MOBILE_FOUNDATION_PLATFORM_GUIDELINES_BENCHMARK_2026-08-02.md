# Mobile Foundation 플랫폼 가이드라인 벤치마크 — 2026-08-02

```yaml
benchmark_id: GR-BENCH-MOBILE-FOUNDATION-20260802-01
scope: STATE_PERSISTENCE / TOUCH_TARGET / SAFE_AREA / LANDSCAPE_GAME_CONTROLS
source_policy: PRIMARY_OFFICIAL_SOURCES_ONLY
project_status: PLANNING_ONLY
runtime_validation: NOT_RUN
```

## 1. 목적

GRIMOIRE의 Mobile Foundation 세부값을 관습이나 기억으로 확정하지 않고 Android·Apple·Godot 공식 문서의 현재 지침과 비교한다.

이 벤치마크는 프로젝트 방향을 대신 결정하지 않는다. 공식 플랫폼 최소선과 엔진 기능을 확인하고, 프로젝트 고유 시험값과 사용자 Decision을 분리한다.

## 2. 공식 근거

### Android — 상태 저장

- 공식 문서: [Save UI states](https://developer.android.com/topic/libraries/architecture/saving-states)
- 화면을 벗어나거나 프로세스가 시스템에 의해 종료된 후에도 사용자가 상태 복원을 기대한다.
- 메모리 상태, Saved State, 로컬 영속 저장은 수명과 용도가 다르다.
- 장기 진행 데이터와 복잡한 앱 데이터는 로컬 영속 저장이 필요하며 Saved State만으로 대체하지 않는다.
- Saved State에는 복원에 필요한 작은 식별자·단순 상태만 두고 대형 데이터·복잡한 직렬화를 피한다.

프로젝트 반영:

- 입력 중 임시 획, 복구 가능한 Session Snapshot, 영속 진행·Transaction을 분리한다.
- OS background callback만 믿지 않고 Commit·Result·Anchor 발생 시점에 영속 기록한다.
- Snapshot에는 Texture·대형 로그 대신 ID와 최소 재구성 데이터를 저장한다.

### Android — Touch target

- 공식 문서: [Make apps more accessible](https://developer.android.com/guide/topics/ui/accessibility/views/apps-views)
- Android의 권장 Touch target은 `48dp × 48dp`이며 시각 요소가 작더라도 Padding으로 실제 Hit 영역을 확보할 수 있다.

프로젝트 반영:

- Android 최소 Hit target은 48dp를 하한으로 둔다.
- Glyph·Icon의 시각 크기와 실제 Hit 영역을 분리한다.
- 직접 작성 Canvas 경계의 인접 버튼은 Hit 영역이 겹치지 않게 한다.

### Apple — Game controls·접근성

- 공식 문서: [Game controls](https://developer.apple.com/design/human-interface-guidelines/game-controls)
- 공식 문서: [Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility)
- Landscape 게임에서는 기기 경계와 Safe Area, Home indicator, Dynamic Island와의 충돌을 피하고 자주 쓰는 조작을 엄지 도달 영역에 둔다.
- 자주 사용하는 조작은 최소 `44pt × 44pt`를 권장한다.
- 색 외에 가시적 상태와 Press feedback을 제공한다.

프로젝트 반영:

- iOS 최소 Hit target은 44pt를 하한으로 둔다.
- `[구현]`, Undo, 후보 확정처럼 빈도가 높거나 치명적인 조작은 프로젝트 공통 시험값 48 UI unit 이상을 우선한다.
- System indicator·cutout과 겹치는 위치에 핵심 버튼·Timer·확정 행동을 두지 않는다.

### Godot — Safe Area·Cutout

- 공식 문서: [DisplayServer](https://docs.godotengine.org/en/stable/classes/class_displayserver.html)
- `DisplayServer.get_display_safe_area()`는 상호작용 Control을 표시할 수 있는 가려지지 않은 영역을 반환한다.
- `DisplayServer.get_display_cutouts()`로 Cutout 영역을 조회할 수 있다.
- Android·iOS에서 Orientation과 Safe Area 관련 기능을 제공한다.

프로젝트 반영:

- 고정 숫자 Margin만을 Safe Area 권위로 사용하지 않는다.
- Runtime Safe Area와 Cutout 값을 읽어 Root Safe Container를 계산하는 구현 계획을 후속 작성한다.
- 기존 PC 좌우 64·상하 48 Safe Frame은 역사 참고이며 Mobile Safe Area 대체값이 아니다.

## 3. 프로젝트 시험값과 공식 최소선 분리

| 항목 | 공식 최소·기능 | GRIMOIRE 초기 시험값 | 상태 |
|---|---|---|---|
| Android Hit target | 48dp | 48 UI unit 하한, 주요 행동 56 후보 | TEST_VALUE |
| iOS Hit target | 44pt | 공통 48 UI unit 하한, 주요 행동 56 후보 | TEST_VALUE |
| 인접 버튼 간격 | 플랫폼별 충분한 간격 요구 | 8~12 UI unit 후보 | TEST_VALUE |
| Safe Area | Runtime API·기기 System UI 고려 | Safe Root 밖 핵심 정보·행동 0개 | CONTRACT |
| Cutout | Runtime Cutout 조회 가능 | Cutout 겹침 핵심 Control 0개 | CONTRACT |
| 상태 복원 | Saved State와 영속 저장 역할 분리 | Buffer / Snapshot / Transaction / Progress 4계층 | PROJECT_CONTRACT |
| Landscape 엄지 도달 | 자주 쓰는 조작을 편한 위치에 배치 | 하단 좌·우 Action zone 후보 | TEST_VALUE |

UI unit은 Godot Logical coordinate에 바로 고정하는 최종 수치가 아니다. 플랫폼 Scale과 Viewport Stretch를 반영해 Android 48dp·iOS 44pt 하한을 실제 기기에서 충족하는지 측정한다.

## 4. 적대적 판정

### 채택

- 상태를 수명과 소유권에 따라 분리.
- 주요 진행은 로컬 영속 저장.
- 48dp Android·44pt iOS 최소 Hit target 준수.
- Safe Area·Cutout Runtime 값 사용.
- 핵심 행동을 System gesture·Home indicator·Cutout에서 분리.

### 수정 채택

- Apple의 일반 게임 Control 배치를 그대로 복사하지 않고 GRIMOIRE의 직접 작성 Canvas와 우측 Writing Panel에 맞게 조정.
- Android UI 상태 저장 API 이름을 Godot 프로젝트 구조에 직접 이식하지 않고 원칙만 도메인 계약으로 변환.

### 기각

- 16:9 고정 Margin만으로 모든 Mobile 기기 대응.
- 화면 방향 고정이 Safe Area 검증을 불필요하게 만든다는 가정.
- Saved State 하나에 전체 전투·획·Asset·기록을 직렬화.
- 공식 최소 Hit target을 시각 Icon 크기와 동일시.

## 5. 미확정

- Smartphone만 지원할지 Tablet까지 같은 Vertical Slice 범위로 포함할지.
- 지원 Aspect Matrix의 필수·Best-effort 경계.
- 최소 OS·최소 기기·Renderer·성능 목표.
- 실제 UI unit↔dp/pt 변환과 기기별 Scale.
- Touch target 48/56 후보의 조작성·화면 밀도 영향.

이 항목은 `GM-MOBILE-DEVICE-CLASS-01` 및 Mobile 기기 Matrix에서 확정한다.
