# GRIMOIRE 개발·기획 게이트 — 현재 정본

## 상태

```yaml
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
previous_main_sync: GR-SYNC-20260804-12-CLOSURE
working_branch: agent/star-circuit-mastery-balance
working_authority_commit: 209eecc5beed77920ca601a2b377b8e900a0d5ac
current_working_sync: GR-SYNC-20260806-01
latest_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
canon_status: SYNCED_TO_WORKING_BRANCH
product_project: NOT_CREATED
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

## Gate 0 — 정본 복원

상위 포인터·Registry·상태 색인·Sheet가 `GM-STAR-CIRCUIT-MASTERY-BALANCE-01`과 `GR-SYNC-20260806-01`을 가리켜야 한다. 과거 3×3 문서는 역사로 보존하되 활성 문법으로 읽히면 안 된다.

현재: `WORKING_BRANCH_PASS / MAIN_MERGE_PENDING`.

## Gate 1 — 핵심 재미

```text
조사 → 의도 선택 → FIVE_POINT_STAR 회로 → 회로 Preview → 대상 키워드 → 최종 Preview → Commit → 변화·대가 → 복기
```

현재: `PLANNING_PASS / HUMAN_NOT_RUN`.

## Gate 2 — FIVE_POINT_STAR 회로

```yaml
layout: FIVE_POINT_STAR
main_glyph: exactly_1_center
auxiliary_glyphs: 0_to_5_vertices
target_selection: AFTER_CIRCUIT_PREVIEW_BY_KEYWORD
numeric_success_preview: required
hidden_vertex_bonus: prohibited
```

다섯 외곽 슬롯은 초기 버전에서 동등하고 선택적으로 사용한다. 대상은 회로 노드가 아니며 관찰·조사로 열린 키워드에서 선택한다.

현재: `SPEC_PASS / IMPLEMENTATION_NOT_STARTED`.

## Gate 3 — 글자별 숙련도·성공률

- 모든 메인·보조 글자는 독립 숙련도 `0~100`을 가진다.
- 학년은 직접 성공률을 주지 않고 수업 접근과 숙련도 상한을 연다.
- 보조 개수별 성공률 패널티는 `0,-10,-20,-30,-40,-50%p`다.
- 1학년 집중 숙련 목표는 보조 1개 안정, 보조 2개 60% 안정권 경계다.
- `PRECISION`은 슬롯과 마나를 사용해 성공률을 높인다.

현재: `USER_APPROVED_PROTOTYPE / PLAYTEST_TUNING_REQUIRED`.

## Gate 4 — Stock·마나·절감·필사

- Typed glyph Stock은 반복 입력을 대체한다.
- 모든 주문 Commit은 마나를 사용한다.
- 보조 개수별 마나 가산은 `0,+10,+20,+30,+40,+50%`다.
- `PRECISION` 마나 가산은 `+25%`다.
- `REDUCTION`은 숙련도에 따라 `10~20%`를 줄이고 직접 성공률 보너스를 주지 않는다.
- 최종 마나는 메인 기본 마나 아래로 내려가지 않는다.
- 집중 필사는 선택적 Stock 보충이며 마나 회복·위력 보너스가 아니다.

현재: `SPEC_PASS / IMPLEMENTATION_NOT_STARTED`.

## Gate 5 — 모바일 UX·접근성

별형 회로 Mobile Landscape Wireframe에서 다음을 검증한다.

- 중앙 메인과 외곽 5개 슬롯의 판독성.
- 빈 보조 슬롯이 선택 사항임을 명확히 표시.
- 글자별 숙련도와 성공률 Breakdown.
- 회로 Preview와 대상 키워드 선택의 단계 분리.
- 최종 마나·성공률·위험 상태와 명시적 Commit.
- 큰 Touch target, Safe Area, Text 130%, 색 외 라벨, 모션 감소, Stylus 대체.

현재: `WIREFRAME_NEXT / DEVICE_NOT_RUN / ACCESSIBILITY_NOT_RUN`.

## Gate 6 — 콘텐츠·서사

Frostbloom 복수 해결, 선택지=의도, 교수 예시 비정답, 조사로 대상 키워드 개방, 성공률 숫자와 결말·정답 공개의 분리를 유지한다.

현재: `PLANNING_PASS / HUMAN_NOT_RUN`.

## Gate 7 — 개발환경

Godot `4.7.1.stable` 계약 테스트와 다운로드 검증은 개발환경 증거일 뿐 제품 구현 증거가 아니다. 제품 `project.godot`, 회로 Runtime, 모바일 실기기 증거는 없다.

현재: `TOOLCHAIN_CHECK_REQUIRED_ON_PR / PRODUCT_NOT_STARTED`.

## Gate 8 — 정본 PR·Sheet Readback

```text
Working authority snapshot: 209eecc5beed77920ca601a2b377b8e900a0d5ac
Sheet tabs: 02·04·05·12·15·40·41·60·99
Working Sheet readback: PASS
Draft PR: #68
Main merge readback: NOT_RUN
```

Draft PR exact-head CI, 문서 검토, 리뷰 스레드 0개를 확인한 뒤 병합한다. 병합 후 main SHA를 Sheet에 다시 기록하고 `SYNCED_TO_MAIN`으로 전환하기 전에는 완료로 처리하지 않는다.

현재: `SYNCED_TO_WORKING_BRANCH / DRAFT_PR_REVIEW_PENDING`.

## 다음 작업

1. 별형 회로 Mobile Landscape Wireframe.
2. 부분 성공·실패·역류 세부 계약.
3. 집중 필사 Overlay.
4. Frostbloom UX Map.
5. 제품 프로젝트 생성 후 테스트 우선 Codex 구현 계획.
