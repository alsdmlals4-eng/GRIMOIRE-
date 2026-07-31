# GRIMOIRE Decision Log Addendum — 2026-07-31U

## 1. 사용자 최신 결정

사용자는 제공된 GRIMOIRE 화면 보드 이미지를 이후 아트·화면 구성 기준으로 사용하고 수정하지 않도록 승인했다.

> 아트이미지는 이걸로 잡고가자 수정하지마

## 2. Decision ID

### ART-STYLE-01

```yaml
previous_status: USER_DECISION_REQUIRED
new_status: APPROVED
selected_candidate: A_MODIFIED
selected_name: Soft Storybook Cel 2D Hybrid
locked_reference: true
source_image_edit: PROHIBITED
next_product_gate: ART-BIBLE-01
```

### GR-VISUAL-SITUATION-BOARD-01

```yaml
previous_status: REWORK_REQUIRED_USER_REVIEW_REQUIRED
new_status: APPROVED_LOCKED_REFERENCE_BOARD
role: VISUAL_DIRECTION_AND_SCREEN_COMPOSITION_AUTHORITY
implementation_status: NOT_STARTED
```

## 3. 승인 이미지 식별

- Library 경로: `/GRIMOIRE/Visual Authority/GRIMOIRE_ART_STYLE_01_LOCKED_REFERENCE.png`
- File ID: `file_0000000061bc81fa93d8b1b30d553943`
- 크기: `662 × 455 px`
- SHA-256: `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`
- Manifest: `docs/planning/visual/ART_STYLE_01_LOCKED_REFERENCE_MANIFEST.json`
- 승인 정본: `docs/planning/ART_STYLE_01_APPROVAL_2026-07-31.md`

## 4. 보호되는 시각 계약

```text
가로형 16:9
+ 장면 기반 고정 3/4 학교 필드
+ 필드 SD 캐릭터·동반 정령
+ 같은 장소 배경의 대화 반신
+ 탐색·비전투 작성 Overlay
+ 별도 고정 3/4 전술 전투장
+ 전투 중 작성 Overlay
+ 결과 후 원래 장면 복귀
```

원본 이미지 자체의 수정·재생성·크롭·리터치·패널 재배치·텍스트 교체·색 변경은 금지한다.

## 5. 이전 이미지 판정 정리

- 이번 승인 이미지: `APPROVED_LOCKED_REFERENCE`.
- 이전 generic dark fantasy 조사·인벤토리형 생성물: `REJECTED_NOT_AUTHORITY` 유지.
- 이전 기술 대시보드형 생성물: `REJECTED_AS_PRIMARY_ARTIFACT` 유지.
- 승인 이미지 이후 새 목업은 원본을 편집하지 않고 별도 파생 파일로만 제작한다.

## 6. 게이트

```text
ART-STYLE-01 = APPROVED
ART-BIBLE-01 = NEXT_PRODUCT_GATE
ASSET-SPEC-01 = BLOCKED_BY_ART_BIBLE
AUDIO-DIRECTION-01 = PENDING
CODEX = BLOCKED_BY_ART_BIBLE_ASSET_SPEC_AND_INTEGRATED_REVIEW
GODOT = NOT_STARTED
```

Art Style 승인만으로 구현·대량 자산 제작·최종 파일 규격 승인으로 간주하지 않는다.

## 7. 정본 동기화 요구

같은 `ART-STYLE-01` Decision ID로 다음을 갱신한다.

- GitHub 승인 정본·Machine State·후보 문서.
- GRIMOIRE 비주얼 보드 상태.
- Google Sheet `01·02·05·60·70·71·72·80·99`.
- 동기화 영수증.

working branch와 main 상태를 분리하며 PR #22 병합 전 `SYNCED_TO_MAIN`으로 표기하지 않는다.
