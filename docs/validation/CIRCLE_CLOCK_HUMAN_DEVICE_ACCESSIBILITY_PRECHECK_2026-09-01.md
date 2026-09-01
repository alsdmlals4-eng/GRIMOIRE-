# Circle / Clock Story Slice — Human, Device, Accessibility Precheck

> 이 문서는 현재 Circle / Clock 이야기 흐름을 실제 사람과 실제 모바일 기기에서 관찰하기 위한 실행 스크립트다. 자동 테스트·headless 실행·Godot editor 관찰은 이 문서를 준비하는 근거일 뿐, 사람·기기·접근성 PASS를 대신하지 않는다.

```yaml
validation_id: CIRCLE-CLOCK-VFY-01
decision_id: GM-CIRCLE-CLOCK-CARD-CORE-01
feature_id: FTR-CIRCLE-CLOCK-CARD-CORE-01
gate_id: CIRCLE_CLOCK_POST_TASK8_HUMAN_DEVICE_ACCESSIBILITY_PRECHECK
status: PREPARED_NOT_RUN
execution_owner: USER_OR_DESIGNATED_HUMAN_TESTER
runtime_entry: res://src/ui/front_door/story_front_door.tscn
flow_under_observation: Story Front Door -> AdmissionPrologue -> StoryEventRoot
automation_or_editor_observation_is_not_human_or_device_pass: true
do_not_modify_runtime_during_observation: true
separate_evidence_axes:
  - human_comprehension
  - mobile_device_touch
  - accessibility_assistive_technology
  - keyboard_or_controller_navigation
  - performance
  - export
  - full_vertical_slice
```

## 1. 관찰 목적과 현재 증거 상한

이 관찰은 “첫 기록을 시작한 사람이 입학식과 첫 사건을 거치며, 글자를 쓰고 서클을 미리 본 다음 스스로 대상과 시전을 선택하는가”를 확인한다. 특히 사건 시계가 단순한 장식 수치가 아니라 **목표와 위협을 함께 보여 주어 다음 행동을 고민하게 하는가**를 본다.

이미 확인된 editor/runtime 사실은 아래뿐이다.

| 항목 | 현재 사실 | 증거 상한 |
| --- | --- | --- |
| Story Front Door | 1280×720 Godot editor 실행에서 `새 기록 시작`, `이어하기`, `도감`, `설정`, `종료`를 확인했다. | EDITOR_RUNTIME_OBSERVED |
| 입학식 전환 | `새 기록 시작` → `AdmissionPrologue`의 `입학의 아침` → 첫 사건 handoff를 실행했다. | EDITOR_RUNTIME_OBSERVED |
| 첫 사건 | `StoryEventRoot`에서 `글자 새기기`, 서클 조합, Preview, 대상 지정, 시전, `서리 안정화 0/6`, `온실 균열 확산 0/4`를 확인했다. | EDITOR_RUNTIME_OBSERVED |
| 자동 계약 | 대상·시전 전의 disabled 상태, explicit commit, 시계 segment의 `accessibility_name`은 테스트가 다룬다. | AUTOMATED_CONTRACT |

위 네 항목은 실제 사람 또는 실제 기기 세션의 이해도·오입력·보조기술 동작·성능을 증명하지 않는다. 현 시점의 사람·모바일 기기·접근성·성능·export·full slice 상태는 모두 `NOT_RUN`이다.

## 2. 범위와 비범위

### 관찰 범위

```text
Story Front Door
  -> 새 기록 시작
AdmissionPrologue
  -> 입학의 아침 / 이야기 계속
StoryEventRoot
  -> 글자 새기기
  -> 후보 확인과 글자로 사용
  -> 서클 Preview
  -> 대상 지정
  -> 명시 시전
  -> 목표/위협 사건 시계와 결과 읽기
```

### 이번 관찰에서 바꾸지 않는 것

- 카드의 mana distribution, draw, mulligan, pass, field, combat, score 규칙. 카드 상세 룰은 `RULESET_PENDING`이며 `7/7/6`과 20 마력은 고정 수치가 아닌 예시다.
- 새 수업·실습·결투·축제 콘텐츠, 밸런스 수치, 보상, 전투 규칙, 이미지 production batch.
- legacy Star save의 변환·이동·삭제와 프로젝트 이름 변경.
- 관찰 중 source, scene, asset, copy의 즉석 수정. 발견은 원문으로 기록하고 별도 작업으로 고친다.

## 3. 시작 전 기록

관찰자는 세션마다 다음 값을 먼저 기록한다. 비어 있는 값은 추정으로 채우지 않고 `UNRECORDED`로 남긴다.

```yaml
session_id: UNASSIGNED
date_kst: UNASSIGNED
exact_git_revision: UNASSIGNED
build_or_export_identifier: UNASSIGNED
scene_entry: res://src/ui/front_door/story_front_door.tscn
platform: UNASSIGNED
device_model: UNASSIGNED
os_version: UNASSIGNED
physical_resolution: UNASSIGNED
orientation: LANDSCAPE_FIXED
input_modality: UNASSIGNED # touch / mouse / keyboard / controller / assistive input
text_scale_or_display_scale: UNASSIGNED
locale_and_font_state: UNASSIGNED
screen_reader_or_accessibility_service_state: UNASSIGNED
focus_or_controller_navigation: UNASSIGNED
runtime_errors_before_or_during: []
participant_context: UNASSIGNED
observer: UNASSIGNED
```

### 최소 실행 조합

| 세션 | 필요한 실제 환경 | 확인하려는 것 | 다른 축에 대한 한계 |
| --- | --- | --- | --- |
| A | Windows 또는 macOS, 키보드·마우스, 1280×720 이상 | 이야기 흐름의 첫 인상과 정보 이해 | 모바일·터치·보조기술 PASS가 아님 |
| B | 실제 Android 또는 iOS 기기, 가로 방향, 터치 | 버튼 누르기·글자 쓰기·정보 가독성 | 기기 하나로 모든 모바일 호환성 PASS가 아님 |
| C | 실제 기기의 사용 가능한 screen reader 또는 접근성 서비스, 키보드/컨트롤러가 가능하면 추가 | focus, accessible name, 순서, 상태 전달 | 서비스가 없는 환경에서는 `BLOCKED_UNVERIFIED`로 기록 |

## 4. 비유도식 관찰 흐름

모더레이터는 답을 설명하거나 “이것이 정답”이라고 말하지 않는다. 참가자가 막히면 화면을 고치지 말고, 무엇을 기대했는지 먼저 기록한다.

| 순간 | 참가자에게 말할 문장 | 관찰할 사실 | 원문 증거 |
| --- | --- | --- | --- |
| Story Front Door | “처음 시작하려면 무엇을 누르겠나요?” | `새 기록 시작`의 발견 가능성, 이어하기의 disabled 의미 이해 | raw_participant_words, 첫 입력, 망설임 |
| AdmissionPrologue | “지금 어디에 왔고, 다음에 무엇을 하면 될 것 같나요?” | `입학의 아침`이 독립 메뉴가 아닌 이야기의 일부로 읽히는가 | 설명, 잘못 이해한 선택 |
| 글자 새기기 | “이 사건에서 지금 할 수 있는 일을 찾아 보세요.” | `글자 새기기` 표면, 그리기/후보/`글자로 사용`의 순서, 실패 뒤 회복 | 입력 방식, candidate 인식, 회복 행동 |
| 서클 Preview | “다음 행동 전에 무엇을 확인할 수 있나요?” | Preview가 자동 해결이 아닌 정보 확인으로 보이는가 | Preview 이해, 예상 결과 |
| 대상 지정 | “무엇을 먼저 처리하고 싶나요? 이유는 무엇인가요?” | 대상 지정의 명시성, 숨은 정답·자동 대상 오해 여부 | 선택 이유, perceived_hidden_best_answer |
| 명시 시전 | “지금 누르면 어떤 일이 일어날 것 같나요?” | `시전`이 별도의 확정 행동으로 인식되는가 | 예상, 오입력, 취소 기대 |
| 사건 시계 | “서리 안정화와 온실 균열 확산은 각각 무엇을 뜻하나요?” | 목표와 위협을 동시에 읽는가, 숫자를 자동 실패확률로 오해하는가 | 목표/위협 설명, 다음 행동 의도 |
| 결과 | “무엇이 바뀌었고, 무엇이 남았나요?” | result receipt과 시계 변화의 인과 읽기 | actual/remaining 설명, 혼동 |

## 5. 모바일·접근성 확인 항목

`W3C WCAG 2.2`의 pointer target 최소 크기와 간격 원칙은 게임 UI에 **ADAPT**한다. 이 기준은 웹의 CSS pixel 기준이므로, 현재 Godot scene이나 기기 한 대가 WCAG 준수를 자동으로 증명하지 않는다. 실제 기기에서 오입력·인접 버튼 충돌·한 손/떨림·회전·display/text scale을 관찰하고 기록한다.

Godot Control의 anchors, Container, `focus_mode`, `accessibility_name`은 필요한 구현 수단이다. 공식 API의 존재도 실제 screen reader 또는 controller 흐름의 PASS가 아니다.

| 축 | 확인 방법 | 성공을 지지하는 관찰 | 실패/불명확 신호 | 처리 |
| --- | --- | --- | --- | --- |
| target_size_and_spacing | 실제 터치로 메뉴, 후보, Preview, 대상 지정, 시전 버튼을 반복 입력 | 의도한 control만 반복적으로 활성화 | 인접 control 오입력, 손가락이 control을 가림 | scene layout/spacing review |
| direct_glyph_input | 손가락 또는 stylus로 `글자 새기기` 작성·지우기·후보 확정 | 입력 표면과 clear/retry가 발견 가능 | gesture가 막히거나 candidate 회복 방법을 못 찾음 | glyph input UX review |
| text_scale_or_display_scale | 기본/확대 상태에서 제목, 목표, 위협, 상태, 버튼 읽기 | 중요한 상태가 겹치거나 잘리지 않음 | clipping, overlap, 의미 소실 | responsive layout review |
| focus_or_controller_navigation | keyboard/controller 가능 환경에서 focus 이동과 activate를 기록 | 순서가 이야기→입력→Preview→대상→시전의 의미 흐름을 해치지 않음 | focus loss, focus hidden, 순환/탈출 불가 | Control focus review |
| screen_reader_or_accessibility_service_state | 실제 서비스의 노출 여부와 event clock segment 읽기를 원문으로 기록 | goal/threat count, 완료/미완료 상태가 구분되어 전달 | 이름 미노출, 순서 불명, 서비스 미지원 | access API/device compatibility review or BLOCKED_UNVERIFIED |
| reduced_motion_and_visual_load | 해당 OS 옵션이 있을 때 전환·빛 효과가 읽기를 방해하는지 관찰 | 중요한 text/clock/status를 안정적으로 읽음 | 움직임이 목표·위협·시전 affordance를 가림 | visual motion review |

## 6. 판정 원칙과 결과 기록

한 번의 세션은 개별 관찰값만 만든다. 다음은 서로 독립된 상태로 유지한다.

```yaml
human_comprehension: NOT_RUN | OBSERVED_SUPPORTIVE | OBSERVED_CONCERN | BLOCKED_UNVERIFIED
mobile_device_touch: NOT_RUN | OBSERVED_SUPPORTIVE | OBSERVED_CONCERN | BLOCKED_UNVERIFIED
accessibility_assistive_technology: NOT_RUN | OBSERVED_SUPPORTIVE | OBSERVED_CONCERN | BLOCKED_UNVERIFIED
keyboard_or_controller_navigation: NOT_RUN | OBSERVED_SUPPORTIVE | OBSERVED_CONCERN | BLOCKED_UNVERIFIED
performance: NOT_RUN
export: NOT_RUN
full_vertical_slice: NOT_RUN
```

세션의 `OBSERVED_SUPPORTIVE`는 해당 환경에서 관찰된 사실일 뿐, 전체 PASS·출시 적합성·다른 기기 호환성을 뜻하지 않는다. `PASS`는 충분한 실제 세션과 별도 owner 검토가 축별로 존재할 때만 사용한다.

```yaml
session_id: UNASSIGNED
raw_participant_words: []
front_door_discovery: UNOBSERVED
admission_handoff_understanding: UNOBSERVED
glyph_input_and_candidate_recovery: UNOBSERVED
preview_before_resolution_understanding: UNOBSERVED
explicit_target_and_cast_understanding: UNOBSERVED
event_clock_goal_understanding: UNOBSERVED
event_clock_threat_understanding: UNOBSERVED
target_size_and_spacing: UNOBSERVED
focus_or_controller_navigation: UNOBSERVED
screen_reader_or_accessibility_service_state: UNOBSERVED
text_scale_or_display_scale: UNOBSERVED
reduced_motion_and_visual_load: UNOBSERVED
observed_confusions: []
runtime_errors_before_or_during: []
moderator_interventions: []
recommended_disposition: NOT_EVALUATED
separate_gates_left_not_run:
  - performance
  - export
  - full_vertical_slice
```

## 7. 근거·채택·한계

| source | finding | GRIMOIRE disposition | limit |
| --- | --- | --- | --- |
| [W3C WCAG 2.2 — Target Size (Minimum)](https://www.w3.org/WAI/WCAG22/Understanding/target-size-minimum.html), checked 2026-09-01 | pointer target는 24×24 CSS px 이상이거나 충분한 간격을 두라는 접근성 원칙을 설명한다. | ADAPT — 실제 모바일 관찰에서 target_size_and_spacing와 오입력을 기록한다. | Godot 좌표/실제 기기/게임 UI가 WCAG Web 준수라고 증명하지 않는다. |
| [Godot Control](https://docs.godotengine.org/en/stable/classes/class_control.html), checked 2026-09-01 | `focus_mode`, accessibility name/description, anchors가 Control API에 존재한다. | ADAPT — focus와 accessible state의 실제 노출을 별도 관찰한다. | API 존재와 automated `accessibility_name` 검사는 실제 보조기술 PASS가 아니다. |
| [Godot UI Containers](https://docs.godotengine.org/en/stable/tutorials/ui/gui_containers.html), checked 2026-09-01 | anchors/Containers가 여러 해상도 UI layout 수단을 제공한다. | ADOPT — device matrix와 text/display scale 관찰을 구조화한다. | 1280×720 editor 화면과 layout test만으로 physical device readability를 증명하지 않는다. |

## 8. 증거 보관과 다음 조치

- 실제 세션이 끝날 때만 raw participant wording, device metadata, screenshot/video가 있다면 저장 경로와 consent 상태를 별도 evidence receipt에 적는다. 개인 식별 정보는 기록하지 않는다.
- 실패·혼동은 유효한 증거다. 관찰 중 수정하지 않고, 이후 원인과 해결을 분리된 work unit으로 올린다.
- 이 문서는 새로운 visual asset consumer를 만들지 않는다. 현재 관찰 범위에 새 이미지를 생성하는 것은 증거를 보강하지 못하므로 제외했다.
- 관찰 종료 뒤에만 `docs/ACTIVE_CONTEXT.md`, `docs/PROJECT_HOME.md`, validation receipt을 **실제 실행된 축만** 갱신한다. 실행되지 않은 축은 `NOT_RUN`을 유지한다.
