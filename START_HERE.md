# GRIMOIRE 시작 지점

> 과거 대화 없이 현재 상태와 다음 작업을 복원하는 첫 화면이다.

## 한눈에 보기

| 항목 | 현재 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
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
| 구현 | `NOT_STARTED` |
| Codex | `BLOCKED` |
| 정본 동기화 | `WORKING BRANCH / MAIN PENDING` |

## 먼저 읽을 문서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
4. `docs/planning/DECISION_LOG_ADDENDUM_2026-08-01F.md`
5. `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`
6. `docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md`
7. `docs/planning/BATTLE_RULES_01_APPROVAL_2026-08-01.md`
8. `docs/DEVELOPMENT_GATES.md`
9. `docs/DESIGN_DOCUMENT_REGISTRY.json`
10. `skills/PROJECT_BASE_ADAPTER.json`

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
→ 우측에 글자 작성
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
- 수호 소환수는 다음 공격 피해를 완화하지만 시간·작성·판단을 대행하지 않는다.

## 현재 화면·아트

- 16:9 고정 3/4 Field.
- Field SD와 같은 장소 Half-body Dialogue.
- 별도 고정 3/4 Battle.
- 좌측 하단 주인공 초상 1개, 우측 축소→확장 Writing Panel.
- Soft Storybook 배경 + 선명한 Anime Cel 캐릭터.
- Navy/Gold UI + Blue Glyph.
- Result 후 원래 Field 변화로 복귀.
- Grimoire 파생 화면을 Main보다 먼저 설계.

잠긴 기준 이미지 SHA-256:

`b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`

원본은 수정·재생성하지 않는다.

## Base v9.3

- Release: `30ca6c7b5f93521f0eb0eed42d01437cd43c50ae`.
- Evidence: `462a86db192d23d0f386281a1eb54b0a8cbad62e`.
- Registry: `9847bb2b225c776ad7916930f0f48c490bc2a898bea8e02ea1fdd0e6caac60c1`.
- Adapter: `skills/PROJECT_BASE_ADAPTER.json`.
- Generated view check: `python tools/generate_project_operating_views.py --check`.

## 다음 작업

```text
ASSET-SPEC-01
→ BOSS-PHASE-01·Grimoire/Main 파생 화면
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ Codex Plan 승인·기술 검수
→ 구현
```

정확한 공격 간격·피해·마나·불안정도 변화량·수호 완화율은 Prototype·사람 검증이 필요한 `PLAYTEST_TUNING_REQUIRED`다.

## 현재 금지

- 기본 브랜치 직접 수정.
- Godot 제품 코드·Scene·Resource·게임 데이터 생성.
- Codex Build.
- 잠긴 기준 이미지 편집·재생성.
- Asset Spec 전 대량 Asset 제작.
- 런타임·PC·Mobile·사람 검증을 실행 없이 완료 처리.
