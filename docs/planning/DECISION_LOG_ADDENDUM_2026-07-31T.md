# GRIMOIRE Decision Log Addendum — 2026-07-31T

## 문서 상태

```yaml
status: ACTIVE_LATEST_USER_DECISION_AUTHORITY
date: 2026-07-31
timezone: Asia/Seoul
working_branch: agent/grimoire-v93-canon
pull_request: 22
implementation_authority: NONE
```

## 1. 승인 결정 — GM-VISUAL-SITUATION-BOARD-WORKFLOW-01

사용자가 프로젝트 전반에 적용할 **비주얼 중심 「상황별 인게임 화면 명세 보드」 작업 원칙**을 승인했다.

### 핵심 원칙

1. 산출물의 중심은 기술 감사가 아니라 **구현 후 실제 화면의 모습**이다.
2. 최종 산출물은 다음 순서를 따른다.

```text
프로젝트 핵심 경험
→ 비주얼 기준 보드
→ 필수 화면 4종
→ 핵심 상황별 화면 시퀀스
→ 전체 화면 전환도
→ 구현 명세 부록
→ 적대적 검토
```

3. 필수 기준 화면은 다음이다.

- 메인 화면.
- 전투 또는 핵심 플레이 화면.
- 인벤토리 또는 자원 관리 대응 화면.
- 결과 화면.

4. 모든 화면·요소는 다음 근거 수준을 구분한다.

- `CURRENT`.
- `INFERRED`.
- `PROPOSED`.
- `PLACEHOLDER`.

5. 기존 이미지·와이어프레임·캐릭터·마스코트·화면 구도가 존재할 경우 이를 우선 근거로 사용한다.
6. 프로젝트에 없는 일반 장르 UI나 다른 비주얼을 현재 방향처럼 사용하지 않는다.
7. 한 장에 모든 내용을 압축하지 않고, 화면이 읽히는 크기로 여러 보드에 분리한다.
8. 기술 구조·데이터·테스트는 `PART D` 부록으로 이동한다.
9. 여섯 단계 적대적 검토에서 FAIL이 남으면 완료로 보고하지 않는다.
10. 공통 템플릿은 Base 승격 후보이며 프로젝트 고유 아트·마스코트·연출은 프로젝트 전용으로 유지한다.

책임 원본:

- `docs/workflows/PROJECT_VISUAL_SITUATION_SCREEN_BOARD_WORK_ORDER.md`

## 2. 이전 상황 명세의 역할 변경

### 이전 결정

- `GM-SITUATION-SCREEN-WORKFLOW-01`.
- `GM-SITUATION-SCREEN-SPEC-01`.

### 변경된 역할

기존 A~T 상황별 구현 명세는 폐기하지 않지만, 사용자에게 먼저 보여 줄 메인 산출물 역할을 잃는다.

```text
기존 기술 명세
= SUPPORTING_APPENDIX_ONLY

새 비주얼 중심 화면 보드
= PRIMARY_USER_REVIEW_ARTIFACT
```

기존 기술 명세는 Scene·Node·Resource·Signal·Save·테스트·Codex Plan 입력용 부록으로만 사용한다.

## 3. GRIMOIRE 기존 결과물 교정 판정

### 사용자 피드백

이전 생성 결과는 다음 문제로 부적합 판정을 받았다.

- 기존 GRIMOIRE 게임 구성과 이미지에서 벗어남.
- 일반 다크 판타지·조사·인벤토리 게임처럼 재해석됨.
- 기존 마법학교, 필드 SD, 반신 대화, 직접 글자 작성, 별도 전술 전투장, 정령수 방향이 충분히 보존되지 않음.
- 화면보다 기술 보고서와 작은 표가 중심이 됨.

### 판정

```yaml
previous_generated_visual_board: REJECTED_NOT_AUTHORITY
previous_technical_dashboard_style: REJECTED_AS_PRIMARY_ARTIFACT
previous_text_spec: RETAINED_AS_TECHNICAL_APPENDIX
new_grimoire_visual_board: REWORK_REQUIRED
```

이전 생성 이미지는 프로젝트 비주얼 정본·아트 승인·UI 승인 근거로 사용하지 않는다.

## 4. GRIMOIRE 재작업 시 필수 근거

재작업 보드는 다음 기존 프로젝트 요소를 우선 보존한다.

- 마법학교 생활과 수업·시험·축제·현장실습.
- 장면 기반 가로 16:9 3/4 필드.
- 필드 SD 캐릭터.
- 같은 장소 배경 위 대화용 반신 일러스트.
- 직접 마법 글자 작성 Overlay.
- 별도 고정 3/4 전술 전투장.
- 작은 늑대형 메인 동반 정령 초기 형상.
- 장기 정령수 성장 방향은 기존 이미지 참고 자료로만 사용하고 Vertical Slice 런타임 범위를 확장하지 않음.
- 결과 후 원래 필드 환경 변화 복귀.
- 마도서의 상황·의도·결과·부작용·발견 기록.

`ART-STYLE-01`이 미승인이므로 신규 그림체를 확정하지 않는다. 기존 이미지 기반 재구성은 `CURRENT / INFERRED`, 신규 레이아웃은 `PROPOSED`, 임시 시각 자료는 `PLACEHOLDER`로 표시한다.

## 5. 다음 GRIMOIRE 시각 산출물

다음 결과는 한 장 종합 대시보드가 아니라 최소 다음 보드로 분리한다.

1. `BOARD-GR-A` 프로젝트 비주얼 기준.
2. `BOARD-GR-B1` 필드·대화 화면.
3. `BOARD-GR-B2` 직접 작성·전술 전투 화면.
4. `BOARD-GR-B3` 마도서·결과 화면.
5. `BOARD-GR-C1` 수업·연습 시퀀스.
6. `BOARD-GR-C2` 시험·축제 시퀀스.
7. `BOARD-GR-C3` 현장 전투·환경·귀환 시퀀스.
8. `BOARD-GR-D` 전체 화면 전환도와 최소 기술 부록.

각 화면은 UI가 읽히는 크기로 제작하고 근거 태그를 표시한다.

## 6. 구현·승인 경계

- Godot 구현: `NOT_STARTED`.
- Codex: `BLOCKED`.
- 이미지 재생성: 사용자가 명시적으로 화면 보드 생성을 요청한 경우에만 수행.
- `ART-STYLE-01`: `USER_DECISION_REQUIRED` 유지.
- 기존 기술 명세 승인: 취소가 아니라 `SUPPORTING_APPENDIX_ONLY`로 역할 변경.
- 새 GRIMOIRE 비주얼 보드: `REWORK_REQUIRED / USER_REVIEW_REQUIRED`.
- PR 병합: 사용자 승인 전 금지.

## 7. Base 승격 구분

### Base 승격 후보

- 비주얼 중심 보드 4-Part 템플릿.
- 필수 화면 4종 기준.
- 근거 수준 태그.
- 화면 판독성·분할 규칙.
- 여섯 단계 적대적 검토.
- 공통 화면 전환도 규칙.

### 프로젝트 전용 유지

- GRIMOIRE 그림체와 마법학교 정서.
- 주인공·교수·동급생·동반 정령.
- 마법 글자 `흐름 / 집중 / 분산`.
- 직접 작성 UX.
- 별도 전술 전투장.
- 마도서 기록.
- 수업·시험·축제·현장실습 화면 연출.
