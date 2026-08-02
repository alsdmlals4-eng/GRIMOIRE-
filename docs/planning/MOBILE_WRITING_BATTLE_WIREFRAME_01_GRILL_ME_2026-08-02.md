# GM-MOBILE-WRITING-BATTLE-WIREFRAME-01 — Mobile Writing·Battle 화면 계약 승인 해소

## 상태

```yaml
decision_id: GM-MOBILE-WRITING-BATTLE-WIREFRAME-01
status: USER_APPROVED_RESOLVED
approved_option: A_CONTEXT_PRESERVING_EXPANDABLE_RIGHT_WRITING_FOCUS_PANEL
approved_at: 2026-08-02T19:42+09:00
grill_me_batch: 10_of_10
completed_gate: MOBILE-WRITING-BATTLE-WIREFRAME-01
next_gate: GM-PREMERGE-ADVERSARIAL-GATE-01
implementation: NOT_STARTED
codex: BLOCKED
```

## 승인 문장

> Mobile Landscape의 Writing·Battle 화면은 상황 보존형 확장 우측 Writing Focus Panel을 사용한다. 기본 상태에서는 적·환경을 중심으로 관찰하고, 작성 시 우측 Panel을 확장하되 적 의도·남은 시간·대상·환경 위험을 화면에 유지한다.

## 기본 관찰 상태

```text
┌──────────────── 전투·상황 영역 ────────────────┬── 작성 진입 ──┐
│ 적 의도·남은 시간·환경 위험                     │ 문자 슬롯      │
│ 적·환경·효과                                     │ 쓰기 버튼      │
│ 플레이어·동반자·마나                            │ 조합 요약      │
│ 최근 결과·상황 행동                              │                │
└──────────────────────────────────────────────────┴────────────────┘
```

## 작성 Focus 상태

```text
┌──── 상황 보존 영역 ────┬──────── 확장 Writing Panel ────────┐
│ 적·환경 축소 표시       │ 대상·주문 슬롯·마나·예상 비용      │
│ 적 의도·타이머 고정     │ 큰 직접 작성 캔버스                │
│ 핵심 HP·위험 유지       │ 후보·의미·Undo·삭제·취소·[구현]    │
└─────────────────────────┴───────────────────────────────────┘
```

## 확정 규칙

- 기본 관찰 상태에서는 장면·적·환경을 중심으로 표시한다.
- Writing Panel 확장 중에도 적 의도·남은 시간·대상·환경 위험을 필수 잔존 정보로 유지한다.
- 작성 중 상황 보존 영역은 핵심 HP·마나·보존 대상만 남기고 부가 정보는 접는다.
- 캔버스는 Panel 내부에서 가장 큰 단일 입력 영역이며 버튼·툴팁·유도선과 겹치지 않는다.
- 인식 후보는 의미·획 차이·신뢰 상태를 함께 제공한다. 낮은 확신 후보는 자동 확정하지 않는다.
- 후보·비용·문법·Undo·현재 획 삭제·전체 지우기·취소·`[구현]`은 캔버스와 분리한다.
- `[구현]`은 마나·문법·상황 조건을 충족할 때만 활성화하고 중복 Commit을 잠근다.
- 작성 중 전투 타이머는 진행하며, 결과 해석·연출 중에는 기존 승인 계약대로 일시 정지한다.
- Panel 축소·일시 닫기에는 Draft를 유지한다. 명시적 전체 취소에서만 Draft를 폐기한다.
- 비전투·제작은 같은 Panel 계약을 사용하되 적·타이머 대신 대상·재료·안전 조건을 표시한다.

## 접근성·기기 보호

- Smartphone Landscape 16:9~20:9와 좌우 Cutout·하단 System indicator를 검증 대상으로 유지한다.
- Touch와 Stylus 모두에서 캔버스·후보·복구·구현 조작을 분리한다.
- 접근성 확대 시 상황 잔존 정보와 캔버스가 동시에 판독되지 않으면 별도 확대 상태를 제공하되 Draft를 보존한다.
- 색만으로 후보 확신·타이머·활성 상태를 표시하지 않는다.
- Panel 비율·Touch target·캔버스 크기·후보 수·타이머 배치는 `TEST_VALUE`다.

## 적대적 보호 규칙

- 우측 Panel 확장이 사실상 전체 화면 Takeover가 되지 않는다.
- 상황 보존을 이유로 캔버스가 손가락 작성에 부족해지지 않는다.
- 상시 소형 Panel로 축소해 인식 오류와 손 피로를 핵심 난도로 만들지 않는다.
- 낮은 확신 자동 확정·버튼 겹침·Draft 손실·타이머 가림은 Wireframe 재작업 조건이다.
- 이 승인은 화면 계약 승인일 뿐 Godot 구현·실기기·사람 검증 완료를 의미하지 않는다.

## 다음 단계

Grill Me counter가 `10/10`에 도달했으므로 `GM-PREMERGE-ADVERSARIAL-GATE-01`을 실행한다. 최신 main·PR 전체 diff·Google Sheet·CI·리뷰·정본 문서를 검증한 뒤 Draft PR #36의 병합 가능 여부를 보고한다. 자동 병합과 제품 구현은 승인되지 않는다.
