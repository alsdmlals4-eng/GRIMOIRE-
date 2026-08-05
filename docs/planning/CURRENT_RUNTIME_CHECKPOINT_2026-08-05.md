# GRIMOIRE 현재 Runtime 체크포인트 — 2026-08-05

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
platform: MOBILE_LANDSCAPE_FIXED_PC_LATER
working_pull_request: 63
working_branch: agent/glyph-vocabulary-recognition-poc
current_sync: GR-SYNC-20260805-04-GLYPH-RECOGNITION-POC
source_product_commit: ec947f232b533d5a2acac20683287080c34a811f
current_gate: RESOURCE_AND_RECOGNITION_POC_AUTOMATED_PASS
human_device_validation: NOT_RUN
runtime_expansion_7_plus: BLOCKED
grill_counter: 3_of_10
merge_authorized: false
pr_state: OPEN_DRAFT_UNMERGED
```

## 플레이어 약속과 핵심 재미

> 상황과 위험을 읽고 무엇을 지킬지 선택한 뒤, 글자·대상·회로로 의도를 구현하고 결과와 대가를 책임지는 마법학교 RPG.

```text
조사·상황 → 의도·의미 → 3×3 회로 → Preview → Commit → 변화·대가 → 귀환·복기·Grimoire
```

정본 키: `SITUATION_TO_MEANING_TO_COMMIT_TO_CONSEQUENCE_TO_GRIMOIRE`.

문양 인식 성공률 자체가 핵심 재미가 아니다. 인식은 플레이어가 의도를 회로에 넣기 위한 입력 기반이며, 진짜 검증 대상은 **상황을 읽고 의미를 선택해 Commit하고 결과를 책임지는 전체 루프**다.

정본 경계: `RECOGNITION_IS_INPUT_INFRASTRUCTURE_NOT_THE_CORE_FUN`.

## 핵심 시스템

1. 상황 조사와 관찰로 대상·위험·선택 가능성을 연다.
2. 핵심 글자 1개, 보조 글자 0~2개, 대상 1~4개를 3×3 인접 방향 회로로 구성한다.
3. Preview에서 의미·비용·위험을 읽고 Commit한다.
4. Commit 결과와 대가가 전투·서사·학교·Grimoire 기록에 남는다.

## 보조 시스템

- `Exact Glyph Vault`와 `Universal Glyph Stock`: 회로 입력을 준비하는 자원 계층.
- 6종 Glyph Recognition: 손그림을 승인된 Runtime 글자로 변환하는 입력 계층.
- 마나·예약·저장/복원·읽기 전용 View Model: 원자적 Commit과 복구를 지지하는 기술 계층.
- 모바일 Landscape Safe Area·48dp·텍스트 확대: 접근성 계층.
- 학교·동료·Frostbloom·복수 해결: 선택의 의미와 결과를 제공하는 콘텐츠 계층.

정본 경계: `EXACT_GLYPH_VAULT_AND_UNIVERSAL_GLYPH_STOCK_ARE_SUPPORT_SYSTEMS`.

## 자동화 완료 범위

- Resource Foundation PR #62: 자동화 Gate PASS, Open·Draft·미병합.
- Recognition PR #63: 의미 Registry 20종, Runtime 인식 6종, 템플릿 6종.
- `$1` 기준선과 제한형 `$N`, 낮은 확신·혼동·stale revision·선택 불일치 차단.
- 성공 결과는 Exact Glyph Vault에만 저장하며 Universal Stock을 생성하지 않는다.
- 합성 Fixture 증거에서 승인된 오인식 0, 6×6 승인 matrix 대각선.
- 기존 제품 검증: 19 suites, 913 assertions, 0 failures.

## 아직 증명되지 않은 것

- 실제 손가락 입력, 좌·우손, 다양한 화면·기기에서의 조작성.
- 6종 의미 이해와 혼동, 필사 피로, 보조기술 사용성.
- 인식 → 자원 출처 → 3×3 회로 → Preview/Commit → 결과의 사람 대상 전체 루프 재미.
- 7번째 이상 Runtime 글자 확대의 타당성.

상태 키: `HUMAN_END_TO_END_CORE_LOOP_VALIDATION_PENDING`.

## Stop Gate

```text
AUTOMATED_RESOURCE_AND_RECOGNITION = PASS
SYNTHETIC_EVIDENCE = SUPPORTING_ONLY
HUMAN_DEVICE = NOT_RUN
RUNTIME_7_PLUS = BLOCKED
PR_62_AND_63_MERGE = NOT_AUTHORIZED
```

다음 기획 결정은 사람·실기기 검증 범위를 GrillMe로 승인받은 뒤 진행한다. 이 문서는 새 승인이 아니므로 Grill 카운터는 `3/10`을 유지한다.
