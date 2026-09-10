# 카드 결투 화면 후보 01 — 생성·검수 기록

## 목적·상태

- project: GRIMOIRE; requirement: CARD_DUEL_SURFACE_01; priority: P0_FIRST_SCREEN_REVIEW.
- consumer_kind: PLANNED_GAME_SURFACE. consumer: 첫 연습 결투의 학생 상반신·카드 손패·두 장 구성 영역.
- current spec: `docs/superpowers/specs/2026-09-10-card-duel-blueprint.md`, 특히 07/08. 상세 규칙 승인: 최신 사용자 `권장안대로 진행`.
- 이미지 상태: GENERATED_CANDIDATE / REVIEWED / REVISION_REQUIRED_BEFORE_RUNTIME. 사용자 시각 최종 승인·정본 자산 등록·runtime 적용은 아님.
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
