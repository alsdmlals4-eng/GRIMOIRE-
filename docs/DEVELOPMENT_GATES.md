# GRIMOIRE 개발·기획 게이트

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
baseline_date: 2026-07-31
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE
work_mode: PLAN
gate_1: APPROVED
planning_complete: true
benchmark_complete: true
adversarial_review_complete: true
next_greenlight: ART-STYLE-01
implementation_ready: false
codex: BLOCKED
```

현재 승인은 콘셉트·기획·범위·플랫폼 방향을 확정한다. 구현·런타임·성능·접근성·사람 플레이테스트 통과를 의미하지 않는다.

## 1. 전체 제품 경로

```text
Gate 1 콘셉트·Vertical Slice — 완료
→ 기획 완결 패스 — 완료
→ 벤치마킹 패스 — 완료
→ 적대적 기획 검토 — 완료
→ ART-STYLE-01
→ ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ 사용자 Codex Plan 승인
→ Codex read-only Plan
→ 기술 검수
→ 실행 프로필 전환 재검토
→ Validation-First 구현
→ QA·외부 플레이테스트
```

`CORE_POC`는 `REMOVED_BY_USER_DECISION / REINTRODUCTION_FORBIDDEN`이다.

## 2. Gate 1 — 콘셉트·Slice

상태: `APPROVED`

승인 범위:

- 플레이어 약속과 비타협 코어
- 메인 1 + 보조 0개 이상 문법
- 수업·시험·축제·현장실습
- 자유일정 3회
- 공통 Situation Challenge
- 45~50분 목표·60분 하드 상한
- M0~M4 Validation-First 순서
- 2계층 소환수
- 필드·대화·별도 전술 전투 표현

책임 원본:

- `docs/planning/GATE_1_FINAL_APPROVAL.md`
- `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`

## 3. 기획 완결 게이트

### 3.1 PLANNING-CONTENT-01

상태: `APPROVED`

승인:

- 글자 `흐름 / 집중 / 분산`
- 주인공·교수·동급생·동반자 역할
- 다섯 Situation Challenge와 복수 해법
- 자유일정 효과와 무최적해 원칙
- 귀환·마도서 기록 보상

책임 원본:

- `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`

### 3.2 PLANNING-PLATFORM-01

상태: `APPROVED_WITH_PLAYTEST_TUNING_PENDING`

승인:

- PC 마우스 드래그·펜 보조
- 키보드 Undo·취소·후보 확정
- 명시적 시전 전 자원 미소모
- 정상 완주 필수 성공 작성 7회
- 안내형 복구 포함 목표 상한 10회
- 동일 문제의 확인 글자 토큰 재선택
- Gamepad `DEFERRED / NOT_PROMISED`
- 모바일은 후속 별도 적응·검증

미확정:

- 획 허용 오차
- 선 보정·떨림 완화 수치
- 화면 감속 비율
- 인식 알고리즘

상태: `PLAYTEST_TUNING_REQUIRED`.

### 3.3 PLANNING-SCOPE-01

상태: `APPROVED_WITH_SOLO_PRODUCTION_CONDITION`

시간:

- 목표 중앙값 46분
- 콘텐츠 상한 53분
- 접근성·재작성 여유 7분
- 하드 상한 60분

제작량:

- 학교 공용 장면 1 + 축제 상태 변형 1
- 현장 장면 1 + 동일 장소 전술 전투장 1
- 작성 오버레이 1
- 마도서 화면 1
- 주인공·교수·동급생
- 메인 동반 정령·수호형 보조 소환수·폭주 정령
- 글자 3개
- Situation Challenge 5개

### 3.4 PLANNING-REVIEW-01

상태: `PASS_WITH_CORRECTIONS_APPLIED`

검토:

- 합성 시스템 최적화형
- 학교생활·관계 중심형
- 마우스 작성 초보·저숙련형
- 복귀 플레이어
- 1인 개발 제작 관점
- 적대적 검토
- 추적성 검수

주요 보정:

- 직접 작성 7회·목표 상한 10회
- 입력 수정 단계 자원 미소모
- 집중·분산 대가 분리
- 자유일정 효과의 다음 세션 한정
- 마도서 자동 주문 스톡 금지
- 문제별 성공 의미 차별화

책임 원본:

- `docs/planning/GRIMOIRE_PLANNING_ADVERSARIAL_REVIEW_2026-07-31.md`

## 4. 벤치마킹 게이트

정책: `GR-BENCHMARK-FIRST-01 / ACTIVE`

새 시스템·핵심 규칙·콘텐츠 구조·UX 흐름을 설계하거나 의미 있게 변경할 때 벤치마킹을 먼저 수행한다.

- 기본 규모: `QUICK` 또는 `STANDARD`
- `DEEP`: 코어 재개방·시장·대규모 구조 전환에만 사용
- 최근 동일 질문의 유효한 결과 재사용 가능
- 산출물: 결정 질문·비교축·근거·위험·`ADOPT / ADAPT / REJECT`·프로젝트 계약

책임 원본:

- `docs/planning/PROJECT_BENCHMARKING_POLICY.md`
- `docs/planning/benchmarks/GRIMOIRE_BENCHMARK_PASS_2026-07-31.md`

## 5. ART-STYLE-01

상태: `NEXT_PRODUCT_GATE`

목적:

동일한 인게임 구성에서 그림체 후보를 비교하고, 마법 작성 가독성·필드/전투 분리·캐릭터 계층·PC 판독성·1인 제작 가능성·독창성을 평가한다.

허용:

- 소수 기준 샷
- 동일 구도 후보 비교
- 기존 사용자 승인 참고 이미지의 구조 활용
- 라이선스·출처 후보 기록

금지:

- 최종 스타일 사용자 승인 전 대량 자산 제작
- 후보마다 다른 구도·캐릭터·상황을 사용한 비교
- 생성 이미지를 자동 런타임 자산으로 승격
- 룬 문양·UI·캐릭터 세부를 Art Bible 없이 확정

통과 조건:

1. 동일 필드 구성 후보 비교
2. 동일 대화 구성 후보 비교
3. 동일 전투 구성 후보 비교
4. 마법 작성 확대 판독 비교
5. 사용자 스타일 선정
6. 선택 이유·배제 이유 기록

프로젝트 Skill:

- `art-style-decision-gate`

## 6. ART-BIBLE-01

상태: `BLOCKED_BY_ART_STYLE`

확정 대상:

- 색·선·명암·재질
- 캐릭터 SD와 반신 일관성
- 배경 깊이·실루엣·상호작용 강조
- 글자 획·위험·대상·후보 상태
- 전투와 필드의 시각 인과
- 접근성·모션 감소·무음 피드백

## 7. ASSET-SPEC-01

상태: `BLOCKED_BY_ART_BIBLE`

확정 대상:

- 내부 해상도·화면비·안전 영역
- 캐릭터·배경·UI·FX 상태 수량
- 애니메이션·표정·전투 변형
- 파일 형식·명명·폴더·라이선스
- 제작량과 재사용 경계

## 8. AUDIO-DIRECTION-01

상태: `PENDING_AFTER_CONTENT_AND_ART_DIRECTION`

확정 대상:

- 학교·시험·축제·현장·귀환의 음향 정체성
- 글자 작성·후보·시전·실패 원인 피드백
- 동반 정령과 수호형 소환수의 청각 구분
- 무음 대체
- 제작·라이선스 우선순위

## 9. 기획·아트 통합 검수

상태: `BLOCKED_BY_ART_PREPRODUCTION`

확인:

- 그림체가 글자·목표·위험을 가리지 않는가
- 기획 제작량과 Asset Spec 수량이 일치하는가
- 46분 목표에 연출·대화·입력 시간이 들어가는가
- PC 우선 입력과 UI가 일치하는가
- 모바일 후속 적응을 방해하는 하드코딩 가정이 없는가
- 소환수·인물·배경이 Slice를 팽창시키지 않는가

## 10. Codex Plan 진입

상태: `BLOCKED`

필수 조건:

1. `ART-STYLE-01` 승인
2. `ART-BIBLE-01` 승인
3. `ASSET-SPEC-01` 승인
4. `AUDIO-DIRECTION-01` 승인
5. 기획·아트 통합 검수 통과
6. 사용자의 Codex Plan 승인
7. Base v9.3 Adapter·Snapshot·CI 정합화
8. Godot 버전·렌더러·플랫폼 범위 재확인

그 뒤에만 Codex read-only Plan을 작성한다. 구현은 기술 검수와 사용자 승인 뒤 마지막 단계다.

## 11. 구현 중단 조건

- 입력 실패와 설계 실패를 구분하지 못함
- 직접 작성이 7회 계약을 넘어 반복 피로를 만듦
- 문제마다 전용 시스템·Scene이 필요함
- `집중` 또는 특정 자유일정이 전역 최적해가 됨
- 첫 완주가 60분을 구조적으로 초과
- 마도서가 자동 주문 스톡으로 작동
- 보조 소환수 운용이 주문 설계보다 복잡
- 별도 전투장이 필드와 무관하게 느껴짐
- 장면·인물·자산이 제작량 잠금을 초과
- Android·게임패드 요구가 PC 코어를 선행 변경
- 최종 아트·FX가 글자 궤적·위험·대상을 가림

## 12. 현재 검증 경계

- Godot 코드·Scene·Resource·게임 데이터 없음
- Codex 미실행
- 대량 이미지·사운드 자산 미착수
- 외부 자산·폰트·사운드 라이선스 승인 `NOT_RUN`
- 런타임·PC 입력·모바일·접근성·성능·사람 플레이 `NOT_RUN`
- PR 병합 금지
- Sheet 쓰기 금지
