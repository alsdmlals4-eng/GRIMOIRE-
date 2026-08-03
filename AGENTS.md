# GRIMOIRE 작업 규칙

이 파일은 **GRIMOIRE: 세계를 다시 쓰는 법**의 최상위 프로젝트 운영 권위다. 세부 시스템 수치와 규칙은 연결된 최신 책임 원본을 우선한다.

## 1. 프로젝트 바인딩

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: NONE
primary_platform: Mobile
follow_up_platform: PC
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE_WITH_CONDITIONAL_FOUNDATION_POC_ENTRY
work_mode: PLAN
base_release: v9.4.3
main_authority: CURRENT_DEFAULT_BRANCH_HEAD
last_decision_merge_pull_request: 51
last_decision_merge_commit: 81852a767d60eb2aa835ac3e36309f1dc43c861d
last_working_sync: GR-SYNC-20260803-03
current_main_sync: GR-SYNC-20260803-04
grill_me_batch_counter: 0/10
pending_decisions: 0
last_checkpoint: MERGED_AT_6_OF_10_AND_COUNTER_RESET
checkpoint_reason: DIFF_SIZE_AND_CANON_DRIFT
implementation: NOT_STARTED
codex_plan: ALLOWED_AFTER_SPEC_REVIEW_AND_WRITING_PLANS
codex_execution: BLOCKED_BY_EXECUTION_READINESS_GATE
```

현재 브랜치·pending Decision·카운터의 기계 권위는 `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`이다.

## 2. 권한 우선순위

1. 사용자의 최신 명시적 결정.
2. 이 `AGENTS.md`.
3. `START_HERE.md`.
4. `docs/ACTIVE_CONTEXT.md`.
5. 최신 승인 Decision 책임 원본.
6. `docs/DEVELOPMENT_GATES.md`.
7. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
8. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`와 최신 Addendum.
9. 실제 코드·Scene·Resource·데이터·자산·테스트.
10. 고정 Base Release·Evidence.
11. Legacy·과거 대화·외부 AI 결과·추정.

Sheet 단독 값이나 외부 사례는 승인 Decision과 상태가 없으면 정본이 아니다.

## 3. 필수 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ docs/planning/GRILL_ME_BATCH_MERGE_STATE.json
→ docs/planning/GRILL_WORK_BENCHMARK_TEXT_INTEGRITY_01_APPROVAL_2026-08-03.md
→ docs/planning/PROJECT_BENCHMARKING_POLICY.md
→ 질문 주제의 승인 책임 원본
→ 최신 Main Sync Receipt
```

GitHub·Sheet 조회로 해결되는 사실을 사용자에게 다시 묻지 않는다. 확정된 결정은 기억 확인 목적으로 재질문하지 않는다.

## 4. Base 계약

```yaml
base_repository: alsdmlals4-eng/Base
release: v9.4.3
release_commit: 7dd1a4f80388bc5faca767ff74a3eb32dc9d0ac8
release_evidence_commit: da33a350d61b8adc52df97fccc7001708a933370
finalization_commit: 0b7c94f38d959efc0fc9442274c60b2e268a3c97
registry_sha256: 693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59
```

- `skills/PROJECT_BASE_ADAPTER.json`만 편집 가능한 프로젝트 통합 권위다.
- `PROJECT_SKILL_SNAPSHOT.json` 등 생성물은 직접 편집하지 않는다.
- 생성물은 `tools/generate_project_operating_views.py`로 검사한다.
- Base Skill 본문을 프로젝트에 복제하지 않는다.
- Trigger에 맞는 최소 Skill을 사용하되, 필수 품질 Gate는 생략하지 않는다.

## 5. 모든 GrillMe·작업의 필수 루프

결정 ID: `GM-GRILL-WORK-QUALITY-GATE-01`.

```text
현재 정본·실제 상태 조회
→ 사용자 의도와 결정 질문 정의
→ QUICK / STANDARD / DEEP 벤치마킹
→ 공식 사례·현업·표준 비교
→ ADOPT / ADAPT / REJECT
→ 중립 권장안
→ 사용자 승인 또는 위임 범위 확인
→ GitHub·Sheet 같은 Decision ID 동기화
→ 적대적 검토
→ UTF-8·NFC·Text Integrity Gate
→ 최신 HEAD CI·Review·Readback
```

실질 설계 작업에는 직접 사례 2개 이상과 인접 사례 또는 현업·표준 근거 1개 이상을 포함한다. 유명 사례 이름만 나열하지 않고 제작·QA·Mobile·접근성·운영 비용을 비교한다.

설계 의미가 없는 SHA·링크·날짜·오탈자 동기화는 다음으로 기록할 수 있다.

```yaml
benchmark_applicability: N/A_NO_DESIGN_CHANGE
text_integrity: REQUIRED
readback: REQUIRED
```

## 6. 중립·적대적 검토

사용자 의견에 자동 동의하지 않는다. 최소 두 대안을 비교하고 권장안에도 반대 질문을 적용한다.

필수 확인:

- 기존 정본과 같은 이름의 다른 시스템을 만들지 않았는가.
- 편의·자동화가 상황 판단과 Commit을 대체하지 않는가.
- Prototype 값을 최종 밸런스로 과장하지 않았는가.
- Mobile 정보량·입력·접근성 한계를 넘지 않는가.
- Save/Resume·중복 Event·상태 소유권이 빠지지 않았는가.
- 제작량·QA·콘텐츠 비용이 숨겨지지 않았는가.
- GitHub와 Sheet가 동일한 Decision·Sync ID를 가지는가.
- 깨진 한글·잘못된 인코딩·Unicode 불일치가 없는가.
- 실행하지 않은 검증을 PASS로 표시하지 않았는가.

## 7. Text Integrity Gate

모든 저장소 텍스트는 다음을 만족해야 한다.

```yaml
encoding: UTF-8_NO_BOM
unicode_normalization: NFC
replacement_character_u_fffd: PROHIBITED
invalid_control_characters: PROHIBITED
known_mojibake_patterns: PROHIBITED
json_parse: REQUIRED_FOR_JSON
```

GitHub Actions와 병합 직전 체크리스트는 `.md`, `.json`, `.yml`, `.yaml`, `.py`, `.gd`, `.tscn`, `.tres`, `.txt`, `.csv`를 검사한다.

Readback sentinel:

```text
소환수
자연충전
적대적 검토
벤치마킹
마도서
```

깨진 문자는 의미를 추측해 자동 복구하지 않는다. 원문·정상 책임 원본·Readback을 근거로 교정한다.

## 8. 승인 정본 즉시 동기화와 GrillMe Batch

결정 ID:

- `GM-CANON-SYNC-01`.
- `GM-GRILL-MERGE-CADENCE-01`.
- `GM-PREMERGE-ADVERSARIAL-GATE-01`.

```text
Decision ID
→ GitHub 권위 문서·계획 데이터
→ 연결 Google Sheet
→ 양쪽 Readback
→ SYNCED_TO_WORKING_BRANCH
→ 고유 GrillMe Decision이면 Counter +1
→ 10/10 또는 조기 병합 Trigger
→ Benchmark·Text Integrity·Pre-merge Adversarial Gate
→ 사용자 병합 승인
→ main·Sheet 재검증
→ SYNCED_TO_MAIN
→ Counter Reset
```

같은 Decision ID의 재승인·문구·SHA 교정은 카운트하지 않는다.

조기 병합 Trigger:

- 사용자 명시 병합 요청.
- Gate·Codex·구현 권한 전환.
- P0/P1 정본 안전 수정.
- 작업 종료·인계 Flush.
- Diff 크기 또는 정본 표면 드리프트로 자기완결 검토 단위가 필요할 때.

사용자 명시 승인 전 자동 병합하지 않는다.

## 9. 승인된 프로젝트 코어

> 마법학교 학생이 글자의 의미와 상황 조건을 배우고, 직접 작성·준비 Stock·상주 소환수를 조합해 주문을 설계하며, 명시적으로 구현한 결과와 대가를 책임지고 마도서에 기록하는 마법 RPG.

비타협:

- 의미를 가진 글자와 `메인 글자 1개 + 보조 글자 0개 이상`.
- 신규·미숙·중요 글자의 직접 작성.
- 상황·목표·위험에 따른 설계 판단.
- 명시적 Commit과 설명 가능한 세계 변화.
- 입력 실패·문법 실패·상황 설계 실패 분리.
- 학습→응용→책임→복기→발견 순환.

## 10. Stock 최신 계약

책임 원본:

- `docs/planning/STOCK_SYSTEM.md`.
- `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`.
- `docs/planning/STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`.

```yaml
stock_types: [FULL_SPELL, SUB_GLYPH]
shared_capacity: 8
active_charge_targets: 1
one_glyph_charge_seconds: 10
additional_glyph_seconds: 5
stock_use_mana_cost: 0
offline_charge: false
```

```text
기능 글자 수 n의 충전시간
= 10 + 5 × (n - 1)초
```

## 11. 소환수 최신 계약

책임 원본: `docs/planning/SUMMON_SYSTEM_01_APPROVAL_2026-08-02.md`.

```yaml
persistent_main_summon: 1
secondary_active_summon_cap: 3
total_active_summon_cap: 4
secondary_role_duplicate_cap_in_slice: 1
summon_duration_limit: NONE
resummon_cooldown: NONE
summon_spell_mana_cost: 2
support_cycle_seconds: 5
```

- 보조 슬롯은 `S1/S2/S3`다.
- 보조는 `PRODUCTION / GUARDIAN / ASSAULT / RECOVERY` 중 최대 세 역할을 선택한다.
- Slice에서는 보조 사이 같은 역할 중복을 금지한다.
- 메인 `[스톡] 1`은 보조 역할 중복 판정에서 제외한다.
- 보조 기본 정수값은 `[스톡] 2 / [방어도] 2 / [공격] 2 / [치유] 2`다.
- 자동 공격은 불안정도 `1` 아래 또는 마지막 해결 Event를 만들 수 없다.
- 같은 시각 보조 Event는 `S1 → S2 → S3` 순서다.

## 12. Mobile·Save·기술 경계

- Smartphone Landscape가 정식 품질 Gate다.
- Writing Panel과 상황·적·환경·타이머를 동시에 보존한다.
- 소환수 HUD는 메인 배지 + 보조 3슬롯 압축 Rail + 선택 슬롯 상세를 사용한다.
- Stock·소환수 State는 단일 소유권·원자 Transaction·Exactly-once Event를 사용한다.
- Background·Offline 경과로 충전·공격·치유 Event를 생성하지 않는다.

## 13. 현재 허용·금지

허용:

- 기획·정본·벤치마킹·적대적 검토.
- Mobile HUD·TDD Test 계약·Toolchain preflight 설계.
- GitHub·Sheet 동기화.
- 운영 Adapter·검증 Tooling·CI Text Integrity Gate.

금지:

- Godot 제품 코드·Scene·Resource·게임 데이터 생성.
- Codex Build 실행.
- 잠긴 기준 이미지 편집·재생성.
- OS·성능·인식 수치를 증거 없이 확정.
- Runtime·실기기·성능·접근성·사람 검증 완료 주장.
- 기본 브랜치 직접 수정.
- 사용자 승인 없는 PR 병합.

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
CODEX_EXECUTION = BLOCKED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```
