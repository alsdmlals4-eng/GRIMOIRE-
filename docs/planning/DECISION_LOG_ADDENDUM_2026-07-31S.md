# GRIMOIRE Decision Log Addendum — 2026-07-31S

## 문서 상태

```yaml
status: ACTIVE_LATEST_USER_DECISION_AUTHORITY
previous: docs/planning/DECISION_LOG_ADDENDUM_2026-07-31R.md
date: 2026-07-31
basis: 사용자의 프로젝트별 상황 화면 설계·구현 명세 작업지시문
```

## GM-SITUATION-SCREEN-WORKFLOW-01 — 프로젝트 상황별 인게임 화면 명세 작업 원칙

상태: `APPROVED_PROJECT_WORK_PRINCIPLE`

앞으로 프로젝트별 인게임 화면·상황 구현 명세는 다음 순서를 따른다.

```text
프로젝트 권위 문서·실제 파일 확인
→ 프로젝트 핵심 경험 정의
→ 필수 기준 화면 4종 조사
→ 실제 플레이 상황 도출
→ P0~P3 우선순위
→ P0 A~T 상세 명세
→ 전체 전환도·의존 관계
→ 상황 보드
→ 완료 기준·테스트
→ Base 승격 후보·프로젝트 전용 분리
```

필수 기준 화면:

1. 메인·시작 화면.
2. 전투 또는 프로젝트 핵심 플레이 화면.
3. 인벤토리 또는 보유 지식·자원 관리 대응 화면.
4. 결과 화면.

프로젝트에 전통적 전투·인벤토리가 없으면 대응 화면을 찾고, 없으면 `NOT_APPLICABLE / NOT_DEFINED`로 표시한다. 신규 기능은 제안으로 분리한다.

책임 원본:

- `docs/workflows/PROJECT_SITUATION_SCREEN_IMPLEMENTATION_SPEC_WORK_ORDER.md`

Base 승격 상태:

- `CANDIDATE`
- 다른 프로젝트 적용 결과 비교 후 별도 승인.

## GM-SITUATION-SCREEN-SPEC-01 — GRIMOIRE 상황별 화면·상태 구현 설계

상태: `USER_REVIEW_REQUIRED / TECHNICAL_DESIGN_ONLY`

작성 완료 범위:

- 프로젝트 핵심 경험·시각·UI·UX 현황.
- 실제 제품 파일 존재 여부 감사.
- 필수 기준 화면 4종.
- 대표 상황 P0~P3.
- P0 상황 10개 A~T 상세 구현 명세.
- Persistent ApplicationRoot, World Scene 교체, CanvasLayer Overlay, Snapshot, Signal, Resource, Save 구조.
- 전체 상태 전환도·시스템 의존·공통 UI·전용 UI.
- Vertical Slice 구현 순서·테스트 전략.
- 9칸 상황 보드.

책임 원본:

- `docs/superpowers/specs/2026-07-31-grimoire-situation-screen-design.md`
- `docs/superpowers/specs/grimoire-situations/P0_01_ENTRY_FIELD_DIALOGUE.md`
- `docs/superpowers/specs/grimoire-situations/P0_02_SCHEDULE_SPELL_BATTLE.md`
- `docs/superpowers/specs/grimoire-situations/P0_03_RESULT_RETURN_GRIMOIRE.md`
- `docs/superpowers/specs/grimoire-situations/SITUATION_BOARD_AND_BACKLOG.md`

벤치마킹:

- `docs/planning/benchmarks/GM_SITUATION_SCREEN_ARCHITECTURE_BENCHMARK_2026-07-31.md`
- 공식 Godot 문서 기반 `STANDARD / COMPLETE`.

## 확정·제안 경계

확정:

- 16:9 가로형.
- 고정·장면 기반 3/4 필드.
- 3.5~4등신 SD.
- 같은 장소 배경 위 반신 대화.
- 별도 고정 3/4 전술 전투장.
- 작성 Overlay.
- 결과 Field 반영.
- `흐름 / 집중 / 분산`.
- 자유일정 `휴식 / 준비 / 교류`.
- 마도서 인과 기록.

설계 제안·사용자 검토 대상:

- ApplicationRoot·WorldHost·UIHost 구체 구조.
- 최소 Main Menu 구성.
- 마도서 화면 탭·배치.
- custom Resource·Save JSON·Sheet export Pipeline.
- P0 Scene·Script 경로와 Signal 명칭.
- 전투 이동·시간 정책의 교체 가능한 구조.

미확정:

- `ART-STYLE-01` 후보 선택.
- 내부 해상도·Asset pixel size.
- 전투 Pause/Slow/Realtime.
- 입력 인식 알고리즘·허용치.
- 테스트 Framework.

## 저장소 감사 결과

```text
project.godot = NOT_FOUND
*.tscn = NOT_FOUND
*.gd = NOT_FOUND
*.tres = NOT_FOUND
제품 구현 = NOT_STARTED
```

문서 계약은 재사용 가능하지만 실제 Scene·Script·Resource와 연결됐다고 주장하지 않는다.

## 구현 권한

```text
CODEX = BLOCKED
GODOT_IMPLEMENTATION = NOT_STARTED
PRODUCT_FILE_CREATION = NOT_AUTHORIZED
ART-STYLE-01 = USER_DECISION_REQUIRED
```

이 명세의 사용자 검토가 완료돼도 Art·Asset·Audio·통합 검수와 기술 계획 승인 전 구현 권한을 부여하지 않는다.
