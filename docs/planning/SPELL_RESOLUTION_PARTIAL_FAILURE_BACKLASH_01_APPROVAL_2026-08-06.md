# 주문 부분 성공·실패·역류 계약 01 승인

```yaml
status: USER_AUTHORIZED_TEST_VALUE_DEFAULT
parent_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_id: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION
runtime_scope: POC_RESOLUTION_POLICY
playtest_tuning_required: true
human_validation: NOT_RUN
```

## 목적

실패를 무작위 모욕이나 단순 무효 처리로 만들지 않고, 원인·새 정보·다음 대응 기회를 남기는 결과 계층으로 정의한다.

## 결과 계층

```yaml
FULL_SUCCESS: roll_at_or_below_success
PARTIAL_SUCCESS: miss_margin_1_to_10_TEST_VALUE
IMPERFECT_EXECUTION: miss_margin_11_to_25_TEST_VALUE
FAILURE: miss_margin_26_to_40_TEST_VALUE
BACKLASH: miss_margin_41_plus_TEST_VALUE
CIRCUIT_COLLAPSE: INVALID_CIRCUIT_OR_TRANSACTION_ONLY
```

수치는 초기 POC용 `TEST_VALUE`이며 실기기·사람 테스트 후 조정한다.

### FULL_SUCCESS

의도한 효과가 Preview 범위대로 발생한다.

### PARTIAL_SUCCESS

주 목표는 달성하지만 범위·지속·대상 수 중 하나가 줄어든다. 해결되지 않은 나머지는 현재 상황에서 다시 대응 가능하다.

### IMPERFECT_EXECUTION

효과가 약하거나 좁게 발생하며 가장 불안정한 글자의 기여가 원인으로 표시된다. 플레이어는 회로 단순화·원인 글자 교체·다른 대상 키워드를 선택할 수 있다.

### FAILURE

의도한 효과는 발생하지 않는다. 무작위 잘못된 대상이나 숨은 추가 마나를 부과하지 않는다. 환경 반응과 원인 글자를 통해 새로운 전술 정보를 제공한다.

### BACKLASH

Preview에서 경고된 위험 범주 안에서 시전자 또는 환경에 결과가 발생한다. 결말을 미리 공개하지 않되 위험 종류는 숨기지 않는다. 무작위 제3 대상 전이는 POC에서 금지한다.

### CIRCUIT_COLLAPSE

유효하지 않은 회로·Transaction·Resource 상태에서만 발생한다. 정상 확률 실패 결과로 사용하지 않으며 유효 Commit 이전이면 자원을 소비하지 않는다.

## 자원 계약

- 유효한 Commit Transaction이 적용된 뒤의 `FULL_SUCCESS`부터 `BACKLASH`까지는 Preview된 마나와 예약 글자 Stock/Vault를 한 번만 소비한다.
- 결과 등급 때문에 숨은 추가 마나·중복 Stock 소비를 발생시키지 않는다.
- Commit 전 취소·시스템 검증 실패·유효하지 않은 회로는 자원을 소비하지 않는다.
- 동일 Transaction ID는 Exactly-once다.

## 설명 계약

모든 결과는 다음 필드를 제공한다.

```yaml
cause_glyph_id: REQUIRED
new_information: REQUIRED
next_opportunity: REQUIRED
wrong_target: false
extra_hidden_mana: 0
duplicate_stock_consumption: 0
```

`FAILURE_ALWAYS_LEAVES_INFORMATION_OR_OPPORTUNITY`를 필수 원칙으로 사용한다. 결과는 새 정보, 새로운 대응 기회, 명확한 원인, 전술 변화, 서사 결과, 숙련 학습 근거 중 하나 이상을 남겨야 한다.

## 금지

- 아무 설명 없는 실패.
- Preview에 없던 추가 자원 소비.
- 무작위 오발 대상.
- 실패를 이유로 플레이어 선택 자체를 조롱하는 문구.
- 실패 후 유일 정답 회로 추천.

## 검증 경계

자동 Policy·경계값 테스트는 가능하지만 실제 체감 난이도·불공정성·서사 만족도는 `HUMAN_NOT_RUN`이다.
