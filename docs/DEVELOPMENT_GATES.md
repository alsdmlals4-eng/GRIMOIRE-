# 스펠 개발 게이트

- 책임: 프로젝트 허브·프로덕션·통합검수
- 마지막 검토일: 2026-07-27
- 기준 브랜치: `gpt/planning-spell-20260725`
- 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- Gate 2: `ENTERED_PLANNING_ONLY_VISUAL_PREPRODUCTION`
- 적대적 검토 루프 02: `PASS_WITH_CORRECTIONS`
- 시각 표현: `LANDSCAPE_HYBRID_2D_WITH_SEPARATE_TACTICAL_BATTLE_CONFIRMED`
- 캐릭터 표현: `SD_FIELD_HALF_BODY_DIALOGUE_CONFIRMED`
- 다음 Greenlight: `ART-STYLE-01`

> 현재 승인은 콘셉트·범위·화면·캐릭터·소환수 장기 방향을 확정한다. 구현·런타임·성능·접근성·플레이테스트 통과를 의미하지 않는다.

---

## 1. 현재 제품 경로

```text
Gate 1 최종 승인 — 완료
→ Gate 2 적대적 검토 루프 01 — 완료
→ 가로형 하이브리드 2D — 완료
→ 캐릭터 표현·별도 전술 전투장 — 완료
→ 소환수 성장·형상·탑승 장기 방향 — 완료
→ 적대적 검토 루프 02·정본 복구 — 완료
→ ART-STYLE-01
→ ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 사용자 승인 후 자산 제작
→ VERTICAL_SLICE_FULL_PROFILE 전환 재검토
→ Codex read-only Plan
→ Validation-First Vertical Slice 구현
→ QA·외부 플레이테스트
```

`GM-VS-PROFILE-01`은 폐기하지 않고 시각·사운드 프리프로덕션 이후로 이동한다.

### CORE_POC

- 상태: `REMOVED_BY_USER_DECISION`
- 검증 책임: `ABSORBED_INTO_VERTICAL_SLICE`
- 다른 이름으로 재도입: `FORBIDDEN`

---

## 2. Gate 1 — CONCEPT_APPROVAL

상태: `APPROVED`

승인 범위:

```text
플레이어 약속
+ 비타협 프로젝트 코어
+ 세일즈포인트 3개
+ 2계층 소환수
+ 수업·시험·축제·현장실습
+ 자유일정 3회
+ 공통 Situation Challenge
+ 시간·저장·UI·범위 상한
+ M0~M4 Validation-First 순서
```

승인 원본:

- `docs/planning/GATE_1_FINAL_APPROVAL.md`
- `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`

---

## 3. Gate 2 — PROTOTYPE_AND_VERTICAL_SLICE

상태: `ENTERED_PLANNING_ONLY_VISUAL_PREPRODUCTION`

### 3.1 적대적 검토 루프 02

- 보고서: `docs/planning/GATE_2_ADVERSARIAL_REVIEW_LOOP_2026-07-27B.md`
- 판정: `PASS_WITH_CORRECTIONS`
- 코어·Vertical Slice 세션: `NO_CHANGE`
- 결정 기억 누락: `P0 MUST_FIX / FIXED`
- 같은 화면 전투 충돌: `P0 MUST_FIX / FIXED`
- 메인 소환수 성장 범위: `LONG_TERM_CONFIRMED / SLICE_REDUCED`
- 전투 소환수 4역할: `REFERENCE_CANDIDATE`

### 3.2 화면·캐릭터·전투 표현 — 완료

책임 원본:

- `docs/planning/GATE_2_VISUAL_PRESENTATION_SYSTEM.md`
- `docs/planning/GATE_2_CHARACTER_PRESENTATION_SYSTEM.md`

```text
학교·자유일정·비전투 탐색
= 가로형 고정·장면 기반 3/4 필드
= 3.5~4등신 SD 캐릭터

대화
= 기존 장소 배경 위 반신 일러스트

전투
= 별도 고정 3/4 전술 전투장
= 필드 SD 비율·기본 골격 재사용

마법 작성
= 현재 화면 감속·암전 + 작성 오버레이

전투 종료
= 결과를 반영한 필드 복귀
```

보호:

- 기준 구도 16:9, 18:9~20:9 좌우 확장
- 자유 이동형 대형 학교 제외
- 작은 고정 전투장
- 필드와 전투의 장소·목표·환경 인과 유지
- 작성 중 대상·위험·지원 상태 유지
- 정확한 감속 비율과 내부 해상도는 후속 검증·규격에서 확정

### 3.3 소환수 성장·형상·탑승 — 장기 방향 완료

책임 원본:

- `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md`
- `docs/planning/GATE_2_SUMMON_GROWTH_AND_FORM_SYSTEM.md`

확정:

- 메인 동반 + 전투 보조 2계층
- 원소·정령 중심 시각 언어
- 메인 동반 장기 4단계 성장
- 해금된 이전 형상 선택
- 실제 성장과 표시 형상 분리
- 장기 탑승 기능
- Vertical Slice는 초기 형상 1개와 수호/견제 보조 1체

후행:

- 메인 2~4단계 전체 런타임
- 형상 선택 UI
- 탑승
- 전투 보조 소환수 4역할 전체·성장·탑승

### 3.4 시각·사운드 프리프로덕션 남은 조건

1. `ART-STYLE-01` 그림체 후보 이미지 비교·사용자 선정
2. `ART-BIBLE-01` 색·선·명암·재질·실루엣·배경·FX·접근성
3. `ASSET-SPEC-01` 자산 수량·상태·변형·기술 규격·내부 해상도
4. `AUDIO-DIRECTION-01` 사운드 정체성·우선순위·무음 대체
5. Asset License Ledger 후보 등록과 승인

### 3.5 대량 자산 제작 금지 조건

- 그림체 기준 샷 사용자 승인 없음
- Art Bible 미승인
- 내부 해상도·안전 영역·자산 예산 미확정
- 캐릭터·배경·UI·효과·사운드 기술 규격 미확정
- Audio Direction 미승인

`ART-STYLE-01`의 비교용 소수 이미지 제작은 허용한다.

### 3.6 구현 시작 조건

1. `GM-VS-PROFILE-01` 사용자 승인
2. 실행 프로필 `VERTICAL_SLICE_FULL_PROFILE` 전환
3. Codex read-only Plan 검수
4. 구현 브랜치·검증 매트릭스·완료 기준 확정
5. Godot 버전·렌더러·Android 대상 기기 확정
6. Save Schema v1과 Situation Challenge 데이터 계약
7. Android·접근성·성능 검증 매트릭스
8. Balance Tuning Backlog

현재 판정: `IMPLEMENTATION_NOT_READY`

---

## 4. 승인된 Vertical Slice 계약

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

- 목표 `45~50분`, 상한 `60분`
- 첫 5분 직접 작성
- 15분 안에 메인·보조 이해
- 자유일정 `휴식 / 준비 / 교류`
- 세션 경계 중심 최소 저장

내부 구현 순서:

```text
M0 입력·피드백
→ M1 공통 Situation Challenge
→ M2 학교 세션
→ M3 현장실습
→ M4 저장·복귀·최종 연출
```

M0~M4는 CORE_POC가 아니다.

---

## 5. 구현 중단 조건

- 입력 실패와 설계 실패를 구분하지 못함
- 직접 작성 피로가 핵심 경험을 방해
- 공통 문제 계약으로 두 번째 문제를 추가할 수 없음
- 세션별 전용 프레임워크가 필요해짐
- 첫 완주가 60분을 구조적으로 초과
- 자유일정·관계 제작량이 핵심 세션보다 커짐
- 보조 소환수 운용이 주문 설계보다 복잡
- 별도 전투 화면이 필드와 무관한 전투 인스턴스로 느껴짐
- 필드·대화·전투 캐릭터 자산이 Asset Budget 초과
- 메인 소환수 성장·탑승이 초기 Slice 핵심보다 먼저 구현됨
- Android 주요 화면비에서 작성 영역이 성립하지 않음
- 최종 아트·FX가 글자 궤적·위험·대상을 가림

---

## 6. 결정 기억 게이트

새 질문 전 다음을 확인한다.

```text
START_HERE
→ ACTIVE_CONTEXT
→ CURRENT_CONFIRMED_DECISIONS
→ DECISION_LOG와 최신 Addendum
→ 주제별 책임 원본
```

이미 확정된 결정을 기억 확인 목적으로 다시 질문하면 `PROCESS_REGRESSION`으로 판정한다.

질문 허용 상태:

- `USER_DECISION_REQUIRED`
- `UNRESOLVED`
- `PLAYTEST_TUNING_REQUIRED`
- `ASSET_SPEC_REQUIRED`
- `TECHNICAL_REVIEW_PROPOSAL`

---

## 7. 현재 검증 경계

- Godot 코드·Scene·Resource·게임 데이터 없음
- Codex 미실행
- 대량 이미지·사운드 자산 미착수
- 외부 자산·폰트·사운드 라이선스 조사 `NOT_RUN`
- 그림체·Art Bible·Asset Specification·Audio Direction 미확정
- 런타임·Android·접근성·성능·플레이테스트 `NOT_RUN`
- PR은 Draft 유지
- 병합하지 않음

---

## 8. 다음 Greenlight

`ART-STYLE-01`

승인된 필드 SD·대화 반신·별도 전투장·원소 정령 소환수 구성을 동일하게 사용하여 그림체 후보를 예상 인게임 이미지로 비교한다.
