# 스펠 Gate 2 진입 전 적대적 검토 루프 — 2026-07-27

## 1. 문서 상태

- 검토 ID: `GM-VS-REVIEW-LOOP-01`
- 기준 승인: `GM-GATE1-APPROVAL-01`
- 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- 검토 Work Mode: `REVIEW`
- 구현: `NOT_STARTED`
- Codex: `NOT_RUN`
- 런타임 검증: `NOT_RUN`
- 최종 판정: `PASS_WITH_FOLLOWUP`
- 시각 표현 Follow-up: `RESOLVED_BY_GM-VISUAL-PRESENTATION-01`
- 아트·사운드 대량 제작: `BLOCKED_BY_CHARACTER_PRESENTATION_ART_BIBLE_ASSET_SPEC_AND_AUDIO_DIRECTION`
- 다음 차단 결정: `GM-CHARACTER-PRESENTATION-01`

## 검토 결과 요약

1. Gate 1 코어와 Vertical Slice 범위는 유지한다.
2. 수업·시험·학교축제·현장실습과 자유일정 3회를 유지한다.
3. 모든 세션은 공통 `Situation Challenge`를 사용한다.
4. 그림체보다 화면 방향·카메라·게임 표현 구조를 먼저 결정한다.
5. 캐릭터·배경·효과·사운드 대량 제작 전 Art Bible과 Asset Specification을 승인한다.
6. 생성·편집 자산은 도구·프롬프트·참조·파생 관계·사용자 승인·런타임 검증을 기록한다.
7. 실행 프로필 전환은 아트·사운드 프리프로덕션 이후로 이동한다.
8. 화면 구조는 가로형 하이브리드 2D로 확정됐다.

## 다섯 렌즈 판정

| 렌즈 | 주요 Finding | 판정 |
|---|---|---|
| 요구·정체성·정본 | README·계약·Skill Registry·Asset Ledger 상태 회귀 | `MUST_FIX / FIXED` |
| 논리·Core Loop | 네 세션이 동일 해법으로 고착될 위험 | `SHOULD_FIX / Problem Differentiation Matrix` |
| 데이터·저장·자산 | Save Schema·ID·생성 이력 미정 | `TECHNICAL_REVIEW_PROPOSAL` |
| 모바일 UX·접근성 | 화면 방향·카메라·주인공 표현 미정 | `PARTIAL_RESOLUTION: VISUAL CONFIRMED / CHARACTER PENDING` |
| 아트·사운드·통합 | 자산 예산·FX 가독성·사운드 우선순위 미정 | `SHOULD_FIX / UNVERIFIED` |

## MUST_FIX 반영

- README 최신화
- Vertical Slice 계약 승인본 정렬
- Skill Registry 최신화
- Asset Ledger 생성·편집 자산 추적 규칙 추가
- Active Context·Development Gates·Registry의 다음 결정 변경
- 가로형 하이브리드 2D 시각 표현 책임 원본 추가

## 시각 표현 Follow-up 해결

결정: `GM-VISUAL-PRESENTATION-01`

```text
가로형
+ 고정·장면 기반 3/4 월드
+ 기존 배경 위 대화 초상
+ 월드 감속·암전형 마법 작성 오버레이
+ 같은 장면에서 적·환경·보조 소환수 확인
```

보호:

- 기준 구도 16:9
- 18:9~20:9는 좌우 월드 확장
- 학교 장면은 수업·시험·자유일정·축제 상태로 재사용
- 현장 장면은 전투·환경·복구 상태로 재사용
- 작성 중 월드·대상·위험·소환수 상태 유지
- 자유 이동형 대형 학교·자유 카메라·복잡한 2.5D 제외

## 다음 필수 산출물

- `Problem Differentiation Matrix`
- `Character Presentation Contract`
- `Visual Asset Budget`
- `Art Bible`
- `Asset Specification`
- `Audio Direction Card`
- `Save Schema v1` — 구현 계획 전

## 보호 대상

- `CORE_CONFIRMED`
- 의미 기반 글자·직접 작성·상황 조합
- 수업·시험·축제·현장실습
- 자유일정 3회
- 메인 동반·전투 보조 소환수
- 첫 완주 45~50분 목표·60분 상한
- 가로형 하이브리드 2D
- 별도 CORE_POC 재도입 금지
- M0~M4 Validation-First 순서

## Regression Recheck

| 검사 | 결과 |
|---|---|
| Gate 1 승인·코어 유지 | `PASS` |
| 핵심 세션·자유일정 유지 | `PASS` |
| 범위 팽창 없음 | `PASS` |
| 구현·Codex 미실행 | `PASS` |
| 런타임 미검증 상태 유지 | `PASS` |
| 정본 회귀 교정 | `PASS` |
| 화면 방향·카메라·표현 구조 | `PASS / CONFIRMED` |
| 캐릭터 표현·그림체·자산 규격 | `FOLLOWUP_REQUIRED` |

## 최종 판정

- 제품·코어: `NO_CHANGE`
- Slice 범위: `NO_CHANGE_WITH_PRODUCTION_GUARDRAILS`
- 시각 표현: `CONFIRMED_BY_GM-VISUAL-PRESENTATION-01`
- 구현 프로필: `DEFERRED_UNTIL_VISUAL_AUDIO_PREPRODUCTION`
- 아트·사운드: `HOLD_BEFORE_CHARACTER_ART_ASSET_AUDIO_CONTRACTS`
- 최종 회귀: `PASS_WITH_FOLLOWUP`

## 다음 결정

`GM-CHARACTER-PRESENTATION-01`

> 가로형 3/4 장면에서 주인공·NPC·메인 동반 소환수·전투 보조 소환수를 어떤 비율과 자산 조합으로 표현할 것인가?
