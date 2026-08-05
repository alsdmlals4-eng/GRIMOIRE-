# 별형 글자 회로·숙련도·복잡도 기준 승인

## 결정 상태

```yaml
decision_id: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
status: USER_APPROVED_WORKING_BRANCH
approved_at: 2026-08-06T01:44+09:00
sync_id: GR-SYNC-20260806-01
supersedes_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
supersession_scope: CIRCUIT_TOPOLOGY_TARGET_PLACEMENT_SUCCESS_PREVIEW_SUPPORT_CAP
responsibility_source: docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md
design_spec: docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

## 승인 내용

1. 주문 회로는 중앙 메인 글자 1개와 별 꼭짓점의 보조 글자 슬롯 5개로 구성한다.
2. 보조 글자는 0~5개를 선택적으로 배치한다.
3. 대상은 회로 안의 노드가 아니라 회로 프리뷰 이후 별도 키워드로 선택한다.
4. 회로 구성 중 1차 프리뷰, 대상 선택 후 최종 프리뷰를 제공한다.
5. 최종 프리뷰에는 예상 마나와 숫자 성공률을 표시한다.
6. 메인·보조 글자는 각각 독립 숙련도를 가진다.
7. 숙련도는 해당 글자를 직접 그리고 의미 있게 사용하거나, 수업·연습·과제·연구를 통해 얻는다.
8. 학년은 성공률을 직접 올리지 않고 수업 접근과 숙련도 상한을 연다.
9. 보조 글자 1개당 성공률 복잡도 패널티는 누적 -10%p다.
10. 보조 글자 1개당 마나 복잡도 가산은 누적 +10%다.
11. 1학년이 열심히 숙련한 기초 글자 조합은 보조 1개를 안정적으로, 보조 2개를 60% 이상 안정권 경계로 운용하는 것을 초기 목표로 한다.
12. 정밀은 마나를 +25% 사용하고 정밀 숙련도에 따라 성공률을 최대 +10%p 높인다.
13. 절감은 성공률 직접 보너스 없이 숙련도에 따라 마나를 10~20% 줄인다.
14. 모든 수치는 사용자 승인 Prototype 기준이며 실제 Runtime·사람 Playtest 후 조정한다.

## 보존되는 이전 계약

- Typed glyph Stock 방향.
- 명시적 Commit.
- 자동 대상·자동 Commit 금지.
- 모든 주문 Commit의 마나 소모.
- 입력 방식에 따른 숨은 위력 차별 금지.
- 대상 키워드는 관찰·조사에 따라 열린다.

## 대체되는 이전 계약

- 3×3 셀 회로.
- 회로 안 대상 노드.
- 인접 연결·교차·건너뛰기·끝점 대상 규칙.
- 일반 회로의 보조 글자 2개 상한.
- 숫자 성공률 Preview 금지.

## 승인 경계

이 결정은 설계와 Prototype 수치 기준을 승인한다. 다음은 승인·완료로 간주하지 않는다.

- Godot 제품 구현.
- 실제 모바일 화면 배치와 터치 정확성.
- 성공·부분성공·실패·역류의 세부 확률 분포.
- 실제 마나 경제와 전투 지속시간.
- Runtime, 모바일 기기, 성능, 접근성, 사람 검증.

## 다음 Gate

1. 활성 정본·상태 색인·Sheet를 같은 Decision ID로 동기화한다.
2. 별형 회로 Mobile Landscape Wireframe을 작성한다.
3. 부분 성공·실패·역류 세부 계약을 별도 GrillMe 대상으로 정리한다.
4. 제품 프로젝트 생성 후 테스트 우선 구현 계획을 실행한다.
