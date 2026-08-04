# GR-SYNC-20260804-07 — 열·흐름 조사형 관찰 Draft 동기화

```yaml
sync_id: GR-SYNC-20260804-07-HEAT-FLOW-INVESTIGATION-DRAFT
recorded_at: 2026-08-04T08:03+09:00
repository: alsdmlals4-eng/GRIMOIRE-
branch: agent/foundation-poc-readiness-review
pull_request: 57
draft_decision_id: GM-SLICE-HEAT-FLOW-OBSERVATION-01
related_draft_id: GM-FROSTBLOOM-CAST-DIALOGUE-01
status: DRAFT_WRITTEN_FOR_USER_REVIEW
counter_increment: false
grill_counter: 3_of_10
pending_approved_decisions: 3
implementation: NOT_STARTED
```

## 사용자 지시

1. 회로 키워드 확인 과정은 텍스트 노벨 조사로 처리한다.
2. 플레이어에게는 감각과 실제 변화만 관찰 결과로 알려준다.

## 반영 내용

```text
교수의 외곽 회로 시전
→ 자동 판독 오버레이 없음
→ 플레이어가 회로 조사 선택
→ 시작 문양에서 `열` 확인
→ 이동 경로에서 `흐름` 확인
→ 미학습 고급 문양은 해독 불가
```

플레이어 관찰 결과는 다음 수준으로 제한한다.

```text
따뜻한 기운이 느껴진다.
회로가 지나간 유리의 서리가 녹는다.
밖으로 나가려던 냉기가 방향을 바꿨다.
온실 안쪽의 붉은 압력계는 그대로다.
```

금지:

- 자동 `[인식: 열]`, `[인식: 흐름]` 오버레이
- 관찰 결과에서 인과 원리와 해결법 해설
- 추천 조합·성공률·결말 표시
- 교수 회로 복사·자동 적용

## 변경 문서

- `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_DRAFT_2026-08-04.md`
- `docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_DRAFT_2026-08-04.md`
- `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`
- `docs/superpowers/specs/2026-08-04-frostbloom-cast-dialogue-design.md`
- `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
- `START_HERE.md`
- `docs/ACTIVE_CONTEXT.md`

## 정본 경계

이 변경은 사용자 지시에 따른 Draft 보정이다. `열 메인 + 흐름 경로 문법`은 기존 `흐름 메인` 승인 계약과 충돌하므로, 별도 최종 승인 전에는 기존 정본을 폐기하지 않는다.
