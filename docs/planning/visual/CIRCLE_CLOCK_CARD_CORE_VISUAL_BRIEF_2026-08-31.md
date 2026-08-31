# 공용 서클·사건 시계·마도 카드 코어 시각 후보 브리프

```yaml
brief_id: GR-VISUAL-BRIEF-CIRCLE-CLOCK-CARD-CORE-20260831-01
decision_id: GM-CIRCLE-CLOCK-CARD-CORE-01
project_relation: GRIMOIRE_CORE_REPLACEMENT
status: FRONT_DOOR_CANDIDATE_GENERATED__USER_LOCK_PENDING
generation_approval: USER_EXPLICIT_2026-08-31
mode: final-visual-candidate
consumer_kind: PLANNED_GAME_SURFACE
approved_visual_reference_ids:
  - ART-STYLE-01
  - GM-VISUAL-DIRECTION-20260825-01
  - GM-VISUAL-TONE-20260828-01
  - LOGO_01_FIXED_AS_DEFAULT_VISUAL_DIRECTION
current_core_override: GM-CIRCLE-CLOCK-CARD-CORE-01
runtime_status: NOT_IMPLEMENTED
human_review: NOT_RUN
```

## 공통 연속성 규칙

- 유지: Soft Storybook Cel 2D Hybrid의 부드러운 환경, 깨끗한 anime cel 캐릭터 레이어, 따뜻한 학습자 중심 마법학교, 남색 구조와 절제된 금색 장식, 푸른색에서 청보라로 이어지는 직접 필기 마력.
- 새 코어: 별형 회로, Main/Auxiliary, 부적·패찰형 글자는 사용하지 않는다. 직접 쓰인 글자와 역할 없는 1~3개 겹서클의 가능성을 암시할 수 있다.
- 기능 UI: 모든 버튼, 수치, 시계 칸, 카드 비용, 카드명, 로고, 설정 글자는 live Godot UI가 소유한다. 이미지에 글자·숫자·의사 UI·워터마크를 넣지 않는다.
- 금지: 빈 장식 패널, 3D 탐험 화면, 공포/컬트/감시자 첫인상, 적흑색 지배, 다른 게임의 카드 프레임 복제, 성숙한 교관 느낌의 학생 카드 캐릭터, baked functional text.
- 권리: 사용자가 준 참조는 분위기·기능 원리만 참고하며, 특정 캐릭터·의상·UI skin·구도·문구를 복제하지 않는다.

## 후보 01 — 스토리 프런트 도어 배경

```yaml
asset_id: GR-CAND-FRONT-DOOR-BG-01
coverage_item_id: GR-VIS-023-STORY-FRONT-DOOR-BACKGROUND
consumer_surface: src/ui/front_door/story_front_door.tscn
primary_use: new_record_and_resume_story_entry
aspect: 16:9_landscape
target_runtime: 1280x720_landscape_gl_compatibility
state_family:
  normal: REQUIRED
  hover_pressed_disabled: NOT_APPLICABLE_TO_BACKGROUND
  time_of_day_variant: DEFERRED
```

첫 기록을 시작하는 입학식 직전의 마법학교 정문/교정이다. 고풍스러운 석조 아카데미의 아치, 멀리 보이는 온실 지붕, 살아 있는 덩굴과 식물, 길을 따라 이어지는 따뜻한 등불이 보인다. 깊은 남색 지붕과 밤에서 새벽으로 넘어가는 맑은 푸른 하늘, 은은한 금색 조명, 푸른색에서 청보라로 이어지는 작은 직접 필기 마력 흔적이 조화롭게 보인다. 플레이어가 들어갈 수 있는 길과 학교의 환대가 첫인상이다.

화면은 한 장의 완성된 환경 일러스트여야 하며, 중앙 상단의 로고와 하단의 live 버튼이 올라갈 만큼 자연스러운 시선 흐름을 가진다. 그 공간은 검은 빈 프레임이나 인위적인 패널 여백으로 만들지 않는다. 인물은 넣지 않는다. 이 배경은 수업/실습/결투/축제를 선택하는 허브가 아니라, 새 기록과 이야기 이어가기를 시작하는 스토리 입구의 환경이다.

## 후보 02 — 카드 프레임·뒷면 패밀리

```yaml
asset_id: GR-CAND-CARD-FRAME-FAMILY-01
coverage_item_id: GR-VIS-025-NARRATIVE-CARD-UI-FAMILY
consumer_surface: src/ui/cards/card_archive_screen.tscn
primary_use: story_unlocked_card_archive
aspect: portrait_card
state_family:
  normal: REQUIRED
  locked: REQUIRED
  selected: REQUIRED
  disabled: REQUIRED
```

별형이 아닌 얇은 1~3개의 겹서클, 직접 필기한 글자의 잔광, 남색 종이와 절제된 금색 공예를 사용한 독창적인 마법학교 카드 프레임과 카드 뒷면 패밀리다. 카드명·비용·희귀도·효과·수치·아이콘은 넣지 않는다. Live UI가 그 정보를 별도 레이어로 놓을 수 있는 깨끗한 삽입 영역을 둔다. 섀도우버스, 궨트, 매직의 식별 가능한 프레임 구조와 색 배치를 모방하지 않는다.

## 후보 03 — 공격·방어·소환 상징 패밀리

```yaml
asset_id: GR-CAND-CARD-SYMBOL-FAMILY-01
coverage_item_id: GR-VIS-025-NARRATIVE-CARD-UI-FAMILY
consumer_surface: src/ui/cards/card_archive_screen.tscn
primary_use: card_type_readability
state_family:
  normal: REQUIRED
  selected: REQUIRED
```

직접 필기 마력 문자의 획을 기반으로 한 공격, 방어, 소환의 세 독립 상징 후보다. 공격은 맑은 청보라의 전진하는 획, 방어는 보존을 암시하는 겹원과 보호막, 소환은 따뜻한 빛을 끌어오는 열린 원으로 읽힌다. 카드명·숫자·문자·화살표 UI·다른 게임의 아이콘을 넣지 않는다. 마법사 카드 타입은 인물 일러스트가 준비된 뒤 별도 후보로 제작한다.

## 후보 04 — 학생 마법사 카드 인물

```yaml
asset_id: GR-CAND-WIZARD-STUDENT-HALF-BODY-01
coverage_item_id: GR-VIS-025-NARRATIVE-CARD-UI-FAMILY
consumer_surface: src/ui/cards/card_archive_screen.tscn
primary_use: story_unlocked_wizard_card
state_family:
  neutral: REQUIRED
  focus: DEFERRED
  damaged: NOT_APPLICABLE
```

또래 마법학교 학생의 상반신만 보이는 카드 인물 후보다. 차분하지만 호기심 있는 표정, 직접 글자를 쓰는 손 또는 작은 공용 서클의 빛을 읽는 동작, 실제 생활감이 있는 교복/망토 레이어를 사용한다. 과하게 성숙한 교관·귀족·군주 인상, 전신 포즈, SD, 이름·대사·수치·카드 UI를 넣지 않는다.

## 후보 검수와 승격

각 후보는 한 번에 하나씩 생성한다. 생성 성공은 `GENERATED_CANDIDATE`이며, 사용자 최종 잠금 전에는 `assets/art/source_candidates/circle_clock_card_core/` 밖으로 옮기거나 runtime scene에서 참조하지 않는다. 후보별로 프롬프트, 생성 도구, SHA-256, 소비처, 상태군, 검수 결과, user lock 여부를 시각 자산 커버리지에 기록한다.

## 생성 후보 기록 — 후보 01

```yaml
asset_id: GR-CAND-FRONT-DOOR-BG-01
state: GENERATED_CANDIDATE
project_candidate_path: assets/art/source_candidates/circle_clock_card_core/front_door/front_door_admission_academy_candidate_01.png
source_generated_path: C:/Users/user/.codex/generated_images/01a04af4-91c2-78f2-bbbb-9e5110b63de2/exec-76cfe61d-324f-4add-9feb-c3bc12da6339.png
generator: image_gen
generated_at: 2026-08-31
sha256: D002D5E8FE545631F48AC07F2AA4C2F4AB292B587E9476CE39F96276133A5FE0
bytes: 2540589
consumer_surface: src/ui/front_door/story_front_door.tscn
runtime_status: NOT_IMPLEMENTED__USER_LOCK_REQUIRED
user_lock: PENDING
visual_qa: PASS_CANDIDATE_SCOPE_ONLY
```

검수 관찰:

- 16:9 환경 일러스트이며, 학원 정문·진입로·따뜻한 등불·온실 지붕이 한 장면 안에서 읽힌다.
- 인물, 읽을 수 있는 기능 텍스트, 수치, 버튼, 로고, 워터마크, 빈 장식 패널이 없다. 그러므로 로고와 새 기록/이어가기 버튼은 live Godot UI로 안전하게 분리할 수 있다.
- 별형 회로나 부적·패찰형 글자는 없고, 청보라 직접 필기 마력의 짧은 흔적만 환경적인 마법성으로 사용했다.
- 현재 평가는 후보 구도·제작 경로의 통과일 뿐, 미술 최종 잠금, runtime 적용, 사람 UX 검증 또는 출시 승인을 뜻하지 않는다.
