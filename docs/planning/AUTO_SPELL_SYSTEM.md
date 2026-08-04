# [폐기] Spell 자동스펠 시스템

```yaml
status: RETIRED
reference_allowed: false
retired_at: 2026-08-04T09:37+09:00
historical_content: GIT_HISTORY_ONLY
replacement:
  - docs/planning/STOCK_SYSTEM.md
  - docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md
  - docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md
```

조건부 자동발동, 완성 주문 원터치 Stock, 하위 회로 자동 배치·연결은 모두 현재 설계에서 사용하지 않는다.

현재 계약:

```text
특정 글자 Stock
→ 글자 노드 1회 배치만 대체

3×3 회로
→ 대상·배치·연결을 플레이어가 구성

Commit
→ Stock·마나·결과를 원자 처리
```

알려진 주문 설계도는 반투명 참고 회로이며 자동 대상·자동 Stock 예약·자동 Commit을 제공하지 않는다.
