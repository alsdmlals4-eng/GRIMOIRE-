# GRIMOIRE ART-STYLE-01 승인 정본

## 1. 결정 상태

```yaml
decision_id: ART-STYLE-01
status: APPROVED
approved_at: 2026-07-31T21:58:00+09:00
selected_candidate: A_MODIFIED
selected_name: Soft Storybook Cel 2D Hybrid
visual_board_id: GR-VISUAL-SITUATION-BOARD-01
visual_board_status: APPROVED_LOCKED_REFERENCE_BOARD
next_product_gate: ART-BIBLE-01
implementation_authority: NONE
codex: BLOCKED
godot: NOT_STARTED
main_sync: PENDING_PR_MERGE
```

사용자는 첨부 이미지의 구성을 GRIMOIRE 아트·화면 기준으로 사용하고 더 이상 수정하지 않도록 승인했다.

> 아트이미지는 이걸로 잡고가자 수정하지마

## 2. 승인된 기준 이미지

- 원본 업로드명: `image(32).png`
- 보존 파일명: `GRIMOIRE_ART_STYLE_01_LOCKED_REFERENCE.png`
- ChatGPT Library 경로: `/GRIMOIRE/Visual Authority/GRIMOIRE_ART_STYLE_01_LOCKED_REFERENCE.png`
- 파일 ID: `file_0000000061bc81fa93d8b1b30d553943`
- Library Node ID: `libfile_b61a5d166df48191b249a132142dba84`
- 형식: `PNG / RGBA`
- 크기: `662 × 455 px`
- 바이트: `748443`
- SHA-256: `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`
- Machine manifest: `docs/planning/visual/ART_STYLE_01_LOCKED_REFERENCE_MANIFEST.json`

해시가 다른 파일은 동일한 승인 기준 이미지로 취급하지 않는다.

## 3. 승인된 시각·화면 구성

다음 조합을 GRIMOIRE의 아트·화면 기준으로 승인한다.

```text
필드 SD
+ 대화 반신 일러스트
+ 탐색·비전투 상황의 직접 글자 작성 Overlay
+ 별도 고정 3/4 전술 전투장
+ 전투 중 별도 작성 Overlay
+ 결과 확인 후 원래 장면 복귀
```

보호되는 화면 언어:

1. 가로형 `16:9`.
2. 학교 탐색·자유일정은 장면 기반 고정 3/4 필드.
3. 필드에서는 SD 주인공·NPC·메인 동반 정령을 함께 표현.
4. 대화는 같은 장소를 유지하며 반신 일러스트를 전면에 배치.
5. 마법 작성은 현재 상황이 보이는 감속·암전 Overlay.
6. 전투는 필드와 분리된 고정 3/4 전술장.
7. 전투 캐릭터는 필드 SD 비율·디자인 키를 공유.
8. 전투 중 작성은 별도 Overlay로 표현.
9. 결과는 전투장에 고립된 정산 메뉴가 아니라 원래 장소 변화와 연결.
10. 수업·시험·축제·현장실습의 배경 상태 변형을 같은 시각 언어로 유지.
11. 주인공·대화 캐릭터·동반 정령·보조 소환수의 얼굴·의상·실루엣을 화면 간 일관되게 유지.

## 4. 원본 잠금 계약

승인 기준 이미지 자체에는 다음을 수행하지 않는다.

- 수정.
- 재생성.
- 리터치.
- 업스케일 후 원본 대체.
- 크롭 후 원본 대체.
- 텍스트 교체.
- 패널 재배치.
- 색상 변경.
- 캐릭터·배경·UI 교체.

후속 제작물은 원본을 편집하는 방식이 아니라 **별도 파일**로 제작한다. 이후 Art Bible 또는 Asset Specification에서 세부 규격을 만들더라도 원본 승인판은 변경하지 않는다.

변경은 사용자가 같은 `ART-STYLE-01` Decision ID로 명시적으로 재승인한 경우에만 가능하다.

## 5. 이미지의 역할과 한계

이 이미지는 다음의 권위 기준이다.

- 아트 방향.
- 화면 구성.
- 필드 SD·대화 반신·전투 화면 간 관계.
- 주요 UI 영역과 정보 우선순위.
- 학교·마법 작성·전술 전투·정령 동반자 경험의 시각 연결.

다음은 아직 별도 Gate에서 확정한다.

- 실제 내부 기준 해상도.
- 최종 선 굵기와 선 색.
- 최종 팔레트와 색 스크립트.
- Font 및 실제 폰트 크기.
- 버튼·패널·아이콘의 제작 규격.
- SD·반신·전투 Sprite 실제 픽셀 크기.
- 애니메이션 프레임과 상태 수.
- VFX Shader·Particle 규격.
- BGM·SFX 방향.
- 실제 입력 인식 허용치.

따라서 이 이미지는 런타임에 그대로 배치하는 최종 게임 Asset이 아니라, 이후 모든 화면·Asset이 따라야 하는 **비주얼 방향 및 화면 구성 권위판**이다.

## 6. 게이트 변경

```text
ART-STYLE-01 = APPROVED
GR-VISUAL-SITUATION-BOARD-01 = APPROVED_LOCKED_REFERENCE_BOARD
ART-BIBLE-01 = NEXT_PRODUCT_GATE
ASSET-SPEC-01 = BLOCKED_BY_ART_BIBLE
AUDIO-DIRECTION-01 = PENDING
CODEX = BLOCKED
GODOT = NOT_STARTED
```

Art Style 승인만으로 대량 이미지 제작이나 Godot 구현 권한이 생기지 않는다.

## 7. 후속 작업

`ART-BIBLE-01`에서는 승인 이미지를 변경하지 않고 다음을 추출한다.

- 필드·반신·전투의 공통 얼굴·의상·실루엣 규칙.
- 배경의 채도·명도·조명 차이.
- 네이비·금색 UI 프레임의 역할과 사용 범위.
- 마법 글자 획과 배경 대비.
- 필드 HUD·대화창·작성 Overlay·전투 HUD·결과창의 공통 컴포넌트.
- 동반 정령과 보조 소환수의 색·형태·FX 분리.
- PC 16:9 Safe Frame과 후속 Mobile 적응 규칙.

모든 후속 산출물은 이 승인판의 SHA-256을 기준 이미지 식별자로 기록한다.
