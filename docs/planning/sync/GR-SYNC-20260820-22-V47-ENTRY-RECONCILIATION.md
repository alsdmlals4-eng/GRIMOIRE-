# GR-SYNC-20260820-22 — v4.7 Entry Reconciliation

```yaml
sync_id: GR-SYNC-20260820-22-V47-ENTRY-RECONCILIATION
reconciliation_id: GM-V47-ENTRY-01
existing_product_decision_owner: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
project: "GRIMOIRE: 세계를 다시 쓰는 법"
date_kst: 2026-08-20
work_mode: PLAN
approval: USER_APPROVED_RECOMMENDED_OPTION
product_decision_change: NONE
product_behavior_change: NONE
canon_reconciliation: REQUIRED
current_conversation_execution_contract: USER_SUPPLIED_V4_7
repository_contract_binding_mutation: NONE_IN_THIS_RECONCILIATION
persistent_godot_mutation: NONE
src_scene_resource_asset_mutation: NONE
task8_local_workstream_mutation: NONE
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```

## 1. 승인 재확인

사용자는 2026-08-20 KST에 다음 권장안을 승인했다.

> 완성형 데모/Vertical Slice의 현행 정본은 `GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01`의 `서리꽃 온실의 심장 / SINGLE_INCIDENT_SPIRAL`을 유지한다. 과거 `첫 수업 → 자유일정 → 실기시험 → 축제 → 현장실습` Campus Montage는 현재 46분 Slice의 플레이 구조로 사용하지 않고, 장기 학교생활/1학년 커리큘럼의 참고·Preview 범위로만 남긴다.

이 승인은 새 Slice나 새 제품 Decision을 만드는 것이 아니다. 이미 승인된 최신 GitHub structured canon을 사용자가 재확인하고 오래된 lower consumer를 정리하도록 허용한 reconciliation이다. 제품 의미의 owner는 계속 `GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01`이다.

현재 대화 실행에는 사용자가 제공한 `PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.7`을 적용한다. 저장소에 남아 있는 v4.5 r2 계약 바인딩 자체를 이 reconciliation에서 별도 migration하지는 않는다.

## 2. Authority recovery

작업 시작 관찰:

```yaml
base_main: 8553678f70e22f193a2336b591f677dcfa5a8965
project_main: ca5d004b42e19f775163188da18020de4d5aa2e7
open_project_prs_before_current_work: 0
current_planning_owner: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
slice_model: SINGLE_INCIDENT_SPIRAL
frostbloom_graybox_status: INTERNAL_PACK_PASS
spell_workflow_merged: TASK3_TO_TASK7
spell_workflow_task8: LOCAL_ACCEPTANCE_PASS_UNMERGED
```

`CURRENT_CONFIRMED_DECISIONS.md`는 이미 Frostbloom `SINGLE_INCIDENT_SPIRAL`, `festival: PREVIEW_ONLY`, `FIVE_POINT_STAR`, Human/Device/Performance/Full Slice `NOT_RUN`을 current planning decision으로 소유한다. 따라서 이 파일에 중복된 새 제품 Decision을 만들지 않는다.

## 3. 발견된 stale consumer

### README

작업 시작 README는 다음 오래된 주장을 포함했다.

- 저장소에 실행 가능한 Godot 제품 프로젝트가 없다는 주장
- 구현 `NOT_STARTED`
- Campus Montage를 현행 Vertical Slice로 제시
- 기초 글자 `흐름 / 집중 / 분산`만을 Slice 정본으로 제시

실제 repository에는 `project.godot`, Star Circuit Runtime POC, Spell Workflow Task3~7 merged implementation이 존재하고, current planning canon은 Frostbloom Single-Incident + FIVE_POINT_STAR다.

### Notion human-facing consumers

관찰된 오래된 Notion Core System records:

- `GRIMOIRE::LOOP::VERTICAL_SLICE_SCHEDULE` — Campus Montage 45~50분 구조
- `GRIMOIRE::SYSTEM::CORE_GLYPHS` — `흐름 / 집중 / 분산` 3종만 current처럼 표시

두 항목은 repository current decision과 충돌한다. Notion은 사람용 정본이므로 repository sync/merge 뒤 같은 결정 의미로 정리하고 destination readback한다.

## 4. 최소 3개 대안

### A. Frostbloom Single-Incident 유지 — 승인

- 한 사건 안에서 조사 → 의미 추론 → 글자 → FIVE_POINT_STAR → 대상/위험 판단 → 결과 → 마도서 복기를 반복한다.
- 최신 승인 canon을 보존한다.
- 핵심 재미의 반복 밀도가 가장 높다.
- 제작 범위와 QA 범위를 통제하기 쉽다.

### B. Campus Montage 복귀 — 제외

- 학교생활 폭은 빠르게 보여줄 수 있다.
- 그러나 수업/시험/축제/현장실습 간 context switch가 많아 각 핵심 시스템의 깊은 검증이 약해진다.
- 최신 승인 Frostbloom canon을 되돌리는 비용이 발생한다.

### C. 짧은 학교 프롤로그 + Frostbloom Hybrid — 재검토 후보

- 학교 판타지 노출을 강화할 수 있다.
- 하지만 현재 Slice 범위를 늘리고 새 content/presentation dependency를 만든다.
- 실제 Human test에서 `마법 시스템은 이해하지만 마법학교 RPG 정체성이 전달되지 않는다`는 반복 증거가 생길 때만 재검토한다.

## 5. Benchmark / industry research

2026-08-20 current official-source recheck:

### Chants of Sennaar — ADAPT

Source: https://www.focus-entmt.com/en/news/chants-of-sennaar-shows-its-details-in-a-gameplay-overview-and-offers-a-free-demo-to-all-players

- glyph 의미를 관찰·대화·문맥에서 추론하고 notebook을 통해 학습을 축적한다.
- GRIMOIRE에는 `문맥에서 의미 추론 → 마도서 기록 → 다음 상황에 적용` 원리를 ADAPT한다.
- 단일 정답 번역 퍼즐 구조를 그대로 복제하지 않는다.

### Magicka — ADAPT

Source: https://www.paradoxinteractive.com/games/magicka/about

- 요소를 조합해 즉시 spell 결과를 확인하는 dynamic spellcasting을 제공한다.
- GRIMOIRE에는 `소수 문법 요소의 조합 실험 + 빠른 결과 피드백`을 ADAPT한다.
- 수천 조합의 action-comedy 폭증과 friendly-fire 중심 구조는 AVOID한다.

### Baba Is You — REFERENCE_ONLY / ADAPT principle

Source: https://www.hempuli.com/baba/

- 규칙 자체를 조작하고 세계의 반응을 즉시 확인한다.
- GRIMOIRE에는 `내 규칙 변경이 세계 상태 변화로 즉시 읽힌다`는 피드백 원리를 참고한다.
- 하나의 정확한 문장/정답을 찾는 퍼즐 구조는 현재 핵심 자유도를 약화할 수 있어 직접 채택하지 않는다.

### BOOK OF HOURS — ADAPT meta loop

Source: https://weatherfactory.biz/book-of-hours/

- 책·지식·역사를 수집·연구·정리하는 행위가 진행 경험을 만든다.
- GRIMOIRE에는 마도서를 단순 Stock이 아니라 `가설/시도/결과/발견` 지식 축적으로 만드는 Meta Loop 원리를 ADAPT한다.
- 본편 전투/상황 해결을 느리게 만드는 대량 수동 카탈로그 작업은 AVOID한다.

## 6. Creative synthesis

```yaml
fun_hypothesis: "배운 마법 문법을 한 사건의 서로 다른 문맥에 다시 적용하며, 내 판단이 실제 세계 상태와 마도서 기록을 바꾸는 것이 재미의 핵심이다."
core_tension_or_delight: "정답을 아는가가 아니라, 제한된 정보에서 무엇을 보호하고 어떤 부작용을 감수할지 결정한다."
meaningful_choice: "조사 정보 선택 + Main/Auxiliary 조합 + 대상 + 위험/비용 Commit"
player_expression: "동일 사건을 서로 다른 합리적 주문/보호 우선순위로 해결"
discovery_or_surprise: "첫 해결 뒤 과거 개정 흔적이 새 문맥을 제공하지만 기존 선택을 가짜로 만들지 않음"
novelty_delta: "언어 추론 + 주문 조합 + 규칙 변화 + 지식 기록을 마법학교 책임/윤리 성장에 묶음"
clone_or_trade_dress_risk: LOW_IF_PRINCIPLES_ONLY
player_evidence_status: NOT_RUN
```

## 7. TDD / acceptance-first

RED contract first:

`tests/test_frostbloom_internal_vertical_slice_contract.py`에 README current-consumer 회귀 조건을 먼저 추가했다.

RED reason:

- 기존 README에 Campus Montage 문자열 존재
- 기존 README에 `저장소에는 아직 실행 가능한 Godot 제품 프로젝트가 없습니다.` 존재
- 기존 README에 `| 구현 | NOT_STARTED |` 의미 존재
- current Single-Incident/Task3~8 상태가 사람용 시작 문서에 반영되지 않음

GREEN target:

- README가 `서리꽃 온실의 심장 / SINGLE_INCIDENT_SPIRAL`을 현행 Slice로 표시
- `FIVE_POINT_STAR`와 current spell grammar를 표시
- Task3~7 merged / Task8 unmerged 경계를 과장 없이 표시
- Human/Device/Performance/Full Slice `NOT_RUN` 유지
- stale Campus Montage를 현행 Slice로 다시 노출하지 않음
- 기존 승인·잠금 Art Bible 핵심과 기준 이미지 SHA를 보존

## 8. 보호 범위

변경 금지:

- `src/**`
- Godot Scene/Resource
- `project.godot`
- addons/vendor
- Task8 local branch/delta
- FIVE_POINT_STAR runtime authority
- Mana/inventory/result/save transaction ownership
- approved locked Visual originals
- Human/Device/Performance/Export evidence ceilings

## 9. Long-term fit / revisit

승인안 A는 release-near Slice에서 핵심 시스템을 반복 검증하는 데 가장 적합하다.

재검토 조건:

1. 실제 Human playtest에서 다수 관찰자가 주문 시스템은 이해하지만 `마법학교 성장 RPG`라는 제품 판타지를 식별하지 못한다.
2. 첫 10~15분에 학교/인물/학습 맥락이 없어 주문 행위가 무맥락 퍼즐처럼 느껴진다는 반복 증거가 생긴다.
3. 짧은 프롤로그 추가가 Slice 총 길이/콘텐츠 비용을 거의 늘리지 않고 정체성 이해를 유의하게 개선한다는 evidence가 생긴다.

그 전에는 Campus Montage를 복구하지 않는다.

## 10. Notion sync target

Repository merge/readback 뒤:

- Project Home — 현재 Slice/부분 구현 상태 표현 확인
- `GRIMOIRE::LOOP::VERTICAL_SLICE_SCHEDULE` — Frostbloom Single-Incident로 수정
- `GRIMOIRE::SYSTEM::CORE_GLYPHS` — Main 5 + Auxiliary 5 / FIVE_POINT_STAR grammar로 수정
- destination readback 필수

## 11. Next planning axis

이 reconciliation 이후 다음 기획은 구현 Task8 자체가 아니라 **완성형 Frostbloom 첫 세션의 플레이어 경험 구조**를 우선 정교화한다.

```text
대표 문제
→ 플레이어가 처음 읽는 정보
→ 첫 의미 추론
→ 첫 글자 획득/작성
→ 첫 FIVE_POINT_STAR 설계
→ 첫 결과/부작용
→ 첫 마도서 기록
→ 두 번째 상황에서 배운 규칙의 전이
```

다음 중요한 사용자 결정이 나오기 전까지 세부 수치·표현은 가역적 권장안으로 다룬다.
