# GM-MOBILE-WRITING-BATTLE-WIREFRAME-01 — 상황 보존형 확장 우측 Writing Focus Panel 승인

## 승인 상태

```yaml
decision_id: GM-MOBILE-WRITING-BATTLE-WIREFRAME-01
status: USER_APPROVED_ACTIVE
approved_option: A_CONTEXT_PRESERVING_EXPANDABLE_RIGHT_WRITING_FOCUS_PANEL
approved_at: 2026-08-02T19:42+09:00
grill_me_batch: 10_of_10
completed_gate: MOBILE-WRITING-BATTLE-WIREFRAME-01
next_gate: GM-PREMERGE-ADVERSARIAL-GATE-01
implementation: NOT_STARTED
codex: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 핵심 계약

```text
기본 관찰: 적·환경 중심 + 우측 작성 진입/조합 요약
→ Writing Focus: 우측 Panel 확장 + 상황 영역 압축 유지
→ 후보·비용·문법 검토
→ 취소 또는 단일 원자 Commit
→ 결과·세계 변화·Grimoire 기록
→ Draft를 보존한 상태로 상황 복귀
```

### 반드시 계속 보이는 정보

작성 중에도 다음은 사라지지 않는다.

1. 적 또는 대상.
2. 적 의도와 남은 시간.
3. 환경 위험과 보존 대상.
4. 플레이어 핵심 HP·마나.

### Writing Panel

- 캔버스는 Panel의 최대 단일 입력 영역이다.
- 후보·의미·신뢰 상태·비용·문법·Undo·삭제·취소·`[구현]`은 캔버스 외부에 둔다.
- 낮은 확신 후보는 자동 확정하지 않는다.
- `[구현]`은 조건 충족 시에만 활성화하고 Commit 중복을 차단한다.
- Panel 축소·일시 닫기는 Draft를 보존한다.
- 명시적인 전체 취소에서만 Draft를 폐기한다.

### 공통 사용

- 전투: 적 의도·타이머·환경 위험을 표시한다.
- 비전투: 대상·목표·부작용 가능성을 표시한다.
- 제작: 재료·배합 상태·안전 조건을 표시한다.

각 콘텐츠는 같은 Panel 생명주기를 공유하지만 입력 판단과 결과 규칙은 독립적으로 유지한다.

## 입력·접근성 보호

- Touch·Stylus에서 캔버스와 위험 행동 버튼을 분리한다.
- Undo·현재 획 삭제·전체 지우기·취소·구현은 위치·형태·문구가 구분되어야 한다.
- 타이머·후보 신뢰도·버튼 상태는 색 외 숫자·아이콘·형태·문구를 병행한다.
- 접근성 확대와 Safe Area에서 상황 잔존 정보와 작성 공간을 함께 검증한다.
- 정확한 Panel 비율·캔버스 크기·Touch target·후보 수·배치값은 `TEST_VALUE`다.

## 재작업 조건

다음 중 하나라도 발생하면 Wireframe을 재작업한다.

- 작성 중 적 의도·타이머·환경 위험이 가려짐.
- 캔버스가 손가락 작성에 부족함.
- 캔버스 위에 버튼·툴팁이 겹침.
- 낮은 확신 후보 자동 확정.
- Panel 축소·App 중단복귀 시 Draft 손실.
- 취소와 `[구현]` 오입력.
- 접근성 확대에서 상황 또는 작성 중 하나가 사용 불가.

## 병합·구현 경계

이 결정으로 Grill Me counter는 `10/10`이다. 다음으로 `GM-PREMERGE-ADVERSARIAL-GATE-01`을 실행한다. Gate 통과는 병합 검토 가능 상태를 뜻하며 자동 병합이나 Godot 구현 승인을 뜻하지 않는다.
