# GM-MOBILE-UX-FLOW-01 — 장면 중심 Contextual Focus Flow 승인

## 승인 상태

```yaml
decision_id: GM-MOBILE-UX-FLOW-01
status: USER_APPROVED_ACTIVE
approved_option: A_SCENE_FIRST_CONTEXTUAL_FOCUS_FLOW
approved_at: 2026-08-02T19:27+09:00
grill_me_batch: 9_of_10
completed_gate: MOBILE-UX-FLOW-01
next_gate: MOBILE-WRITING-BATTLE-WIREFRAME-01
implementation: NOT_STARTED
codex: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 승인 문장

> Mobile Landscape의 기본 UX는 장면 중심 Contextual Focus Flow로 구성한다. 플레이어는 현재 장면과 목표를 유지한 채 한 번에 하나의 Focus Task를 수행하며, 직접 작성은 상황 내부의 임시 Focus Layer로 열고 결과 확인·마도서 기록·다음 일정으로 복귀한다.

## 기본 상태 흐름

```text
학교·현장 장면
→ Context Card에서 현재 목표·대상·위험 확인
→ 비전투·제작·전투 중 하나의 Focus Task 진입
→ 필요 시 Writing Panel 열기
→ 후보 확인·부분 수정·취소 또는 구현
→ 결과·부작용·보존 대상 확인
→ Grimoire 기록
→ Hub 또는 다음 Chapter Anchor
```

## 정보 우선순위

### 안전 장면

1. 현재 장소와 목표.
2. 다음 행동 후보.
3. 일정·마도서·설정의 일관된 얇은 전역 진입점.
4. 관계·재료·장기 정보는 요청 시 확장.

### Focus Task

1. 현재 목표·대상·위험.
2. 필요한 자원·재료·시간 압력.
3. 현재 입력과 취소·확정·복구 행동.
4. 결과 적용 전 상태.

### 시간 압박 전투

1. 적 의도·남은 시간·환경 위험.
2. 플레이어·동반자 핵심 상태와 마나.
3. 작성 획·인식 후보·비용·`[구현]`.
4. Pause·접근성·안전 종료 외 전역 메뉴 제한.

## 공통 Focus Task 계약

수업·비전투·제작·전투는 다음 상태를 공유한다.

```text
OBSERVE
→ ENTER_FOCUS
→ INPUT_OR_SELECT
→ REVIEW
→ COMMIT_OR_CANCEL
→ APPLY_RESULT_ATOMICALLY
→ SHOW_CONSEQUENCE
→ RECORD_AND_RETURN
```

- 각 Task는 장면·목표·대상·위험·자원·return marker를 전달받는다.
- 취소 시 소비·평가·관계·결과 태그를 적용하지 않는다.
- Commit 이후 결과는 하나의 거래 단위로 적용한다.
- 결과 표시와 마도서 기록이 같은 Ledger를 참조한다.
- 결과 중복 적용과 이미 소비된 재료의 재사용을 차단한다.

## Save/Resume 계약

우선 Anchor:

1. 장면 진입 직후.
2. Focus Task 진입 전.
3. 결과 원자 적용 직후.
4. Grimoire 기록과 다음 일정 확정 후.

중단복귀 시 다음을 표시한다.

- 중단된 장소와 Focus Task.
- 작성 Draft 또는 선택 Draft의 보존 여부.
- 아직 적용되지 않은 결과와 이미 적용된 결과.
- 안전하게 계속할 수 있는 다음 행동.

시간 압박 중간 상태를 직접 복원하기 어려운 경우 같은 Task의 안전 Anchor로 복귀하되, 슬롯·재료·보상·평가를 중복 적용하지 않는다. 정확한 저장 주기와 복원 범위는 `TEST_VALUE`다.

## 전역 진입점 보호

- 일정·마도서·설정의 위치와 아이콘 의미를 안전 장면 전반에서 고정한다.
- 전역 기능은 숨기되 위치를 바꾸지 않는다.
- 첫 노출과 복귀 후 Context Card에서 전역 진입점을 짧게 재확인한다.
- 같은 결과를 Context Card·Result·Grimoire에서 장문으로 반복하지 않는다.
- Reduced Motion에서는 Focus 전환을 즉시화하고 상태 변화는 텍스트·아이콘·형태로 설명한다.

## 적대적 보호 규칙

- 장면 중심을 이유로 현재 목표·다음 행동을 숨기지 않는다.
- 공통 Focus Task가 모든 콘텐츠를 동일한 미니게임으로 평준화하지 않게 입력 방식과 상황 판단은 콘텐츠별로 유지한다.
- Writing Panel이 열린 동안 원래 상황·대상·위험을 완전히 제거하지 않는다.
- 전투 중 Dashboard·마도서·관계 관리로 시간 압박을 우회하지 못한다.
- 화면 전환 애니메이션이 입력 대기와 피로를 늘리면 축소하거나 제거한다.
- Touch target·Safe Area·Panel 비율·전환 시간·Anchor 수는 `TEST_VALUE`다.

## 다음 결정

`GM-MOBILE-WRITING-BATTLE-WIREFRAME-01`.

장면 중심 흐름을 유지하면서 전투의 적·타이머·자원·환경과 직접 작성의 캔버스·후보·비용·`[구현]`을 Mobile Landscape 한 화면에 어떻게 배치할지 결정한다.
