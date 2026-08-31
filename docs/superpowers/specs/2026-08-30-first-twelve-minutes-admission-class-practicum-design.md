# GRIMOIRE — 첫 12분: 입학식 · 첫 수업 · 첫 지도 실습 설계

> 상태: `DIRECTION_SCOPE_USER_APPROVED__SPEC_USER_REVIEW_REQUIRED`
>
> 설계일: 2026-08-30  
> 설계 범위: 입학식 90–120초 → 첫 수업 약 5분 → 첫 지도 실습 약 5분  
> 다음 단계: 본 문서의 사용자 검토 → 구현 계획 → 격리 worktree → 이미지 후보 일괄 제작·검토 → 런타임 구현

## 1. 결정 요약

플레이어의 첫 진입은 즉시 온실 사고로 시작하지 않는다. 먼저 짧은 **입학식**에서 이 학교가 마법을 "보여 주는" 곳이 아니라 **글자로 세계에 책임 있게 개입하는 법을 배우는 곳**임을 체감한다. 이어서 **첫 수업**에서 안전한 물길에 `FLOW`를 직접 새겨 첫 성공을 얻고, **첫 지도 실습**에서 온실의 작은 불안정 상황을 읽고 `FOCUS` 또는 `DISPERSE`라는 보조 글자를 더해, 두 대상 중 우선순위를 정하고 명시적으로 시전한다.

이 구성은 현재의 W6 Frostbloom decision-loop와 동일한 사건이 아니다. W6의 온실 묘목/구조물 위기는 뒤쪽의 더 큰 현장 판단 단위로 보존한다. 첫 지도 실습은 같은 핵심 문법을 가르치되, 실패가 파국이 되지 않는 작은 규모의 보호된 연습 상황으로 분리한다.

```text
입학식
  "이곳에서 당신은 무엇을 바꾸기 전에 먼저 읽는다."
       ↓
첫 수업
  직접 쓴 FLOW → 물길의 즉시 반응 → 글자의 의미 관찰
       ↓
첫 지도 실습
  FOCUS / DISPERSE 조합 → 상황 읽기 → 대상 선택 → Preview → 명시 시전
       ↓
첫 복기
  결과와 남은 대가 확인 → 다음 수업/현장으로 이어지는 약속
```

플레이어가 처음으로 배우는 표면 흐름은 변하지 않는다.

```text
글자 → 주문 → 대상 → 시전
```

내부적으로는 `FIVE_POINT_STAR`의 중심 글자 하나와 0–5개의 보조 글자를 쓰며, 대상 지정은 Preview 뒤에 오고, 자원 소비는 단 한 번의 명시 시전에만 일어난다.

## 2. 승인 및 근거 경계

### 사용자 승인으로 확정된 방향

| 항목 | 확정 방향 |
| --- | --- |
| 장기 콘텐츠 흐름 | 수업 → 실습 → 전투 → 축제까지 이어지는 게임을 목표로 한다. |
| 온실/묘목의 위치 | 메인 줄거리 자체가 아니라 **첫 번째 실습 사건**이다. |
| 시각 방향 | 책에서 글자가 과하게 퍼지는 연출 대신, 허공에 직접 글자를 새기는 마법을 사용한다. |
| UI 방향 | 좌측 하단·우측의 비어 있는 장식 창은 제거한다. 기능이 없는 빈 프레임을 두지 않는다. |
| 입학식 | 첫 수업 전에 별도의 입학식을 둔다. |
| 본 단위 시작 | 입학식 → 첫 수업 → 첫 지도 실습 구조의 준비·제작을 진행한다. |

### 이 설계가 아직 확정하지 않는 것

- 학생, 교사, 학교의 고유 이름과 확정 대사 전문
- 영구 관계도·기숙사·성향·파벌을 바꾸는 입학식 선택
- 실전 전투와 축제의 실제 구현 순서 및 전투 규칙 세부
- 런타임에 쓸 신규 비트맵 자산의 최종 잠금
- 사람·실기기·성능·접근성·내보내기·전체 vertical slice PASS

따라서 입학식은 서사적 약속을 주되, 아직 확정되지 않은 캐릭터 설정을 잠그거나 첫 수업의 직접 입력을 지연시키지 않는다.

## 3. 현재 구현 및 정본과의 관계

### 유지·재사용할 현재 기반

| 현재 자산/구성 | 처분 | 이유 |
| --- | --- | --- |
| `GlyphInputScreen` | `REUSE` | 직접 글자를 쓰고 검증하는 현재 입력 기반을 그대로 쓴다. |
| `CircuitPlacementScreen` | `ADAPT` | 첫 지도 실습에 맞는 최소 회로 안내와 Preview를 제공한다. |
| `SpellUseScreen` | `ADAPT` | 대상 선택을 세로 목록만으로 끝내지 않고, 장면 안의 두 개 상황 대상으로 보강한다. |
| `SpellWorkflowCoordinator`와 주문/시전 거래 규칙 | `REUSE` | 정확히 한 번의 명시 Commit, Preview 후 대상, 소비 경계라는 핵심 안전 규칙을 보존한다. |
| W6 `FROST_SEEDLINGS` / `GREENHOUSE_STRUCTURE` context | `RETAIN_SEPARATELY` | W6의 구현·검증 기준을 훼손하지 않는다. 첫 지도 실습에 그대로 재사용하지 않는다. |
| 기존 밝은 온실/전투 온실 배경 및 온실 정령 | `LATER_SLICE_REUSE_CANDIDATE` | 첫 실습의 섬세한 상황 읽기와 화면 정보 구조가 다르므로 억지로 첫 장면에 투입하지 않는다. |

### 새로 만들 최소 단위

```text
FirstSessionRoot
 ├─ AdmissionCeremonyScreen
 ├─ FirstClassScreen
 ├─ FirstPracticumSituationLayer
 │   ├─ SeedlingTarget
 │   └─ GreenhouseSupportTarget
 ├─ Existing spell workflow components
 │   ├─ GlyphInputScreen
 │   ├─ CircuitPlacementScreen
 │   └─ SpellUseScreen (scene-target adapter)
 └─ FirstSessionResultScreen
```

첫 단위의 데이터와 상태는 W6에서 분리한 `FirstPracticumContext`가 소유한다. 이 경계는 "첫 실습의 부드러운 학습"과 "W6의 더 무거운 현장 판단"이 서로의 밸런스·테스트·기록을 침범하지 않게 한다.

## 4. 플레이어 경험: 12분 흐름

### 4.1 입학식 — 90–120초

**플레이어 가치:** 왜 글자를 써야 하는지와, 여기서 마법은 책임을 수반한다는 감각을 얻는다.

| 박자 | 플레이어가 보는 것 | 플레이어가 하는 것 | 시스템 결과 |
| --- | --- | --- | --- |
| 도착 | 글자·주문 흔적이 없는 따뜻한 입학 홀 | 시점을 넘기거나 단일 "시작" 행동 | 배경과 live UI의 역할을 분리해 입력 안전성 확인 |
| 선언 | 교수/안내자의 짧은 선언: 먼저 읽고, 고르고, 쓴다 | 한 번의 확인 | 영구 스탯·관계·글자 보상 없음 |
| 빈 기록 | 빈 페이지/허공의 작은 빛 자리가 열린다 | "첫 수업으로" 진행 | 다음 장면에서 첫 직접 입력이 기다린다는 약속 |

**금지:** 자동으로 주문을 부여하지 않는다. 입학식에서 플레이어에게 `FLOW`를 대신 써 주지 않는다. 확정되지 않은 등장인물의 장기 관계 선택, 파벌 선택, 성향 검사, 튜토리얼 퀴즈를 넣지 않는다.

### 4.2 첫 수업 — 약 5분

**학습 목표:** 직접 쓴 글자가 현실의 한 가지 성질을 부드럽게 바꾼다는 사실을 이해한다.

| 단계 | 플레이어 행동 | 즉시 피드백 | 배우는 것 |
| --- | --- | --- | --- |
| 관찰 | 얕은 수로와 멈춘 잎을 본다 | 물·빛·잉크 흔적의 낮은 강도 반응 | 마법 전에 상황을 읽는다. |
| 작성 | 화면 또는 허공에 `FLOW`를 직접 쓴다 | 획이 글로 판정되고 파란 잉크 흔적이 정돈된다 | 글자는 수집 아이템이 아니라 직접 쓰는 표현이다. |
| 확인 | 안전한 수로에 `FLOW` Preview를 본다 | 작은 물길이 이어지고 잎이 움직인다 | 주문은 가시적인 결과를 Preview할 수 있다. |
| 복기 | 짧은 관찰 피드백을 읽는다 | 결과와 한계가 함께 표시된다 | 한 글자는 만능이 아니다. |

첫 수업은 전투·위험 수치·강제 실패를 넣지 않는다. 실패한 필기는 재시도 가능하며, 시스템은 실제 판정 사유를 숨기지 않는다.

### 4.3 첫 지도 실습 — 약 5분

**학습 목표:** 같은 중심 글자라도 보조 글자와 대상의 우선순위에 따라 결과와 남는 대가가 달라짐을 배운다.

#### 상황

수업 직후 작은 온실 구획에서, 한쪽에는 서리로 잎맥이 굳기 시작한 묘목이 있고 다른 쪽에는 낮은 균열이 생긴 지지대/등불 장치가 있다. 둘 다 즉시 파국은 아니며, 하나를 먼저 안정시키면 다른 하나는 완전히 해결되지 않은 채 관찰 기록으로 남는다.

#### 조합과 trade-off

| 구성 | 강점 | 남는 대가 | 유효성 |
| --- | --- | --- | --- |
| `FLOW` 중심 + `FOCUS` | 선택한 묘목 또는 지지대의 한 지점을 또렷하게 안정시킨다. | 다른 대상의 불안정은 더 넓게 남는다. | 유효한 선택 |
| `FLOW` 중심 + `DISPERSE` | 낮은 강도의 흐름을 넓게 퍼뜨려 두 대상의 급한 흔들림을 낮춘다. | 선택한 한 지점의 회복은 약하고, 후속 관찰이 필요하다. | 유효한 선택 |
| 중심 `FLOW`만 사용 | 최소한의 현장 안정화를 시도한다. | 시간이 더 들고 실습 평가의 관찰 항목이 늘어난다. | 유효한 학습 선택 |

어느 선택도 "정답"이나 숨은 최고 경로가 아니다. 결과 화면은 선택한 대상, 사용한 보조 글자, 실제로 안정된 부분, 아직 남은 관찰점을 각각 기록한다.

#### 실습 흐름

```text
상황 읽기
  → FLOW 중심 글자 확인
  → FOCUS / DISPERSE / 보조 글자 없음 중 선택
  → 작은 FIVE_POINT_STAR Preview
  → 묘목 또는 지지대 선택
  → 최종 성공률·Mana·위험 Preview
  → "시전"을 한 번 명시적으로 누름
  → 결과·남은 관찰점·복기
```

`시전` 전에는 Mana나 글자 재고를 소비하지 않으며, 취소·뒤로 가기는 거래를 롤백한다. 대상은 Preview 뒤에만 선택 가능하고, 선택·Commit은 자동으로 발생하지 않는다.

## 5. 화면 및 입력 구조

### 5.1 고정 16:9 Landscape 계층

```text
FirstSessionRoot (Control, 1280×720 기준)
 ├─ EnvironmentBackground (TextureRect; MOUSE_FILTER_IGNORE; 글자·주문 흔적이 없는 환경 원화)
 ├─ SituationLayer (Control; z-order는 배경보다 위, UI보다 아래)
 │   ├─ direct-world targets (Button/TextureButton or focusable Control)
 │   └─ object-only normal state (마법·선택 표식 없음)
 ├─ MagicWritingOverlay (Control; MOUSE_FILTER_IGNORE; 필요할 때만 표시)
 │   ├─ live direct-input stroke renderer
 │   └─ optional non-semantic transparent glyph accent
 ├─ StoryAndInstructionLayer (live text, portrait-free by default)
 ├─ SpellWorkflowLayer (current reusable workflow controls)
 ├─ PreviewAndCommitLayer (final facts and explicit Cast)
 ├─ ResultLayer
 └─ AccessibilityAndDebugLayer (not player-facing in release)
```

새 배경·장식 레이어는 모두 `MOUSE_FILTER_IGNORE`로 두어 실제 조작 Control의 터치/클릭을 막지 않는다. `z_index`는 시각 그리기 순서일 뿐 입력 순서를 보장하지 않으므로, 대상 Control의 hit area와 실제 입력 흐름을 자동 테스트와 런타임에서 별도로 검증한다. [Godot Control 문서](https://docs.godotengine.org/en/stable/classes/class_control.html), [CanvasItem 문서](https://docs.godotengine.org/en/stable/classes/class_canvasitem.html)

### 5.2 비어 있는 프레임을 없애는 규칙

- 좌측 하단과 우측에는 장식용 빈 창을 만들지 않는다.
- live 정보가 있을 때만 역할이 명확한 카드/패널을 표시한다: 현재 글자, 현재 주문, 대상 설명, Preview, 결과.
- 장면의 여백은 인물·환경·직접 쓴 마법 글자가 숨 쉴 수 있는 공간으로 남긴다.
- 기능적 한국어 문구, 수치, 버튼 라벨은 이미지에 굽지 않고 Godot UI에서 표시한다.

### 5.3 글자 연출

- 책에서 글자가 대량으로 퍼져 나오는 연출을 사용하지 않는다.
- 배경과 대상 원화에는 글자, 주문 궤적, 룬, 청색/청자색 마법 표식을 전혀 굽지 않는다. 마법 글자는 `MagicWritingOverlay`에서만 필요할 때 별도로 합성한다.
- 손가락/펜의 궤적을 따라 **허공에 직접 그려진 청색–청자색의 짧은 획**이 남고, 판정 후에만 live UI가 실제 인식된 글자/주문 의미를 정돈해 표시한다. 투명 bitmap accent는 추상 획 질감만 제공하며 `FLOW` 같은 의미를 대신하지 않는다.
- 입학식과 첫 수업의 관찰 idle 상태는 overlay를 숨긴다. 첫 수업의 직접 입력, 글자 판정, 첫 실습 Preview/결과에서만 낮은 강도로 표시하며, 작은 회로도 live workflow가 소유한다.
- 저감 모션 설정에서는 획의 이동을 짧은 fade 또는 즉시 정지 상태로 바꾼다.

## 6. 데이터·코드 경계

### 6.0 세 가지 구현 접근 비교와 채택안

| 접근 | 장점 | 치명적 비용 | 판정 |
| --- | --- | --- | --- |
| A. 현재 `SpellWorkflowProductRoot`에 입학식·수업·첫 실습을 직접 누적 | 가장 적은 신규 scene 수 | W6의 `HEAT` bootstrap과 Frostbloom context가 첫 12분과 섞이고, 이후 수업/축제까지 한 root에 누적된다. | `REJECT` |
| B. 첫 12분 전용 root가 기존 workflow를 복사 | W6 regression 격리가 쉬워 보인다. | 소비·Preview·명시 Commit 규칙이 두 구현으로 갈라져 장기적으로 규칙 drift와 중복 테스트가 생긴다. | `REJECT` |
| C. 첫 세션 shell + 공유 workflow core + 세션별 context | 입학식/수업은 독립적으로 확장하고, 핵심 거래 규칙과 공통 screens는 하나로 유지한다. | 최초에 얇은 adapter/config 경계와 회귀 테스트가 필요하다. | `ADOPT` |

채택안 C에서 새 `FirstSessionRoot`는 앞으로의 "처음 N분"을 소유하는 제품 시작 화면이 된다. 현재 `SpellWorkflowProductRoot`는 W6의 독립적인 개발·회귀 진입점으로 보존한다. 공유 core를 과도하게 일반화하지 않으며, 첫 세션과 W6에서 실제로 공통인 글자/회로/Preview/Commit 거래만 추출·재사용한다. 이 원칙은 수업, 실습, 전투, 축제의 순서를 한 root에 쌓아 올리는 대신, 각각의 상황은 별도 context로 확장할 수 있게 한다.

실제 main scene 전환은 첫 세션의 scene load와 W6 회귀 테스트가 모두 통과한 뒤에만 수행한다. 전환 후에도 개발자가 W6 scene을 직접 실행할 수 있는 명시적 entry와 문서 링크를 유지한다.

### 6.1 권장 책임 분리

| 구성 | 책임 | W6 보호 방식 |
| --- | --- | --- |
| `FirstSessionRoot` | 전체 순서, 입학식과 수업의 전환, 복기 종료 | W6 Product Root를 시작 화면으로 바꾸지 않는다. |
| `AdmissionCeremonyScreen` | 90–120초의 비소비/비전투 진입 | 주문 재고·관계·스탯을 변경하지 않는다. |
| `FirstClassScreen` | `FLOW` 직접 입력과 안전한 관찰 반응 | W6의 `HEAT` 초기 bootstrap을 수정하지 않는다. |
| `FirstPracticumContext` | 이 실습만의 대상, 상태, 결과/대가 | W6 context/resource를 참조·변형하지 않는다. |
| `FirstPracticumSituationLayer` | 장면 안 대상의 상태/선택 표현 | 기존 `SpellUseScreen`의 대상 거래는 유지하고, UI 어댑터로 연결한다. |
| 기존 workflow core | 글자→주문→대상→시전 거래 | 이미 검증된 소비·Commit invariants를 재구현하지 않는다. |

### 6.2 추천 데이터 모양

```gdscript
class_name FirstPracticumContext
extends Resource

@export var context_id: StringName = &"FIRST_PRACTICUM_GREENHOUSE_01"
@export var main_glyph: StringName = &"FLOW"
@export var allowed_auxiliary_glyphs: Array[StringName] = [&"FOCUS", &"DISPERSE"]
@export var targets: Array[FirstPracticumTarget]
@export var result_rules: Array[FirstPracticumResultRule]
```

실제 파일/클래스명은 현재 저장소의 Godot naming convention과 scene authoring 방식에 맞춰 구현 계획 단계에서 확정한다. 위 표기는 책임 경계를 설명하기 위한 형태이며, 현 시점의 새 런타임 API 확정은 아니다.

### 6.3 상태 전이와 롤백

```text
ADMISSION
  → CLASS_OBSERVE
  → CLASS_WRITE_FLOW
  → CLASS_OBSERVE_RESULT
  → PRACTICUM_READ
  → PRACTICUM_BUILD
  → PRACTICUM_TARGET
  → PRACTICUM_PREVIEW
  → PRACTICUM_COMMITTED
  → PRACTICUM_RESULT

PRACTICUM_BUILD / TARGET / PREVIEW --취소 또는 뒤로--> PRACTICUM_READ
PRACTICUM_PREVIEW --유효하지 않은 transaction--> 오류 원인 표시, 자원 변화 없음
PRACTICUM_COMMITTED --반복 입력--> 무시, transaction 1회성 유지
```

입학식과 첫 수업의 진행 상태는 세션 중에는 저장할 수 있으나, 영구 progress 저장은 기존 저장 체계의 실제 가능성과 migration 계획을 확인한 뒤에만 연결한다. 첫 구현 단위는 저장이 없더라도 처음부터 끝까지 안전하게 완주할 수 있어야 한다. 앱이 중단되면 재개 가능한 체크포인트가 없는 첫 버전에서는, 시작 시 입학식부터 안전하게 재시작하는 동작을 명시한다. 저장된 진행도처럼 보이게 표시하지 않는다.

## 7. 이미지 후보 묶음 — 생성 전 브리프

다음 이미지는 현재의 **계획용 참고 이미지와 분리된 런타임 후보**다. 사용자 검토 후 한 번에 생성하고, 후보 묶음 전체의 품질 검토·승인 뒤에만 `assets/art/`와 manifest에 정식 등록한다.

| 후보 ID | 계획 파일명 | 규격/투명도 | 첫 consumer | 화면에서의 역할 |
| --- | --- | --- | --- | --- |
| `FS-IMG-ADMISSION-002` | `bg_admission_hall_ceremony` | 16:9, 불투명 | `AdmissionCeremonyScreen/EnvironmentBackground` | 글자·주문 흔적이 없는 따뜻한 입학 홀 |
| `FS-IMG-CLASS-002` | `bg_classroom_water_channel` | 16:9, 불투명 | `FirstClassScreen/EnvironmentBackground` | 글자·주문 흔적이 없는 수로·관찰용 잎이 있는 교실 |
| `FS-IMG-TARGET-001-R2` | `target_frost_seedlings_unstable` | 1:1, 투명 | `FirstPracticumSituationLayer/SeedlingTarget` | 자연 서리만 남긴 낮은 위험도의 묘목 |
| `FS-IMG-TARGET-002-R2` | `target_greenhouse_support_unstable` | 2:3, 투명 | `FirstPracticumSituationLayer/SupportTarget` | 물리적 마모만 남긴 온실 지지대·등불 |
| `FS-IMG-GLYPH-OVERLAY-001` | `fx_direct_air_glyph_overlay` | 3:2, 투명 | `MagicWritingOverlay/DirectAirGlyphAccent` | 비의미적 직접 필기 accent; 필요할 때만 별도 합성 |

공통 Art Direction:

- `Soft Storybook Cel 2D Hybrid`, 따뜻한 견습자 중심의 마법 학교, 16:9 고정 Landscape 화면 구성
- 해군색·황동색·온기 있는 목재·식물의 녹색을 기반으로, 직접 쓴 마법은 배경/대상과 분리된 투명 `MagicWritingOverlay`의 청색–청자색 계열
- 고대 책이 글자를 분출하는 연출, 공포/호러, 3D 탐험, 과도한 UI 프레임, 장식용 숫자·문구, baked functional text 금지
- 사람은 필요할 때만 주변 인물 실루엣 수준으로 두고, 화면의 조작/문구를 가리지 않는다

R2 source candidate 묶음은 `assets/manifests/first_session_02_runtime_candidate_layer_separation_02.json`에 `GENERATED_CANDIDATE_IN_REVIEW`로 기록되어 있다. 사용자 최종 확정은 `USER_APPROVED`, manifest 정식 등록은 `CANON_REGISTERED`, 실제 scene 연결은 `IMPLEMENTED`, 실행 화면 증거는 `RUNTIME_VERIFIED`로 계속 분리 기록한다.

## 8. 구현 범위 및 비범위

### 이 단위에서 구현할 것

- 입학식 1개 화면과 안전한 다음 진행 동작
- 첫 수업에서 `FLOW`를 직접 쓰고 안전한 환경 반응을 관찰하는 흐름
- 첫 지도 실습의 `FLOW` 중심 + `FOCUS`/`DISPERSE`/없음 선택
- 두 개의 장면 내 대상 선택, 최종 Preview, 명시 `시전`, 결과·남은 관찰점
- W6 회귀 방지 자동 테스트와 첫 12분 상태 전이/거래 테스트
- 새 이미지 후보의 manifest/provenance/consumer 기록 및 사용 승인 후 scene 연결

### 이 단위에서 하지 않을 것

- 실전 전투, 축제, 수업 이후의 전체 캠페인 구현
- 3D 탐험/자유 이동/다중 적 wave
- 영구 관계·성향·기숙사·파벌 시스템
- 실제 녹음·음성 연기·음악 배포
- W6 Frostbloom의 context/resource/자동 검증 기대값을 첫 실습으로 대체

전투와 축제는 후속 콘텐츠 로드맵의 다음 실제 소비처로 유지한다. 이번 첫 12분 단위는 그 둘이 나중에 자연스럽게 연결될 수 있게, "관찰 → 선택 → 결과 책임" 문법만 세운다.

## 9. TDD 및 검증 설계

구현 전에 아래 실패 테스트를 먼저 추가한다. 새 기능을 보이게 만들기 위해 기존 W6 테스트의 기대값을 약화하거나 삭제하지 않는다.

| 순서 | 처음 실패해야 하는 검증 | 완료 조건 |
| --- | --- | --- |
| 1 | 입학식이 `FirstClassScreen`으로 전이하지 못함 | 단일 진행 행동 후 정확히 첫 수업 상태가 된다. |
| 2 | 첫 수업의 `FLOW` 직접 입력을 보존하지 못함 | 판정된 `FLOW`만 다음 준비 단계에 들어간다. |
| 3 | 실습이 W6 context를 참조/변형함 | `FirstPracticumContext`와 W6 context가 서로 독립이다. |
| 4 | Preview 이전 대상 선택 또는 Commit이 가능함 | 순서 위반은 거절되고 자원 변화가 없다. |
| 5 | `FOCUS`/`DISPERSE` 중 한쪽만 유효함 | 양쪽 모두 유효 결과와 서로 다른 남은 관찰점을 낸다. |
| 6 | Commit을 두 번 눌러도 두 번 소비됨 | 하나의 transaction은 정확히 한 번만 소비/결과 처리된다. |
| 7 | 장식 배경/베일이 실제 조작을 가로막음 | 배경은 입력을 막지 않고 대상·버튼의 pointer/touch가 작동한다. |
| 8 | 첫 실습 추가가 W6 Product Root를 깨뜨림 | 기존 W6 통합 테스트는 기대값 변경 없이 통과한다. |

실행 검증은 세 단계로 보고한다.

1. `MACHINE_VERIFIED`: parse, scene/resource load, GUT 또는 저장소 표준 자동 테스트, 입력/transaction 회귀 검사.
2. `RUNTIME_VERIFIED`: GRIMOIRE Godot editor 또는 headless 실행에서 실제 전환·대상 hit area·Preview·단일 Commit을 관찰한 증거.
3. `HUMAN_DEVICE_PERFORMANCE_ACCESSIBILITY`: 실제 플레이어, 목표 모바일 기기, 성능, 저감 모션/터치 접근성으로 별도 확인. 현 시점에는 `NOT_RUN`이다.

## 10. 수용 기준

다음 모두를 만족할 때만 이 단위를 "구현 완료"로 보고할 수 있다.

- 입학식에서 첫 직접 `FLOW` 입력까지, 정상 플레이 기준 5분 이내로 도달한다.
- 입학식은 스탯/관계/글자를 자동 지급하거나 장기 캐릭터 결정을 강요하지 않는다.
- 첫 수업은 `FLOW`를 플레이어가 직접 쓰며, 안전한 환경 반응을 눈에 보이게 돌려준다.
- 첫 지도 실습은 `FOCUS`, `DISPERSE`, 보조 없음 각각을 오류 없이 설명 가능하고, 숨은 정답이 없다.
- 대상 선택은 Preview 뒤에만 가능하고, `시전`은 플레이어가 한 번 명시적으로 실행한다.
- 자원 소비/결과 적용은 한 transaction에 정확히 한 번이다.
- 온실 묘목/지지대는 이 첫 실습의 작은 상황이며, W6 Frostbloom context의 값·문구·테스트와 분리된다.
- 좌측 하단/우측에 기능 없는 빈 프레임이 없고, 배경 및 장식은 입력을 막지 않는다.
- 기능 문구/버튼/수치는 live UI로만 표시한다. 이미지에는 기능적 텍스트를 굽지 않는다.
- 신규 이미지 후보는 일괄 검토·사용자 승인·manifest/provenance 등록을 거친 뒤에만 런타임에서 쓴다.
- 자동 검증과 실제 runtime 관찰을 구분해 기록하며, 아직 실행하지 않은 사람·기기·성능·접근성 검증을 PASS라고 쓰지 않는다.

## 11. 리스크와 대응

| 리스크 | 조기 신호 | 대응 |
| --- | --- | --- |
| 입학식이 튜토리얼을 늦춘다 | 첫 직접 입력 도달 시간이 5분을 넘는다 | 90–120초 상한, 단일 진행 동작, 영구 선택 제거 |
| 첫 실습이 W6를 덮어쓴다 | W6 test/resource 수정이 필요해 보인다 | 별도 context와 adapter, W6 test 기대값 동결 |
| "양쪽 모두 유효"가 말뿐이다 | 결과가 한 보조 글자를 항상 더 좋게 평가한다 | 결과 payload에 이득/남은 대가를 대칭적으로 기록하고 테스트 |
| 이미지가 UI를 가리거나 빈 장식 창을 되살린다 | hit area가 작아지거나 프레임이 내용 없이 남는다 | consumer별 safe area와 입력 테스트, live UI overlay 분리 |
| 생성 이미지가 확정 자산으로 오인된다 | manifest/scene이 후보를 바로 가리킨다 | 후보 경로와 canonical asset 경로 분리, 승인 전 scene 미연결 |
| 현장 UX가 자동 테스트만으로 확정된다 | 테스트 PASS만 있고 GRIMOIRE 실행 증거가 없다 | runtime/human/device evidence를 별도 gate로 유지 |

## 12. 다음 실행 순서

1. 사용자가 본 설계의 시간·흐름·첫 실습 trade-off를 검토한다.
2. 확정되면 구현 계획을 작성하고, 현재 dirty workspace를 건드리지 않는 격리 worktree를 만든다.
3. 배경/대상과 별도 투명 글자 오버레이로 분리한 R2 다섯 런타임 이미지 후보를 함께 검토한다.
4. 사용자 승인 후에만 후보를 정본 자산으로 등록하고 first-session scenes/data를 TDD 방식으로 구현한다.
5. W6 회귀, 자동 테스트, Godot runtime 관찰을 각각 독립적으로 검증한다.
6. 사람·모바일·성능·접근성 gate는 실제 환경에서 후속 실행한다.

이 순서는 "이미지 없이 빈 화면을 먼저 조립하지 않는다"는 사용자 요구와, 이미 동작하는 W6 foundation을 훼손하지 않는 장기 확장성을 함께 만족한다.
