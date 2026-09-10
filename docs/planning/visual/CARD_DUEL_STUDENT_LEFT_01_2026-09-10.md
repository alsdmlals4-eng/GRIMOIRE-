# 첫 학생 상반신 기본 포즈 — 후보 및 기술 검수

## 범위·정본·현재 판정

- 최신 사용자: 배경 `확정할게 진행해`. 배경 USER_APPROVED와 이 학생의 확정은 별도다.
- requirement: CARD_DUEL_STUDENT_LEFT_IDLE_01; consumer_kind: PLANNED_GAME_SURFACE.
- planned consumer: 새 `src/ui/card_duel/`의 왼쪽 학생 인물 레이어 및 대화 portrait. 현재 해당 UI는 구현 전이다.
- reference: `duel-surface-candidate-01.png`의 왼쪽 갈색 머리 학생. 입력 역할은 비율·얼굴·남색 망토/청록 스카프·채색의 방향 참고. 합성 그림 crop이나 옛 캐릭터 자산 재사용이 아니다.
- 이번 제작: 상반신 기본 포즈 1건 + 알파 문제만 고치려는 보정 1건. 다른 인물/모션 연쇄 생성 없음.
- candidate: `output/imagegen/card-duel/student-left-idle-candidate-01.png`, 1044×1506, SHA-256 `9AA6EF0276CED673C85E498FAB52177041B21DCA8BABDC4E3EA78E9B7B086268`.
- 상태: GENERATED_CANDIDATE / TECHNICAL_REVISION_REQUIRED / USER_REVIEW_PENDING. 기본 모습 검토용으로만 보존. runtime 준비 완료 아님.

## 사전 제작 판단과 모션 접점

기본 포즈는 오른쪽 상대를 바라보며 양손을 허리/가슴 아래에 편하게 두는 상태다. 얼굴을 가리지 않고 무기/책/카드 소품 없이 다음 포즈로 옮길 수 있게 했다. 인물 이름·설정·마법사 카드 종류는 추가하지 않았다. SD/전신은 제작하지 않는다.

승인 후 필요한 상태군: IDLE → PREPARE → CAST 또는 GUARD → RESULT → IDLE. 얼굴/머리/의상/카메라 크기/시선 방향은 고정하며 변하는 것은 팔·몸의 준비와 반응이다. 공격/반사 결과는 이미 확정된 도메인 결과를 표현할 뿐 포즈 프레임이 피해를 계산하지 않는다. 준비/실행/복귀 duration은 아직 확정하지 않았다.

ADOPT: 독립 인물 텍스처와 프레임 상태 분리. ADAPT: 학생 상반신의 동일 캔버스·기준점으로 후속 포즈를 정렬. REJECT: 정지 이미지를 반복 복제해 모션 완료로 표시, 임의 타이밍으로 피해 확정, 알파 없는 그림을 투명 자산으로 표시. 근거 fresh-read: [Godot AnimatedSprite2D](https://docs.godotengine.org/en/stable/classes/class_animatedsprite2d.html). 애니메이션 기능 존재는 현재 구현 증거가 아니다.

Base 캐릭터 identity/pose sequence 지침을 읽었다. Aseprite는 실제 투명 원본과 승인 포즈가 확보된 뒤 frame/cel/duration/export 단계에 적용한다. 지금은 그 전 단계이므로 빈 aseprite 파일·가짜 atlas를 만들지 않았다. Base v9.4.3 유지, 프로젝트 운영 검사 통과, 기존 사용자 fixture와 열린 PR은 보존.

## 실제 생성과 기술 반례

이미지 모델: built-in image_gen, 제공되지 않은 모델 버전은 추정하지 않음.

1. 원본 `exec-4b827315-348d-47dd-9bf6-c51348d847e7.png`: 1044×1506, Format24bppRgb. (0,0) A=255 RGB=212/212/213, (20,20) A=255 RGB=237/238/238. 체크무늬가 픽셀에 포함돼 있으며 알파 없음.
2. 원본 인물 유지/배경만 제거 보정 `exec-4e37399c-5a00-4b04-840e-658eb2799b5d.png`: 1044×1507, Format24bppRgb, (0,0) A=255. SHA-256 `1AAB86FE235A21D2791F93395CA9BD16CD7926DD0F03BFEF07DC176432832D85`. 보정도 알파 실패 및 높이 1px 변화. 원본 그대로 보존되는 완전한 편집도 아님.

보정 실패 파일은 프로젝트에 중복 복사하지 않았다. 도구 기본 생성 위치 `C:/Users/user/.codex/generated_images/01a04af4-91c2-78f2-bbbb-9e5110b63de2/`에 있으며 이 파일을 게임 자산으로 참조하지 않는다. 후보 원본만 프로젝트에 보존한다. 추가 유료 API로 전환하지 않았다. 모델에 투명을 요청했다는 사실과 실제 RGBA 출력은 별개다.

## 프롬프트

```text
Use the attached image ONLY as a visual reference for the LEFT brown-haired student's youthful proportions, face, navy cloak and teal scarf, and soft storybook cel illustration style. Create ONE separate character asset, NOT a scene and NOT a sheet: that original youthful academy student, UPPER BODY ONLY, cropped neatly below the waist, on genuinely TRANSPARENT background with alpha, no checkerboard painted in. Full hair silhouette, shoulders, elbows and both hands comfortably inside frame, generous transparent padding. Three-quarter body facing slightly toward viewer's RIGHT, eyes looking right at a practice opponent. Short soft tousled brown hair, warm brown eyes, rounded youthful face, slim student shoulders, approachable focused expression with small relaxed closed-mouth smile. Not a mature adult, not muscular, not chibi or SD. Practical navy school cloak with restrained muted gold piping, simple ivory collared shirt, plain teal scarf, no badge, crest, symbol, star, rune, logo or text. Neutral ready pose: relaxed shoulders, elbows bent naturally, both EMPTY hands resting comfortably around lower chest/waist level and slightly separated, fingers naturally relaxed and clearly anatomical. No hand touching face. This is the neutral identity anchor for later preparation/cast/defense/recovery frames, no spell effect yet. Preserve the reference's warm hand-painted cel shading, fine confident lines, simple readable cloth shapes; no excessive ornament, shiny rendered skin, photorealism or 3D. Soft warm light from upper left, no cast shadow outside silhouette, no bloom/glow. Absolutely NO background room, table, chair, cards, book, wand, particles, lettering or UI. Only ONE waist-up student cutout. Do not copy any of the reference background/card graphics. Portrait-oriented canvas. Deliver transparent PNG.
```

### 알파 보정 요청

```text
Edit this exact character image: remove ALL of the gray-and-white checkerboard background and replace it with REAL transparent alpha pixels (alpha zero outside the character). This is a background-extraction task, not redrawing. Preserve the boy's face, hair, eyes, expression, clothes, colors, hands, pose, and framing exactly. The checkerboard is unfortunately baked into the RGB original and must not remain. Export an RGBA PNG, with actual transparency rather than a picture of transparency. Do not add a new background color, a checker pattern, glow, shadow or white halo. Keep antialiased hair and cloth edges. One unchanged student cutout only.
```

## 5회 검토·다음 게이트

1. 최신 승인: 배경 승인만 반영. 인물 얼굴/이름·설정 자동 확정 없음.
2. 시각: 학생 비율, 갈색 머리/눈, 남색·청록 의상, 상반신과 양손 확인. 과한 금색 문장·별·회로 없음. 실제 표시 크기 검수는 미완료.
3. 포즈: 기본 준비 자세를 제공하지만 시전/방어/복귀 프레임은 없음. 넥타이 등 세부는 이번 후보 제안이며 최종 인물 정체성 확정 전.
4. 기술: RGB 반례를 발견, 모델 편집으로 1회 교정 시도했으나 실패. 체크무늬를 투명으로 오인하거나 runtime 승격하지 않음.
5. 소비처/권리/보존: 신규 portrait 후보만 추가. 배경의 승인 해시 유지. 테스트·UI·기기·애니메이션·상업 권리 PASS 주장 없음.

다음 사용자 검토는 얼굴·의상·기본 포즈의 채택 여부다. 실제 투명 원본 확보는 별도 기술 잔여 작업이며, 시각 승인만으로 해제하지 않는다. 확정된 얼굴 없이 준비/시전/방어 포즈 대량 제작을 하지 않는다. 반복 RGB 실패는 프로젝트 학습으로 기록하며 Base에 검증기나 새 스킬을 무단 추가하지 않는다.
