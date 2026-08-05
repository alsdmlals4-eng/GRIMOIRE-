# Spell 메인·보조 글자 숙련 시스템 — 책임 원본

## 문서 상태

```yaml
status: ACTIVE_RESPONSIBILITY_SOURCE_MAIN
decision_id: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_id: GR-SYNC-20260806-01
main_authority_commit: 6ee87a452ebb5793fb6739249287dfd537f4ee89
merged_pull_request: 68
sheet_sync: SYNCED_TO_MAIN
sheet_readback: PASS
updated_at: 2026-08-06T06:27+09:00
glyph_mastery: 0_to_100
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
numeric_status: USER_APPROVED_PROTOTYPE_BASELINE_PLAYTEST_REQUIRED
```

## 목적

메인 글자와 보조 글자는 각각 독립 숙련도를 가진다. 플레이어는 모든 주문에 적용되는 추상적인 단일 주문 레벨이 아니라, 실제로 배우고 그려 본 글자를 더 안정적으로 사용할 수 있다.

예:

```text
메인 HEAT 숙련도 72
메인 HEAL 숙련도 34
보조 PRECISION 숙련도 81
보조 REDUCTION 숙련도 46
보조 SPREAD 숙련도 58
```

## 숙련도 범위

```yaml
main_glyph_mastery: 0_to_100
auxiliary_glyph_mastery: 0_to_100
year_direct_success_bonus: prohibited
course_role: ACCESS_AND_MASTERY_CEILING
mastery_role: CAST_RELIABILITY_AND_ADVANCED_USE
```

기존 `미숙→숙련→달인` 3단계는 UI 라벨로 사용할 수 있지만, 실제 계산과 진척 정본은 `0~100` 연속 숙련도다.

권장 표시 라벨:

| 숙련도 | 표시 라벨 |
|---:|---|
| 0~29 | 미숙 |
| 30~59 | 학습 중 |
| 60~79 | 숙련 |
| 80~94 | 능숙 |
| 95~100 | 통달 |

라벨 경계는 UI 표현이며 계산식을 바꾸지 않는다.

## 숙련도 획득

### 직접 그리기·의미 있는 사용

- 해당 글자를 직접 그린다.
- 유효한 회로에서 의미 있게 사용한다.
- 서로 다른 대상·상황·보조 조합으로 적용한다.
- 결과와 실패 원인을 복기한다.
- 현재 숙련도보다 어려운 조건에서 책임 있게 성공하면 추가 근거를 얻는다.

### 수업·연습·과제·연구

- 수업에서 글자의 의미와 획순을 배운다.
- 지도 연습으로 기본 숙련도를 올린다.
- 과제·현장실습·연구로 상위 숙련 구간 접근을 인증한다.
- 고급 수업은 새로운 글자뿐 아니라 기존 글자의 더 높은 숙련도 상한을 연다.

### 반복 방지

```yaml
trivial_same_action_repeat: DIMINISHING_RETURNS
class_only_to_100: prohibited
field_spam_without_theory_to_100: prohibited
failed_but_meaningful_attempt: SMALL_MASTERY_EVIDENCE
```

같은 쉬운 주문을 무의미하게 반복하거나 수업 일정만 선택해 모든 글자를 최고 숙련도로 만들 수 없다.

## 학년·교육 접근과의 관계

학년은 성공률을 직접 더하지 않는다. 상위 학년은 더 높은 수업·실습·연구에 접근해 글자별 숙련도 상한을 연다.

초기 교육 기준:

| 교육 접근 | 해당 글자 숙련도 상한 |
|---|---:|
| 기초 과정 | 70 |
| 중급 과정 | 80 |
| 고급 과정 | 90 |
| 완전 이해·최종 연구 | 100 |

- 1학년은 선택한 기초 글자를 열심히 익혀 70까지 올릴 수 있다.
- 모든 글자가 자동으로 70이 되는 것은 아니다.
- 저학년 천재나 특정 글자 특화 학생을 표현할 수 있다.
- 고학년도 배우지 않은 글자는 낮은 숙련도로 남는다.

## 회로 숙련도

보조 글자가 없으면:

```text
회로 숙련도 = 메인 글자 숙련도
```

보조 글자가 하나 이상이면:

```text
회로 숙련도
= 메인 숙련도 × 0.45
+ 사용한 보조 평균 숙련도 × 0.35
+ 가장 낮은 보조 숙련도 × 0.20
```

가장 낮은 보조 숙련도를 별도로 반영해, 미숙한 글자 하나가 복잡한 주문 전체를 불안정하게 만들도록 한다.

```text
숙련도 성공률 보정
= clamp((회로 숙련도 - 50) × 0.5, -25, +25) %p
```

| 회로 숙련도 | 성공률 보정 |
|---:|---:|
| 0 | -25%p |
| 30 | -10%p |
| 50 | 0%p |
| 60 | +5%p |
| 70 | +10%p |
| 80 | +15%p |
| 90 | +20%p |
| 100 | +25%p |

## 1학년 운용 목표

일반 메인 기본 성공률 `75% TEST_VALUE`, 회로 숙련도 70, 일반 대상 난이도 -5%p 기준:

| 보조 수 | 최종 성공률 | 목표 상태 |
|---:|---:|---|
| 0 | 80% | 매우 안정 |
| 1 | 70% | 안정 |
| 2 | 60% | 열심히 숙련한 1학년의 안정권 경계 |
| 3 | 50% | 위험, 상급 학습 필요 |
| 4 | 40% | 매우 위험 |
| 5 | 30% | 일반 1학년 실전 부적합 |

이 구조는 슬롯 자체를 잠그지 않고, 학습과 숙련을 통해 복잡한 회로가 자연스럽게 열린다는 감각을 만든다.

## 특수 보조 글자 숙련 효과

### PRECISION / 정밀

```text
정밀 성공률 보너스 = 정밀 숙련도 ÷ 10 %p
정밀 마나 가산 = +25%
```

- 숙련도 60: `+6%p`.
- 숙련도 100: `+10%p`.
- 직접 위력 보너스는 없다.
- 정밀도 보조 슬롯과 복잡도 패널티를 사용한다.

### REDUCTION / 절감

```text
절감 마나 감소율 = 10% + 절감 숙련도 ÷ 10
절감 성공률 직접 보너스 = 0%p
```

- 숙련도 0~100: `10~20%` 감소.
- 절감도 보조 슬롯과 복잡도 패널티를 사용한다.
- 최종 마나는 메인 기본 마나보다 낮아지지 않는다.

## Stock과 직접 작성

- Stock은 반복 입력을 줄이는 편의 수단이다.
- Stock을 사용해도 해당 글자의 숙련도는 주문 계산에 적용된다.
- 직접 작성과 Stock은 같은 주문 효과·마나·성공 공식을 사용한다.
- 직접 작성은 숙련도 학습 근거가 될 수 있지만 숨은 위력 보너스가 아니다.
- 배우지 않은 글자를 소환수나 Stock이 대신 제공하지 않는다.

## 실패와 숙련

- 성공은 정상 숙련 근거다.
- 부분 성공은 결과를 복기하면 유효 근거가 된다.
- 실패도 원인을 확인하고 수정하면 소량 근거가 된다.
- 시스템 오류·입력 장치 오류·중복 처리 실패는 캐릭터 숙련 실패로 기록하지 않는다.
- 위험한 주문을 반복 실패하는 것이 최고의 숙련 파밍법이 되지 않게 한다.

## 책임 경계

- 회로·성공률: `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`.
- 마나·정밀·절감: `docs/planning/MANA_SYSTEM.md`.
- 수업·전문화: `docs/planning/FULL_GAME_MAGIC_GLYPH_CURRICULUM_01_APPROVAL_2026-08-02.md`.
- 승인: `docs/planning/STAR_GLYPH_CIRCUIT_MASTERY_BALANCE_01_APPROVAL_2026-08-06.md`.
- Main Sync: `docs/planning/sync/GR-SYNC-20260806-01-MAIN.md`.

## 가드레일

```text
학년 자동 성공률 보너스
모든 글자 동시 최고 숙련
쉬운 동일 행동 무한 반복 성장
수업 선택만으로 100 숙련
현장 Spam만으로 이론 상한 우회
Stock 사용자의 위력·마나 차별
직접 그리기의 숨은 위력 보너스
정밀·절감의 무료 필수 조합화
Runtime 검증 없는 최종 밸런스 주장
= 금지
```
