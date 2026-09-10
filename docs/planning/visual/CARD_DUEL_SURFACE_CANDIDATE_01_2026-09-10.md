# 카드 결투 화면 후보 01 — 생성·검수 기록

## 후속 분리 배경 후보 — 2026-09-10

최신 사용자 `권장안대로 작업 계속 진행해`로 승인된 분리 제작을 이어갔다. 기존 합성 그림은 방향 참고로 유지하고, 배경을 새로 생성했다. 이 절은 배경 후보의 owner이며 아래 합성 화면의 승인 상태와 구분한다.

- requirement_id: CARD_DUEL_BACKGROUND_01; coverage: Environment / room visual, REQUIREMENT_LINKED.
- consumer_kind: PLANNED_GAME_SURFACE; planned consumer: `src/ui/card_duel/`의 Background TextureRect. 해당 씬은 아직 없으며 구현 완료가 아니다.
- primary_use: 첫 연습 결투에서 상반신 인물·선택 카드·예상 결과·손패의 뒤에 놓는 환경.
- Delete Test: 기존 합성 시안에는 인물/카드/중앙 별이 구워져 있어 독립 배경으로 쓸 수 없다. 단순 crop이나 빈 단색 화면으로 최종 자산을 대체하지 않는다.
- state_family: STATIC_NORMAL_ONLY. 별도 hover/pressed/피격/파괴 상태는 이 배경의 consumer에 불필요. VFX와 인물 반응은 다른 레이어가 소유한다.
- output: `output/imagegen/card-duel/duel-background-candidate-01.png`, 1672×941 PNG.
- SHA-256: `8445F4409DA8CB388F1157D9CF1CE41C1222746F3818D48FF71325EC1F4F6F36`.
- source: built-in image_gen, `exec-0408980d-d4f2-4070-96a1-3d36f6521b1a.png`. 도구 제공 모델 버전 없음. 기존 그림은 육안 참고만 하고 파일 입력으로 전달하지 않았다.
- status: USER_APPROVED / RUNTIME_NOT_IMPLEMENTED. 최신 사용자 `확정할게 진행해`는 이 배경의 최종 시각 채택 승인이다. 위 파일/해시를 승인 원본으로 유지하며 불필요한 복제본을 만들지 않는다. runtime 등록·상업 권리·Godot 적용·모바일 검증은 미완료.
- Keep: 승인된 따뜻한 연습실/남색/절제된 금색/부드러운 채색. Avoid: 별·회로·기능 글자·인물·카드·효과·빈 장식창. Do Not Drift: 새 카드 시스템과 분리 레이어.

### 도구 선택·화면 연결

이미지 모델로 신규 배경을 만들었다. Aseprite는 이번 정지 배경에 프레임·셀 편집 필요가 없어 NOT_APPLICABLE이며, 불필요한 aseprite 복사본/atlas를 만들지 않았다. 향후 학생 준비→시전→방어/결과→복귀 상태군에서 정렬·duration·PNG/JSON export를 검토한다. Aseprite 기능 발견과 실제 모션 제작은 별개다.

Godot TextureRect의 비율 유지·크롭 방식을 공식 문서로 확인했다. ADOPT: 화면 전체 배경과 별도 UI 노드. ADAPT: 1280×720을 우선 검증하고 다른 가로 비율은 중요 영역 가림 확인. REJECT: 비율을 무조건 늘리거나 한 장의 배경에 UI/인물/효과를 굽기. 예정 설정은 EXPAND_IGNORE_SIZE, KEEP_ASPECT_COVERED, mouse_filter=IGNORE이며 실제 엔진 검증 전이다. 하단 약 40% 남색 면은 UI 안전 영역 후보이지 실기 가독성 PASS가 아니다.

근거 fresh-read: [Godot TextureRect](https://docs.godotengine.org/en/stable/classes/class_texturerect.html), [Aseprite Animation](https://www.aseprite.org/docs/animation/). 최신 Base conversation owner는 후보 선제 제작/최종 lock 분리를 허용한다. 참조 문서의 오래된 Notion 작업면 설명은 프로젝트 repository-only 정책으로 대체하여 Notion 호출하지 않았다. Base v9.4.3 pin은 유지했다.

### 생성 프롬프트

```text
Create one NEW original 16:9 landscape environment-only background asset candidate for GRIMOIRE, a warm 2D magical academy card-duel game. Soft hand-painted storybook cel illustration, coherent gently simplified shapes and warm afternoon light. An airy academy practice classroom with tall arched windows, cream stone, warm wood, restrained bookshelves at far sides, soft blue sky and distant original school architecture outside. Navy accents and muted antique brass, inviting school atmosphere, no grimdark. Composition: eye level seated at a broad practice table; environment visible across upper 52 percent, quiet uncluttered navy cloth tabletop across lower 48 percent. The table is entirely plain matte navy with soft restrained texture and only natural wood edges, NO gold inset border, NO motif, NO radial diagram, NO star, NO compass, NO rune, NO circle. Keep center and lower foreground low-detail and low-contrast for separately rendered flat cards and live UI. Keep side upper areas comparatively calm for separate student bust overlays. Back window brightness soft, not blown out. No dramatic perspective card slots, no frames, no empty UI panels or buttons. Absolutely no people, no silhouettes, no character portraits, no cards, no open book in foreground, no floating objects, no spells, no particles, no light trails, no text, no pseudo-text, no writing on book spines, no numbers, no labels, no logos, no heraldic emblems or franchise symbols anywhere. Closed books on distant shelves may be plain colored shapes. Not greenhouse, no vegetation theme. No photorealism, no 3D rendering, no pixel art. High quality cohesive painted game background, not a UI mockup, not a poster. Single flat opaque PNG environment only; no claim of layers or animation.
```

### 5회 검토와 현재 판단

1. 의도/범위: 기존 시안을 분리 배경으로 재제작. 새 핵심 규칙·인물 정체성 추가 없음.
2. 금지 요소: 눈에 보이는 중앙 별/회로/기능 글자/카드/인물/비어 있는 장식창 없음. 책 등 최소 장식은 남아 있으나 읽을 수 있는 기능 글자 아님.
3. 사용처/형태: 넓은 남색 탁상 확보. 실제 카드 배치·상단 창 밝기와 결과 표시의 대비는 runtime에서 확인해야 함.
4. 제작/모션/권리: 단일 정지 PNG, 모델 생성 원본 복사 후 크기/해시 확인. 별도 레이어·모션 완성으로 오인하지 않음. 외부 게임 그림 입력 없음, release rights NOT_RUN.
5. 정본/완료: 이전 합성 후보를 덮어쓰지 않음. 새 배경은 최종 승인 전이며 runtime consumer에 등록하지 않음. main 통합과 UX/Human/Device도 미완료.

후속 결정: 배경은 사용자 확정 완료. 학생 상반신과 평면 카드 자산을 이어 만들고, Spec 07의 선택→미리보기→명시 시전→결과 UI에 연결한다. 위 5회 검토의 승인 대기 표현은 생성 당시 관찰이며 현재 승인 상태를 덮어쓰지 않는다.

## 목적·상태

- project: GRIMOIRE; requirement: CARD_DUEL_SURFACE_01; priority: P0_FIRST_SCREEN_REVIEW.
- consumer_kind: PLANNED_GAME_SURFACE. consumer: 첫 연습 결투의 학생 상반신·카드 손패·두 장 구성 영역.
- current spec: `docs/superpowers/specs/2026-09-10-card-duel-blueprint.md`, 특히 07/08. 상세 규칙 승인: 최신 사용자 `권장안대로 진행`.
- 이미지 상태: USER_APPROVED_DIRECTION_REFERENCE / REVISION_REQUIRED_BEFORE_RUNTIME. 후속 `좋아 권장안대로 계속 진행해`로 학생 비율·따뜻한 연습실·남색/금색 방향을 채택한다. 중앙 별 장식은 제외한다. 합성 PNG 자체의 정본 runtime 자산 등록·적용은 아니며, 배경/인물/카드/효과/텍스트를 분리 제작한다.
- 파일: `output/imagegen/card-duel/duel-surface-candidate-01.png`.
- SHA-256: `84A27722D6573535D33D8F1267EC9CD9799C9F32CF62D761E673A94E51FE0D17`.
- 생성 방식: built-in image_gen. 정확한 모델 버전은 도구에서 제공되지 않아 기록하지 않는다. 새 생성이며 기존 이미지 파일을 생성 입력으로 전달하지 않았다.
- 기본 생성 파일은 Codex generated_images에 있고, 프로젝트 소비 자료는 위 프로젝트 경로에 복사했다. 원본을 임의 삭제하지 않는다.

## Fresh-read와 선정 근거

프로젝트 AGENTS/Active Context/새 블루프린트/기존 따뜻한 학교 톤 owner와 dialogue reference를 검토했다. 기존 그림과 구기획은 참고만 사용한다. 새 입력은 그림이 아닌 카드이며, 옛 별형·glyph 조건을 승계하지 않는다. Base v9.4.3 pin 유지, project validator OPERATING_CONTRACT_VALID.

현재 화면 후보의 필요성은 표만으로 인물 나이 읽기·무대·카드 가림·분위기를 판단하기 어렵다는 데 있다. Delete Test: 이 후보 없이도 판정 코드는 만들 수 있지만, 새 카드 화면의 그림 구성 승인 근거가 없다. production 정보 도식이나 장식용 이미지로 사용하지 않는다.

Keep: 학생다운 상반신, 읽기 쉬운 카드 초점, 따뜻하고 안전한 연습 분위기, 절제된 남색/금색. Avoid: 성숙한 교수 같은 인물, 공포 분위기, 과한 광채, 글자·수치가 구워진 배경. Do Not Drift: 4장 손패/2장 선택은 이번 대표 화면 시험값, 마법사 종류 카드 없음, 그리기/별형 회로 없음.

기존 이미지 승인과 얼굴·이름·의상을 그대로 승계하지 않는다. 새 인물 디자인·성별·복장·문양은 후보의 시각 제안이며 인물 설정 확정이 아니다. 인물 카드가 아니라 실제 결투 주체를 화면에 그린 것이다.

## 실제 사용한 생성 프롬프트

```text
Create one polished 16:9 landscape visual-direction candidate for an ORIGINAL 2D magical academy card-duel game, GRIMOIRE. This is a PLANNED GAME SCREEN art composition, not a poster, not an infographic. Soft hand-painted storybook cel illustration, youthful student proportions and inviting late-afternoon academy light; restrained deep navy, muted antique brass, teal and parchment. In the upper half, two clearly youthful academy students shown UPPER BODY ONLY, a short tousled brown-haired student on the far left wearing a practical navy school cloak with teal scarf, and another original student with short dark auburn hair on far right in a related simple school uniform. Friendly determined practice opponents, no adult professor, no mature muscular physiques. Environment: original airy academy practice classroom, tall arched windows, restrained bookshelves and warm wood, soft blue sky outside. Not a greenhouse, no plants as main theme, no copied franchise crests. Center upper/middle has a restrained readable staging area for the confrontation, no enemies or monsters. In the lower foreground create a refined navy-and-brass CARD INTERACTION composition: four clearly separated cards along bottom displaying only painted symbolic pictures of ember, wind, protective veil, gathering light, with NO lettering or numerical markings. Above that hand, two smaller selected cards visually combine through one subtle curling thread of light, evoking composing a short spell rather than drawing a glyph. Strong clear silhouette for cards, understated narrow borders. Give actual space for separately rendered future UI without drawing empty panels or empty ornamented windows. The students do not overlap the card interaction area. All functional text, costs, health, labels, buttons, typography, readable writing, pseudo-writing and logos are completely absent. No pentagram, star circuit, rune writing, chalk writing, floating letters, wizard portrait cards, summoning army, SD character, 3D render, photorealism, exaggerated bloom or dense particles. Art is a single flattened review candidate; do not pretend to supply layers or completed motion. Prioritize the player's card decision and the approachable student identity. New independent scene design, no replication of existing game screens.
```

## 생성 후 검수

| 항목 | 관찰·판정 | 다음 조치 |
|---|---|---|
| 학생 읽기 | 두 명 모두 학생다운 상반신, 밝은 연습 분위기 | 사용자 선호 확인. 인물 정체성은 미확정 |
| 카드 구성 | 하단4장·중앙2장이 분명하고 인물 카드 없음 | UI의 실제 평면 카드와 인물 손의 소품 패를 구분 |
| 기능 글자·숫자 | 눈에 보이는 기능 글자·숫자는 생성하지 않음 | 최종 Godot Label/상태 UI로 별도 표현 |
| 불필요한 창 | 비어 있는 장식창 없음 | 유지 |
| 별 모양 | 중앙 테이블의 별/나침반 같은 장식이 옛 회로로 오인될 수 있음 | MUST_FIX: 개별 배경 제작에서 제거. 게임 기능으로 채택하지 않음 |
| 기능 UI 공간 | 실제 시전 버튼·예상 결과·비용이 없는 구도 시안 | 모바일 실제 글자 크기와 UI 가림은 미검증. UI 완성 주장 금지 |
| 카드 원근 | 보기 좋은 테이블 원근이 있으나 실제 터치 카드 그대로 쓰기 부적합 | 평면 개별 카드로 재제작. 이미지에서 자른 것을 최종 카드로 간주하지 않음 |
| 레이어/모션 | 한 장의 합성 PNG | 분리 자산·투명 알파·Aseprite 프레임·모션 완성 아님 |

권장 판단: **분위기·학생 비율·남색과 금색의 방향 검토용으로 제시**. 원본 그대로 runtime 적용은 거부한다. 다음에는 중앙 별 장식을 없애고 배경/상반신 인물/카드/효과를 분리한다. 새 후보의 실제 최종 승인 전 production 연쇄 생성은 하지 않는다.

## 구현과 Aseprite 경계

이미지 모델은 독립 아트를 만든다. Aseprite는 실제 분리 원본을 확보한 뒤 레이어·프레임·duration·pivot/offset·PNG/JSON export에 필요한 경우 사용한다. 단일 합성 이미지를 Aseprite로 열었다는 이유로 분리 자산·애니메이션이 되지 않는다.

근거(2026-09-10 조회): [Aseprite export](https://www.aseprite.org/docs/exporting), [sprite sheet](https://www.aseprite.org/docs/sprite-sheet/), [Godot UI](https://docs.godotengine.org/en/4.7/tutorials/ui/index.html). 공식 기능은 제작 가능 수단이며 현재 후보의 알파·엔진 통합·사람 가독성 증명이 아니다.

## 5회 자체 검토와 학습

1. 사용자 승인 범위: 상세 규칙 승인과 시각 잠금 분리.
2. 정본/기존 소비처: 옛 별형·WIZARD 정의와 기존 runtime 자산을 새 사실로 사용하지 않음.
3. 결과 해석: 별 장식과 원근 카드는 발견된 시각 드리프트로 기록하고 기능 채택 금지.
4. 제작/권리/비용: 기존 게임 그림 입력 없음, 신규 유료 도구 없음, 완성 배포 권리 검수는 NOT_RUN.
5. 완료 상한: 후보 생성·복사·육안 검수만 완료. 시각 최종 승인/분리/모션/Godot/Human/Device는 NOT_RUN.

프로젝트 학습: 금색 장식 자체가 폐기된 회로를 연상시킬 수 있으므로 후속 배경 프롬프트에 'no star, compass, radial diagram on tabletop'을 명시한다. Base 공용 승격은 하지 않으며 검증된 공용 메서드와 중복 스킬을 만들지 않는다.
