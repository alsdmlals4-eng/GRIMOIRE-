# GRIMOIRE: 세계를 다시 쓰는 법

마법 글자의 의미를 배우고 직접 주문을 설계해 상황의 규칙을 바꾸는 마법학교 성장 RPG입니다.

## 프로젝트 상태

| 항목 | 현재 기준 |
|---|---|
| 1차 플랫폼 | `PC` |
| 후속 플랫폼 | `Mobile` |
| 엔진 기준 후보 | `Godot 4.7.1 stable` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| 기획 | `APPROVED` |
| Art Style | `APPROVED_A_MODIFIED_LOCKED` |
| Art Bible | `APPROVED_DUAL_STANDARD_ART_BIBLE` |
| 전투 규칙 | `APPROVED_SITUATION_RESOLUTION_RULES` |
| 다음 제품 Gate | `ASSET-SPEC-01` |
| 병행 설계 | `BOSS-PHASE-01` |
| Codex | `BLOCKED` |
| 구현 | `NOT_STARTED` |
| Runtime·사람 검증 | `NOT_RUN` |

저장소에는 아직 실행 가능한 Godot 제품 프로젝트가 없습니다. 외부 Godot 실행 파일은 개발 도구 참고 자료이며 프로젝트 소스나 배포 자산이 아닙니다.

## 시작 순서

1. `AGENTS.md`
2. `START_HERE.md`
3. `docs/ACTIVE_CONTEXT.md`
4. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
5. `docs/planning/DECISION_LOG_ADDENDUM_2026-08-01F.md`
6. `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`
7. `docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md`
8. `docs/planning/BATTLE_RULES_01_APPROVAL_2026-08-01.md`
9. `docs/DEVELOPMENT_GATES.md`
10. `docs/DESIGN_DOCUMENT_REGISTRY.json`

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

- 목표 `45~50분`, 콘텐츠 상한 `53분`, 하드 상한 `60분`.
- 글자 `흐름 / 집중 / 분산`.
- 자유일정 `휴식 / 준비 / 교류`.
- 직접 작성 성공 7회, 안내형 복구 포함 목표 상한 10회.
- 메인 동반 정령 초기 형상 1개, 수호형 보조 소환수 1체.
- 마도서는 해결 과정·결과·부작용·발견을 기록하며 자동 주문 Stock이 아닙니다.

## Art Bible

- Soft Storybook 배경 + 선명한 Anime Cel 캐릭터.
- Navy/Gold UI + 고대비 Blue Glyph.
- 고정 3/4 Field, 같은 장소 Half-body Dialogue, 별도 Battle, Result 후 Field 복귀.
- 고정 주인공 1명, 전투 상시 초상 1개.
- 동반 정령·수호 소환수 상태 배지.
- 우측 Writing Panel은 축소 Rail에서 작성 시 확장.
- Grimoire 파생 화면을 Main보다 먼저 설계.

잠긴 기준 이미지 SHA-256:

`b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`

원본은 수정·재생성하지 않습니다.

## 전투

```text
강한 적 1개체·공격 Timer
→ 우측 글자 작성
→ [구현]
→ 마나 검증·즉시 시전
→ 적 불안정도·환경 변화
→ 진정 또는 다음 공격
```

- 일반 적은 단일 페이즈.
- 판단·작성 중 Timer 진행, 시스템 해결 중 정지.
- 기본 적은 HP 0 처치가 아니라 `불안정도 0 → 진정·해결`.
- 플레이어 HP 0 또는 선언된 치명적 환경 붕괴가 패배.
- 환경 보존도·부작용·남은 HP·해결 방식이 결과 품질을 결정.
- 수호 소환수는 다음 공격 피해를 완화하지만 Timer·작성·판단을 대행하지 않습니다.

## Base v9.3

- Release Commit: `30ca6c7b5f93521f0eb0eed42d01437cd43c50ae`.
- Evidence Commit: `462a86db192d23d0f386281a1eb54b0a8cbad62e`.
- Registry SHA-256: `9847bb2b225c776ad7916930f0f48c490bc2a898bea8e02ea1fdd0e6caac60c1`.
- Canonical Adapter: `skills/PROJECT_BASE_ADAPTER.json`.
- Generated View Check: `python tools/generate_project_operating_views.py --check`.

## 작업 원칙

- 새 시스템·핵심 규칙·콘텐츠 구조·UX 흐름은 벤치마킹 후 설계.
- 주요 변경·승인은 같은 Decision ID로 GitHub 권위 문서·계획 데이터·Google Sheet에 즉시 반영.
- 작업 브랜치 동기화와 main 병합 상태를 구분.
- 실행하지 않은 Runtime·성능·접근성·사람 검증을 완료 처리하지 않음.
- Godot 제품 구현은 Asset Spec·Audio·통합 검수·Codex Plan·기술 검수 뒤 시작.

## 다음 경로

```text
ASSET-SPEC-01
→ BOSS-PHASE-01·Grimoire/Main 파생 화면
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ Codex Plan 승인·기술 검수
→ 구현
```
