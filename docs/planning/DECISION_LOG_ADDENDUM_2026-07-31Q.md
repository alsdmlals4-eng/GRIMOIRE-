# GRIMOIRE Decision Log Addendum — 2026-07-31Q

## 문서 상태

- 상태: `ACTIVE_LATEST_USER_DECISION_AUTHORITY`
- 결정일: 2026-07-31
- 선행 Addendum: `DECISION_LOG_ADDENDUM_2026-07-31P.md`
- 근거: 사용자의 “권장안대로 진행” 승인과 벤치마킹 선행 원칙 지정

## GM-PLANNING-APPROVAL-01 — 기획 완결안 승인

상태: `APPROVED`

다음을 Vertical Slice 기획 정본으로 승격한다.

1. 대표 글자 `흐름 / 집중 / 분산`
2. 일반 가정 출신 장학생 신입생의 정답 집착→책임 설계 성장선
3. 정석·속도 중심 동급생과의 경쟁·협력 관계
4. 축제 `빛실 장막 복구`
5. 현장 `생태 온실·마력 관개 수로`
6. 수호형 전투 보조 소환수
7. PC 마우스·펜·키보드 복구 입력 계약
8. 목표 46분·콘텐츠 상한 53분·하드 상한 60분
9. 제작량 잠금

책임 원본:

- `docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md`

## GM-BENCHMARK-FIRST-01 — 벤치마킹 선행 원칙

상태: `APPROVED_PROJECT_WORK_PRINCIPLE`

새 시스템, 핵심 규칙, 콘텐츠 구조, UX 흐름을 설계하거나 의미 있게 변경할 때는 벤치마킹을 먼저 수행한다.

- 매번 대규모 전수 조사를 반복하지 않는다.
- 결정 범위에 따라 `QUICK / STANDARD / DEEP`를 선택한다.
- 최근 동일 결정 질문에 대한 유효한 벤치마킹이 있으면 재사용한다.
- 공식·1차 자료를 우선하고, 실제 불편 검토에는 신뢰 가능한 보조 자료를 사용한다.
- 다른 작품의 고유 표현을 복제하지 않고 설계 원리만 추출한다.

책임 원본:

- `docs/planning/PROJECT_BENCHMARKING_POLICY.md`

## GM-WRITING-FREQUENCY-01 — 직접 작성 빈도

상태: `APPROVED_PLANNING_CONTRACT`

- 정상 완주 필수 성공 작성: 7회
- 안내형 복구 포함 목표 상한: 10회
- 같은 문제에서 확인된 동일 글자는 토큰 재선택 가능
- 신규·미숙·중요 결정은 직접 작성 또는 직접 작성한 글자의 명시적 조립 필요
- 낮은 확신 후보 자동 선택 금지
- 명시적 시전 전 마나·횟수 소모 금지

정확한 획 허용치·보정·감속 비율은 `PLAYTEST_TUNING_REQUIRED`다.

## GM-GRIMOIRE-RECORD-01 — 마도서 기록 역할

상태: `APPROVED`

마도서는 완성 주문 스톡이 아니라 다음을 기록한다.

```text
상황
→ 글자·조합
→ 의도
→ 실제 결과
→ 부작용·포기
→ 발견
→ 플레이어 명명
```

기록 클릭 자동 시전과 자동 최적 조합 추천은 금지한다.

## GM-PLANNING-GATES-01 — 기획 게이트 종료

```text
PLANNING-CONTENT-01 = APPROVED
PLANNING-PLATFORM-01 = APPROVED_WITH_PLAYTEST_TUNING_PENDING
PLANNING-SCOPE-01 = APPROVED_WITH_SOLO_PRODUCTION_CONDITION
PLANNING-REVIEW-01 = PASS_WITH_CORRECTIONS_APPLIED
PLANNING_COMPLETE = true
BENCHMARK_COMPLETE = true
ADVERSARIAL_REVIEW_COMPLETE = true
```

다음 제품 게이트는 `ART-STYLE-01`이다.

## 미확정 유지

- 교수·동급생·정령의 최종 이름
- 최종 룬 문양·획 구조
- 입력 인식 알고리즘
- 허용 오차·선 보정·감속 비율
- 최종 UI 치수·내부 해상도
- 아트 스타일·Art Bible·Asset Specification
- Audio Direction
- Godot 구현 구조와 Save Schema 세부
- Gamepad 직접 작성 대체 방식

## 구현 경계

- Codex: `BLOCKED`
- Godot: `NOT_STARTED`
- 런타임·PC 입력·모바일·사람 검증: `NOT_RUN`
- 제품 코드·Scene·Resource·게임 데이터·자산 생성 권한: 없음
- 다음: `ART-STYLE-01`
