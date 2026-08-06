# GM-SPELL-WORKFLOW-UI-V2-01 승인 기록

```yaml
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
date: 2026-08-06
status: USER_APPROVED_ACTIVE_WRITTEN_SPEC_REVIEW_REQUIRED
approved_option: C_ADAPTIVE_LAYERED_THREE_STAGE_WORKFLOW
sync_id: GR-SYNC-20260806-09-SPELL-WORKFLOW-UI-V2
working_branch: agent/spell-workflow-ui-v2-design
pull_request: 78
source_main: 46a4abfa6a94c732c70eb50cae365b7dc2939543
design_spec: docs/superpowers/specs/2026-08-06-spell-workflow-ui-v2-design.md
implementation: NOT_STARTED
human_device_validation: NOT_RUN
final_art: NOT_CLAIMED
grill_counter_after_approval: 5_of_10
```

## 승인된 방향

1. 주문 경험을 `글자 그리기 → 회로 배치 → 주문 사용`의 세 화면으로 분리한다.
2. 사건 상태 카드를 누르면 상황 설명 Overlay가 열리고, 문제·위험·필요 대응 방향·관찰 키워드를 제공한다.
3. 상황 설명은 해결 목표만 알려주며 정확한 글자 조합을 정답으로 노출하지 않는다.
4. 글자 보관함과 스톡은 각각 1~5개를 준비하고 두 출처의 준비 수를 항상 같게 한다.
5. 표준 사건은 보관함 5개·스톡 5개를 사용한다.
6. 핵심 글자는 열·흐름·보호·냉각·수복, 보조 글자는 집중·분산·안정·지속·증폭으로 정리한다.
7. 보라색 보석과 프리미엄 재화는 사용하지 않는다. 공통 경제 재화는 금화, 주문 사용 비용은 마나다.
8. 마나는 예상 비용 영역에 한 번만 표시한다.
9. 2단계에서는 글자를 소비해 완성 주문을 만들고, 3단계 주문 사용에서만 마나를 소비하고 실제 판정을 진행한다.
10. 기본 모바일은 제한된 룬 링·광원·입자를 사용하고 Reduced Motion은 정적 동등 경로를 제공한다.

## 대체 관계

`GM-STAR-CIRCUIT-MASTERY-BALANCE-01`의 FIVE_POINT_STAR·숙련도·Typed Stock·exactly-once는 유지한다.

다음 흐름은 이 결정으로 대체한다.

```text
기존: 회로 Preview → 대상 선택 → Final Preview → Commit·마나 소비
신규: 회로 Preview → 글자 소비·주문 확정 → 별도 주문 사용 화면 대상 선택 → 마나 소비·실제 판정
```

기존 `BURST`는 새 기본 글자 슬롯을 차지하지 않고 `AMPLIFY`의 고위험 과부하 상태 또는 강화형으로 보존한다.

## 이미지 상태

생성된 1·2·3단계 이미지는 정보 구조와 시각 방향의 참고 기준이다.

```yaml
image_direction: APPROVED_UI_DIRECTION
final_game_asset: false
text_accuracy_authority: false
implementation_evidence: false
human_visual_validation: NOT_RUN
```

## 승인 카운터

이 결정은 PR #63 체크포인트의 4/10 뒤 다섯 번째 승인으로 기록한다. Magic Visual Pass v2와 후속 3단계 화면·글자 목록 수정은 동일 목표의 연속 보완이므로 별도 Decision으로 중복 집계하지 않고 이 Decision에 통합한다.

## 다음 Gate

사용자가 작성된 설계 문서를 검토한 뒤 구현 계획을 작성한다. PR #77에는 공용 UI Kit만 유지하고, 3단계 기능은 별도 TDD 구현 PR에서 진행한다.
