# GRIMOIRE 합성 테스터 적용 구조 분석

```yaml
analysis_id: GRIMOIRE-SYNTH-STRUCTURE-001
repository: alsdmlals4-eng/GRIMOIRE-
baseline_branch: main
baseline_commit: f775b360fa33d083f400b7176902f27436779d86
work_mode: PLAN
execution_profile: PLANNING_ONLY_PROFILE
product_stage: PROTOTYPE_AND_VERTICAL_SLICE
validation_method: SYNTHETIC_TESTER_SIMULATION
evidence_tier: T6_AI_INFERENCE
base_governance_commit: 9c4071c5ecefe28769b512d426442338ceb7acdd
human_validation: NOT_RUN
implementation_status: NOT_STARTED
implementation_authority: NONE
```

## 1. 분석 목적

직접 쓰는 마법 글자 UX의 입력 실패·후보 확인·부분 수정·주문 설계 실패 구분을 합성 페르소나로 공격하기 전에 GRIMOIRE의 현재 문서·Base Skill Route·아트 선행 게이트를 복원한다. 진행자가 제공하는 후보 카드는 실제 인식 알고리즘이 아니다.

## 2. 콜드 스타트 구조

```text
START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DOCUMENTATION_MAP.md
→ skills/SKILL_REGISTRY.json
→ CURRENT_CONFIRMED_DECISIONS
→ GATE 2 Evidence Pack
→ 사람 검증 Artifact
→ Base concept / vertical-slice / adversarial / validation Skill
→ ART-STYLE-01 선행 게이트
```

저장소 문서에는 프로젝트 별칭 `스펠`과 repository 표기 `GRIMOIRE-`가 혼재하지만, 이번 작업은 이름 정리나 Registry 마이그레이션을 수행하지 않는다. 실제 현재 저장소와 문서 경로를 기준으로만 분석한다.

## 3. current_skill_registry

프로젝트 전용 분야 Skill 없이 Base Route를 사용한다.

### selected_project_skills

```yaml
selected_project_skills: []
reason: 프로젝트 로컬 전용 Skill이 없으며 Registry가 Base Skill Route를 소유
```

### selected_base_skills

| Skill | Mode | 책임 |
|---|---|---|
| `analyzing-and-refining-game-concepts` | `recalibrate` | 직접 쓰기 판타지와 입력·설계 실패 책임 분리 |
| `designing-vertical-slices` | `playtest-evidence` | 후속 실제 touch/recognizer 검증 질문과 quality gate 보존 |
| `running-adversarial-review-and-refinement` | `attack` | simulated candidate가 복구를 과도하게 쉽게 만드는 문제 공격 |
| `running-adversarial-review-and-refinement` | `validate-critique` | Evidence Pack·확정 결정·아트 게이트와 비판 대조 |
| `reviewing-and-validating-project-changes` | `evidence-report` | 실제 인식률·Android·사람·접근성 미검증 보고 |
| `auditing-canonical-reference-freshness` | audit | `ART-STYLE-01`과 현재 결정 우선순위 보존 |

## 4. canonical_sources

| 책임 | 경로 |
|---|---|
| 시작 경로 | `START_HERE.md` |
| 현재 상태 | `docs/ACTIVE_CONTEXT.md` |
| 문서 지도 | `docs/DOCUMENTATION_MAP.md` |
| Skill Registry | `skills/SKILL_REGISTRY.json` |
| 확정 결정 | `docs/planning/CURRENT_CONFIRMED_DECISIONS.md` |
| GATE 2 Evidence Pack | `docs/planning/GATE_2_MAGIC_WRITING_INPUT_EVIDENCE_PACK_2026-07-29.md` |
| 사람 검증 패킷 | `docs/superpowers/plans/2026-07-29-magic-writing-input-validation-artifact.md` |
| 다음 차단 결정 | `ART-STYLE-01`, `ART-BIBLE-01` 관련 현재 계획 |

## 5. protected_paths

```yaml
protected_paths:
  - Godot project files
  - scenes/**
  - scripts/**
  - resources/**
  - save schema
  - final rune data
  - worldbuilding canon
  - ART-STYLE-01
  - ART-BIBLE-01
```

실제 recognizer·정규화·confidence threshold·latency 계약을 선택하지 않는다.

## 6. validation_routes

| 증거 | 상태 |
|---|---|
| 문서·정본 수동 대조 | 사용 가능 |
| GitHub Actions | 해당 문서 경로 자동 Actions 없음 |
| 실제 Android 손가락 입력 | `NOT_RUN` |
| 실제 인식 정확도·latency | `NOT_RUN` |
| 실제 사람 후보 이해·부분 수정 | `NOT_RUN` |
| 합성 UX 책임 검토 | `T6_AI_INFERENCE` |

## 7. 분석 대상

- 낮은 확신의 OPEN/PUSH 후보 카드.
- 인식된 글자와 상황 적합성 분리.
- 다중 획 ANCHOR의 마지막 획 취소.
- 손가락 가림 중 위험 경고.
- 낮은 확신 자동 시전 금지.

## 8. 페르소나 렌즈

| ID | 공격 목적 |
|---|---|
| `GESTURE_NOVICE` | 후보·확신·오류 근거 용어 이해 |
| `DRAWING_EXPERT` | 자동 보정이 손맛을 훼손하는 위험 |
| `IMPATIENT_CASTER` | 후보 확인 없이 빠른 시전 시도 |
| `ERROR_RECOVERY_OPTIMIZER` | 전체 재작성보다 부분 수정 발견 가능성 |
| `SEMANTIC_PLANNER` | 인식 성공과 주문 설계 실패 구분 |
| `FINGER_ONLY_MOBILE` | 가림·오터치·손가락 완주 위험 |
| `ADVERSARIAL_INPUT` | 후보 목록·취소·자동 시전 악용 |

## 9. 산출물

```yaml
structure_analysis: COMPLETED
simulation_report: docs/planning/GATE_2_MAGIC_WRITING_SYNTHETIC_TESTER_REPORT_2026-07-29.md
human_session_packet_changed: false
recognizer_selected: false
product_code_changed: false
art_gate_changed: false
human_validation: NOT_RUN
implementation_authority: NONE
```
