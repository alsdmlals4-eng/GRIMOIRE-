# 3×3 주문 회로 정본 병합 전 적대적 검토

## 상태

```yaml
review_id: GR-ADV-20260804-3X3-CANON-PREMERGE
reviewed_at: 2026-08-04T09:37+09:00
review_scope: PR_57_FULL_CHANGESET_AND_CURRENT_CANON
result: PASS_AFTER_REQUIRED_CANON_HARDENING
merge_authorization: USER_EXPLICIT_EARLY_FLUSH_AT_5_OF_10
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

## 검토 질문

1. 상황을 읽고 의도를 정한 뒤 주문으로 구현하는 핵심 재미를 강화하는가?
2. 3×3 배치가 실제 판단인가, 단순 장식인가?
3. Stock과 직접 그리기가 서로의 역할을 침범하는가?
4. 접근성 입력이 전투 성능 차별을 만드는가?
5. 교수 예시·등록 주문·설계도가 정답표나 자동 시전으로 변하는가?
6. 과거 Draft·Fail-closed·완성 주문 Stock 문서가 현재 정본과 충돌하는가?
7. 모바일에서 읽기·터치·취소·피격·동시 Event가 명확한가?

## 핵심 결론

현재 방향은 프로젝트 코어와 일치한다.

```text
상황 조사
→ 해결 의도 선택
→ 3×3에 글자·대상 노드 배치
→ 방향성 연결로 회로 구성
→ 예상 효과·위험 확인
→ Commit
→ 실제 변화·대가 복기
```

전투와 비전투가 같은 주문 문법을 공유하므로 학습 전이가 강하다. Stock은 숙련 글자의 반복 입력을 줄이고, 집중 필사는 부족한 Stock을 능동적으로 보충하므로 직접 작성이 필수 조작으로 과잉 확대되지 않는다.

## 병합 전 필수 경화

### 1. 배치의 의미

문제: 아무 셀끼리나 연결할 수 있고 거리도 무의미하면 3×3 위치가 장식이 된다.

경화:

```yaml
edge_rule: ADJACENT_8_NEIGHBOR_ONLY
skip_over_empty_or_occupied_cell: PROHIBITED
crossing_edges: PROHIBITED
hidden_position_bonus: PROHIBITED
```

위치는 연결 가능성과 분기 형태를 결정하지만, 거리·모서리·중앙에 숨은 수치 보너스를 주지 않는다.

### 2. Slice 대상 노드의 종결성

```yaml
slice_target_node_role: TERMINAL_LEAF
```

대상은 효과가 도달하는 끝점이다. 지면·장치 같은 대상에 범위 효과를 주려면 `분산` 등 보조 글자를 대상 앞에 둔다. 고학년의 매개체 통과 문법은 별도 결정 전까지 도입하지 않는다.

### 3. 대상 제공 규칙

- 현재 보이고 식별된 전투 참가자는 자동으로 대상 목록에 나타난다.
- 환경·장치·숨은 약점은 관찰·조사 후 나타난다.
- 생명 안전과 철수에 필요한 핵심 대상은 한 인물·한 관계·한 조사 경로에 독점되지 않는다.

### 4. 집중 필사 용량 경합

문제: 필사 중 자연충전이 마지막 용량을 채우면 성공 직전에 보상을 잃을 수 있다.

경화:

```text
집중 필사 시작
→ 공용 Stock 용량 1칸 예약
→ 성공 시 예약칸에 같은 글자 Stock +1
→ 취소·피격·실패 시 예약 해제
```

예약된 한 칸은 자연충전과 소환수 지원이 채울 수 없다.

### 5. `[집중]` 글자와 `[집중 필사]` 상태 구분

- 글자 노드: `[집중]`
- 전투 입력 상태: `[집중 필사]`
- 아이콘·테두리·상태 문구를 별도로 사용한다.
- 데이터 ID는 `GLYPH_FOCUS`와 `STATE_FOCUS_SCRIBE`로 분리한다.

### 6. 알려진 주문 설계도

등록 주문은 자동 시전 버튼이 아니다.

```yaml
known_spell_blueprint: NON_BINDING_GHOST_REFERENCE
node_auto_commit: false
target_auto_selection: false
auto_best_route: false
```

플레이어가 참고 회로를 불러올 수는 있지만, 글자 Stock 예약·대상 선택·최종 Commit은 직접 수행한다.

### 7. Preview 신뢰도

`confidence`는 성공 확률이 아니다.

```yaml
confidence_display: [정보_충분, 정보_부분, 정보_부족]
numeric_success_probability: PROHIBITED
ending_reveal: PROHIBITED
```

## 발견된 문서 충돌

| 심각도 | 발견 | 조치 |
|---|---|---|
| P0 | 완성 주문 Stock이 3×3 판단을 우회 | 폐기, 글자 Stock만 활성 |
| P0 | `DEVELOPMENT_GATES.md`가 과거 FAIL_CLOSED·Stage 0 상태 유지 | 현재 게이트 문서로 교체 |
| P0 | Registry가 과거 브랜치·Sync·0/10을 가리킴 | 현재 정본 라우터로 교체 |
| P1 | 승인된 대사·장면 파일이 검토 대기 Draft로 보임 | 상태 색인에서 활성 연결 콘텐츠로 명시 |
| P1 | 과거 학교 위기 장면 Spec이 흐름 메인·다인물 구조 유지 | `[대체됨]` 처리 |
| P1 | 과거 준비·실행 계획이 현재 실행 대상으로 보임 | `[보류]` 또는 `[구현완료 보관]` 처리 |
| P2 | Godot 설치 스크립트가 공식 HTTPS 배포물을 쓰지만 해시를 검증하지 않음 | 공급망 경화 후속 작업으로 `[보류]`; 현재 기획 정본 병합 비차단 |

## 유지해야 할 금지 경계

```text
COMPLETED_SPELL_ONE_TAP_STOCK = PROHIBITED
FULL_PAUSE_DURING_FOCUS_SCRIBE = PROHIBITED
DRAWING_POWER_BONUS = PROHIBITED
DRAWING_REQUIRED_FOR_BASIC_COMBAT = PROHIBITED
GENERIC_STOCK_CONVERSION = PROHIBITED
TARGET_OR_EDGE_STOCK_COST = PROHIBITED
FACULTY_EXAMPLE_AS_GRADING_KEY = PROHIBITED
BLUEPRINT_AUTO_TARGET_OR_AUTO_COMMIT = PROHIBITED
HIDDEN_GRID_POSITION_BONUS = PROHIBITED
NUMERIC_SUCCESS_PROBABILITY_PREVIEW = PROHIBITED
```

## 병합 판정

문서 상태 색인, 상위 권위, 3×3 승인·Spec, Stock·회로 책임 원본, Sheet가 같은 결정을 가리키고 최신 HEAD CI·Review Thread 검증이 통과하면 PR #57을 병합한다.
