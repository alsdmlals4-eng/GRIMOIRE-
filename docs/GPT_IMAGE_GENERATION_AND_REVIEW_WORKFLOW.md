
# Spell GPT 이미지 생성·검수 워크플로

- Base: `alsdmlals4-eng/Base@7072b9e2742a60d7548fd39df3328ad76a8dbad1`
- 활성 Prompt: `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v8.md`
- Sheet: `NOT_CONFIGURED`
- Mode: `planning-visualization`, `final-visual-candidate`, `visual-qa-and-approval`

## 기획 중 우선 이미지

1. 가로형 Hybrid 2D 필드·반신 대화·별도 전술 전투의 화면 전환 목업.
2. 마법 회로·노드·연결·비용·결과가 읽히는 주문 편집·전투 UI.
3. 학교·탐색·관계·학습·전투·성장 핵심루프 시각화.
4. 주요 인물·조연·세력·교실·현장 장소 톤 보드.
5. 주 소환수 4단계 형태 선택과 장기 동행 시트.

## 기획 종료 우선 후보

1. Demo·Google Play·PC 소개용 키아트·스크린샷·배너 후보.
2. 실제 가로형 필드·대화·전술 전투 UI 고도화 목업.
3. 주요 인물 SD 필드·반신 초상·표정·전투 컷인 시트.
4. 주문 회로·속성·소환수·장비의 반복 제작 가능한 시각 언어.

## 상태 호환

| 기존 Spell 상태 | 공용 lifecycle |
|---|---|
| `CONCEPT_EXPLORATION` | `GENERATED_EXPLORATION` |
| `VISUAL_REFERENCE_CANDIDATE` | `IN_REVIEW` 또는 `APPROVED_CANDIDATE` |
| `USER_APPROVED_VISUAL_REFERENCE` | `APPROVED_CANDIDATE` |
| `ART_BIBLE_APPROVED` | 방향 정본 승인; 개별 자산은 별도 검수 |
| `RUNTIME_ASSET_APPROVED` | `PROJECT_ASSET_APPROVED` 또는 실제 검증 후 `APPLIED_AND_RUNTIME_VERIFIED` |

공용 흐름은 `PLANNED → GENERATED_EXPLORATION → IN_REVIEW → REVISION_REQUIRED/REJECTED/APPROVED_CANDIDATE → PROJECT_ASSET_APPROVED → APPLIED_AND_RUNTIME_VERIFIED`다. 실제 화면·구현 가능성·손·표정·한글·회로 가독성·원근·광원·특정 IP 유사성·원출처·라이선스를 검수한다. 생성 이미지는 자동 최종 자산이 아니다.
