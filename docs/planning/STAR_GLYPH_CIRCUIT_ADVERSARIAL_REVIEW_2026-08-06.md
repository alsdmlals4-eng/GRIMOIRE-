# 별형 글자 회로 적대적 검토 — 2026-08-06

## 상태

```yaml
review_id: GM-AR-STAR-CIRCUIT-20260806-01
decision_id: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_id: GR-SYNC-20260806-01
branch: agent/star-circuit-mastery-balance
authority_commit: 69d631c2f55b07cbc67bf824880122f431ffd7b4
sheet_readback: PASS
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
verdict: DESIGN_CANON_READY_FOR_DRAFT_PR_RUNTIME_BLOCKED
```

## 검토 범위

- 활성 최상위 정본과 복원 경로.
- 회로·마나·숙련 단일 책임 원본.
- 과거 3×3 결정의 대체 경계.
- Google Sheet `02·04·05·12·15·40·41·60·99`.
- 첫 학년 안정권, 정밀·절감, 0~5 보조의 지배전략 가능성.
- 제품 구현·Runtime 증거 과장 여부.

## P0

발견 없음.

## P1 — 활성 3×3 정본 충돌

### 공격

기존 최상위 정본은 `3×3`, 회로 내부 대상 노드, 인접 Edge, 보조 0~2, 숫자 성공률 Preview 금지를 동시에 강제했다. 새 설계만 추가하면 작업자가 서로 반대되는 두 문법을 모두 활성으로 읽게 된다.

### 조치

- `AGENTS`, `START_HERE`, `ACTIVE_CONTEXT`, `CURRENT_CONFIRMED_DECISIONS`를 새 Decision으로 라우팅했다.
- `MAGIC_LETTER_CIRCUIT_SYSTEM`을 `FIVE_POINT_STAR` 책임 원본으로 교체했다.
- 상태 색인과 Registry에서 과거 결정에 `SUPERSEDED_BY_GM-STAR-CIRCUIT-MASTERY-BALANCE-01`을 기록했다.
- 과거 문서는 삭제하지 않고 Stock·Commit·마나 보존 범위만 명시했다.

### 상태

`RESOLVED_IN_WORKING_BRANCH`.

## P1 — 성공률 숫자 Preview와 결말 누설 혼동

### 공격

숫자 성공률 표시를 허용하면서 과거 금지 목적이었던 정답 노출·결말 누설까지 함께 풀릴 수 있다.

### 조치

- 숫자 성공률은 `required`로 변경했다.
- 결말 공개, 자동 최적 대상, 자동 대상, 자동 Commit은 계속 금지했다.
- 회로 Preview와 대상 선택 후 최종 Preview를 분리했다.

### 상태

`RESOLVED_BY_SCOPE_SPLIT`.

## P1 — 학년이 숙련을 대체하는 성장 왜곡

### 공격

학년 보너스를 직접 더하면 수업과 글자별 사용 경험이 무의미해지고, 같은 학년 학생의 전문성 차이를 표현할 수 없다.

### 조치

- 학년 직접 성공률 보너스를 금지했다.
- 수업 접근과 글자별 숙련도 상한 `70/80/90/100 TEST_VALUE`를 사용한다.
- 직접 그리기·의미 있는 사용과 수업·과제·연구를 모두 숙련 근거로 요구한다.
- 쉬운 동일 행동에는 체감 감소를 적용한다.

### 상태

`RESOLVED_BY_PER_GLYPH_MASTERY`.

## P1 — 정밀 필수화

### 공격

정밀이 성공률만 올리고 부담이 작으면 모든 복합 주문의 필수 슬롯이 된다.

### 검증

- 정밀은 보조 슬롯 하나를 차지해 자체적으로 `-10%p` 복잡도를 추가한다.
- 정밀 숙련도 60의 보너스는 `+6%p`, 숙련도 100은 `+10%p`다.
- 마나는 별도로 `+25%`다.
- 위력 직접 보너스는 없다.

정밀 단독 보조는 낮은 숙련에서 성공률을 완전히 복구하지 못하며, 최고 숙련에서도 성공률만 상쇄하고 큰 마나·기회비용을 남긴다.

### 상태

`NOT_DOMINANT_BY_INITIAL_MATH / PLAYTEST_REQUIRED`.

## P1 — 절감 무료 효율

### 공격

절감이 성공률 손해 없이 마나를 크게 줄이면 모든 주문의 필수 슬롯이 된다.

### 검증

- 절감은 성공률 직접 보너스 `0%p`다.
- 보조 슬롯 하나를 차지해 성공률 `-10%p`, 마나 복잡도 `+10%`를 추가한다.
- 감소는 숙련도에 따라 `10~20%`다.
- 절감 자체 기본 마나가 기준 마나에 포함된다.
- 최종 마나는 메인 기본 마나 아래로 내려가지 않는다.

낮은 숙련에서는 복잡도 증가를 겨우 상쇄하며, 높은 숙련에서도 성공률·효과 슬롯 기회비용을 감수한다.

### 상태

`NOT_FREE_EFFICIENCY_BY_INITIAL_MATH / PLAYTEST_REQUIRED`.

## P1 — 보조 5개 무조건 최적화

### 공격

슬롯이 열려 있으면 플레이어가 항상 다섯 개를 채우는 것이 정답이라고 인식할 수 있다.

### 검증

- 보조 5개는 성공률 `-50%p`와 마나 `+50%` 복잡도를 받는다.
- 보조 글자 자체 기본 마나도 추가된다.
- 일반 1학년 숙련 예시는 5개에서 30%다.
- 4~5개는 고급·최상급 회로로만 안정화된다.
- 외곽 슬롯은 용량이며 필수 채움 수가 아니다.

### 상태

`CAPSTONE_NOT_DEFAULT_BY_INITIAL_MATH / UX_MUST_COMMUNICATE_OPTIONAL_SLOTS`.

## P2 — 가장 낮은 보조 숙련도 반영

### 공격

보조 평균만 사용하면 숙련도가 낮은 새 글자를 고숙련 글자들 사이에 숨길 수 있다.

### 조치

회로 숙련도에 `가장 낮은 보조 숙련도 × 0.20`을 포함했다.

### 상태

`RESOLVED`.

## P2 — 별 꼭짓점 숨은 규칙

### 공격

별형 시각은 플레이어가 꼭짓점 순서·방향·거리의 숨은 의미를 기대하게 만들 수 있다.

### 조치

- 초기 다섯 슬롯은 기능적으로 동등하다.
- 숨은 위치 보너스를 금지한다.
- 슬롯 순서 효과는 별도 승인 전 `deferred`다.
- 연결선은 초기 버전에서 시각적 회로 연결만 표현한다.

### 상태

`RESOLVED_FOR_INITIAL_VERSION`.

## P2 — 첫 학년 안정권

기준:

```text
메인 기본 75
회로 숙련도70 → +10
일반 대상 -5
```

결과:

| 보조 수 | 성공률 |
|---:|---:|
| 0 | 80% |
| 1 | 70% |
| 2 | 60% |
| 3 | 50% |
| 4 | 40% |
| 5 | 30% |

사용자의 `1학년이 열심히 쌓아도 1~2개가 60% 이상 안정권` 목표와 일치한다.

### 상태

`MATCHES_APPROVED_CALIBRATION / RUNTIME_PLAYTEST_REQUIRED`.

## P2 — Sheet 동기화 추적

### 검증

- Decision `02` Row 61.
- 충돌 감사 `04` Row 65.
- GDD `05` Row 19.
- 핵심루프 `12` Row 26.
- 조작 `15` Row 14.
- 핵심 시스템 `40` Row 28.
- 성장 `41` Row 12.
- UX `60` Row 34.
- 변경이력 `99` Row 79.

Decision ID, authority SHA, 수치 요약과 `SYNCED_TO_WORKING_BRANCH`를 재조회했다.

### 상태

`PASS`.

## P3 — 후속 개선

1. 별형 회로 Mobile Landscape Wireframe에서 빈 보조 슬롯이 선택 사항임을 명확히 표시한다.
2. 성공률 Breakdown에서 기본·숙련·복잡도·정밀·대상·상충을 분리한다.
3. 정밀·절감이 효과 글자와 다른 제어 보조임을 아이콘·라벨로 구분한다.
4. 부분 성공·실패·역류의 실제 분포를 별도 Decision으로 승인한다.
5. 첫 사람 Playtest에서 보조 0~5 사용 분포와 정밀·절감 선택률을 측정한다.
6. 보조 4~5개 사용이 지나치게 희귀하면 성공률 패널티를 약화하기보다 상급 숙련·수업·상황 보정을 먼저 검토한다.

## 증거 경계

다음은 완료로 주장하지 않는다.

```yaml
product_project: NOT_CREATED
implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
final_balance: PLAYTEST_TUNING_REQUIRED
```

## 최종 판정

```text
DESIGN_CANON_READY_FOR_DRAFT_PR
SHEET_SYNCED_TO_WORKING_BRANCH
NO_P0
NO_UNRESOLVED_DESIGN_P1
PRODUCT_IMPLEMENTATION_BLOCKED
RUNTIME_AND_HUMAN_EVIDENCE_NOT_RUN
```
