# Frostbloom Cast, Dialogue, and Investigation Design

## 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
decision_id: GM-FROSTBLOOM-CAST-DIALOGUE-01
status: USER_APPROVED_LINKED_CONTENT_BASELINE
approval: docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_APPROVAL_2026-08-04.md
active_script: docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md
filename_draft_status: HISTORICAL_NAME_ONLY
implementation: NOT_STARTED
codex: DEFERRED
```

## 최소 인물

```yaml
cast:
  - 에일린_로스베르_교수
  - 카시안_렌_동급생
  - 모트_동반정령
upperclass_present: false
```

## 역할

- 에일린: 안전 경계를 설정하고 외부 확산만 막는 주문 예시를 보여준다.
- 카시안: 사고 원인을 인정하고 내부 밸브·격벽 조작에 협력한다.
- 모트: 감각 관찰·유인·방어·보조를 담당하되 해결법을 자동 제시하지 않는다.

## 교수 시연

교수는 주문명을 사용한다. 시스템과 교수 대사는 구성 글자를 자동 공개하지 않는다.

```text
주문 시전
→ 외벽을 따라 호박색 빛 이동
→ 유리 서리 해빙
→ 밖으로 나가던 냉기 방향 전환
→ 외부 확산만 차단
→ 내부 압력·핵 정지·카시안·정령 문제는 남음
```

```yaml
role: ONE_VALID_EXAMPLE_NOT_CANONICAL_ANSWER
required_player_route: false
default_best_solution: false
used_as_grading_key: false
copy_action: false
```

## 조사

```text
시작 문양 조사 → [확인한 키워드: 열]
이동 경로 조사 → [확인한 키워드: 흐름]
고급 모서리 문양 조사 → 미학습 / 해독 불가
```

- 자동 인식 Overlay 없음.
- 조사로 신규 고급 글자를 자동 해금하지 않음.
- 조사는 필수 행동권·실시간 읽기 시간을 소모하지 않음.
- 플레이어는 조사하지 않고 봉쇄·철수·지원 요청을 선택할 수 있음.

## 관찰 문구

```text
따뜻한 기운이 느껴진다.
회로가 지나간 유리의 서리가 녹는다.
밖으로 나가려던 냉기가 방향을 바꿨다.
온실 안쪽의 붉은 압력계는 그대로다.
```

관찰은 감각과 실제 변화만 보여준다. 원리·추천 주문·성공률·결말은 설명하지 않는다.

## 주문 제작 연결

```text
상황·회로 조사
→ 해결 의도 선택
→ 3×3에 글자·대상 노드 배치
→ 인접 방향 연결
→ Preview
→ Commit
```

교수 주문은 반투명 자동 설계도로 제공하지 않는다. 플레이어가 조사로 확인한 글자 의미와 상황 단서를 바탕으로 별도 주문을 설계한다.

## 보호 경계

```text
교수 대사가 정답 글자 조합 직접 명명 = 금지
교수 회로 복사 버튼 = 금지
교수 예시와 불일치한 해결 자동 거부 = 금지
상급생 추가 = 금지
카시안 악의적 장난 = 금지
한 인물의 핵심 정보 독점 = 금지
```

세부 대사는 `active_script`를 사용하고, 상태 판단은 Approval 문서를 우선한다.
