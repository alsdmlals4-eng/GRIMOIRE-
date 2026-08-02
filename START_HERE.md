# GRIMOIRE 시작 지점

> 과거 대화 없이 현재 상태와 다음 작업을 복원하는 첫 화면이다.

## 한눈에 보기

| 항목 | 현재 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 1차 플랫폼 | `Mobile` |
| 후속 플랫폼 | `PC` |
| 플랫폼 Decision | `GM-PLATFORM-02` (`GM-PLATFORM-01` 대체) |
| 엔진 기준 후보 | `Godot 4.7.1 stable` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| 기획 | `APPROVED` |
| Art Style | `APPROVED_A_MODIFIED_LOCKED` |
| Art Bible | `APPROVED_DUAL_STANDARD_ART_BIBLE` |
| 전투 규칙 | `APPROVED_SITUATION_RESOLUTION_RULES` |
| Asset Spec | `APPROVED_SPEC` |
| 현재 제품 Gate | `MOBILE-FOUNDATION-01` |
| 후속 설계 | `BOSS-PHASE-01 / GRIMOIRE-SCREEN-01 / AUDIO-DIRECTION-01` |
| 구현 | `NOT_STARTED` |
| Codex | `BLOCKED` |
| Base | `v9.4.0` |
| main 기준선 | `fe88236946a87362a43aafe598348b84c42a2243` |
| 현재 Sync | `GR-SYNC-20260802-07 / SYNCED_TO_MAIN / SHEET_READBACK_PASS` |
| Authority Commit | `fe88236946a87362a43aafe598348b84c42a2243` |
| main Merge Commit | `fe88236946a87362a43aafe598348b84c42a2243` |
| 병합 PR | `#27 / MERGED / CI·ADVERSARIAL PASS` |
| Sync Receipt | `docs/planning/sync/GR-SYNC-20260802-07-MAIN.md` |

## 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
4. `docs/planning/PLATFORM_MOBILE_FIRST_02_2026-08-02.md`
5. `docs/planning/PROJECT_ADVERSARIAL_AUDIT_2026-08-02.md`
6. `docs/planning/sync/GR-SYNC-20260802-07-MAIN.md`
7. `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`
8. `docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md`
9. `docs/planning/BATTLE_RULES_01_APPROVAL_2026-08-01.md`
10. `docs/planning/ASSET_SPEC_01_APPROVAL_2026-08-01.md`
11. `docs/DEVELOPMENT_GATES.md`
12. `skills/PROJECT_BASE_ADAPTER.json`

## 현재 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

## Vertical Slice

```text
첫 수업·교내 연습
→ 자유일정 A
→ 첫 실기시험
→ 자유일정 B
→ 학교축제
→ 자유일정 C
→ 첫 현장실습
→ 귀환·마도서 기록
```

- 글자: `흐름 / 집중 / 분산`.
- 목표 `45~50분`, 콘텐츠 상한 `53분`, 하드 상한 `60분`.
- 직접 작성 성공 7회, 안내형 복구 포함 목표 상한 10회.
- 메인 동반 정령 초기 형상 1개, 수호형 보조 소환수 1체.
- 마도서는 해결 과정·결과·부작용·발견을 기록하며 자동 주문 Stock이 아니다.

## 현재 전투

```text
강한 적 1개체
→ 다음 공격 예고·타이머
→ 글자 작성
→ [구현]
→ 마나 검증·즉시 시전
→ 적 불안정도·환경 변화
→ 진정 또는 다음 공격
```

- 일반 적은 단일 페이즈.
- 판단·작성 중 타이머 진행, 시스템 해결 중 정지.
- 기본 적의 승리는 HP 0 처치가 아니라 `불안정도 0 → 진정·해결`.
- 플레이어 HP 0 또는 선언된 치명적 환경 붕괴가 패배.
- 환경 보존도·부작용·남은 HP가 결과 품질을 만든다.

## 현재 화면·아트

- 승인 기준은 16:9 고정 3/4 Field, 같은 장소 Half-body Dialogue, 별도 Battle, Result 후 Field 복귀다.
- Soft Storybook 배경 + Anime Cel 캐릭터, Navy/Gold UI + Blue Glyph.
- Grimoire 파생 화면을 Main보다 먼저 설계한다.
- 잠긴 기준 이미지 SHA-256: `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`.
- 기존 16:9·PC 해상도 규격은 보존되지만 Mobile 실기기 적합성은 `NOT_RUN`이다.

## Mobile 우선 전환

`GM-PLATFORM-02`에 따라 1차 플랫폼을 Mobile로 전환했다. 기존 PC 중심 입력은 후속 적응 자료로 보존한다.

`MOBILE-FOUNDATION-01`에서 확정·검증할 항목:

- Touch·Stylus 작성, 후보 선택, Undo·부분 삭제·초기화·취소·확정·구현.
- 방향·화면 비율·Safe Area·Notch·System gesture.
- 작은 화면에서 적 위험·상태·작성 Panel의 가림 방지.
- App pause/resume, background/foreground, interrupted stroke, stale request.
- Device·Memory·Texture·load·frame pacing·battery·thermal 검증 계획.
- 후속 PC의 Mouse/Pen/Keyboard 적응 원칙.

Android/iOS, Store, 가로/세로, 최소 기기, 성능 수치, 인식 처리 방식은 아직 확정하지 않는다.

## Base v9.4

- Release: `a728712cb776ec98f4875914a580fcf7d0156593`.
- Evidence: `ef1fba11167e4da0b298123b0c85ebd268191a42`.
- Finalization: `87a0b54c2847ce4b685879209205957c170cc1cd`.
- Registry: `693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59`.
- Adapter: `skills/PROJECT_BASE_ADAPTER.json`.
- Adapter SHA-256: `980e2f4e21bd09ac49946f90d095680220013cbab6cdf62421fc01ca1b7be8c5`.

## 검증된 운영 상태

PR #27 final workflow run `30728196595`에서 다음을 통과했다.

- Generator check.
- Base v9.4·Mobile-first 회귀 단위 테스트.
- JSON·Registry·권위 경로 검사.
- Adversarial gate.

Generator의 구형 `PC/ASSET_SPEC_01` 하드코딩도 Adapter 파생형으로 교정했고, Snapshot·Compatibility View를 재생성했다.

## 다음 작업

```text
적대적 총기획 감사
→ 핵심 기획 충돌만 Grill Me
→ 승인된 기획 정본·Sheet 즉시 동기화
→ MOBILE-FOUNDATION-01
→ BOSS-PHASE-01·Grimoire/Main 영향 재검토
→ AUDIO-DIRECTION-01
→ Mobile 기준 통합 검수
→ Codex Plan 승인·기술 검수
→ 구현
```

## 현재 검증 경계

- Sheet 14개 탭 Readback: `PASS`.
- Generator·Generated Views: `PASS / CURRENT`.
- Unit·JSON·Registry·Adversarial CI: `PASS`.
- PR #27: `MERGED`; GitHub·Sheet `SYNCED_TO_MAIN`.
- Godot Runtime·Mobile device·PC adaptation·성능·접근성·사람 플레이: `NOT_RUN`.

## 현재 금지

- 기본 브랜치 직접 수정.
- Godot 제품 코드·Scene·Resource·게임 데이터 생성.
- Codex Build.
- 잠긴 기준 이미지 편집·재생성.
- OS·방향·성능·인식 수치를 증거 없이 확정.
- 런타임·Mobile device·성능·접근성·사람 검증을 실행 없이 완료 처리.
