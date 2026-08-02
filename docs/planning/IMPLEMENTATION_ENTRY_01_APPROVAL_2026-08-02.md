# GM-IMPLEMENTATION-ENTRY-01 — 조건부 Mobile Foundation POC 구현 진입 승인

## 승인 상태

```yaml
decision_id: GM-IMPLEMENTATION-ENTRY-01
status: USER_APPROVED_ACTIVE
approved_option: A_FOUNDATION_POC_ONLY_TDD_WITH_HARD_CONTENT_LOCK
approved_at: 2026-08-02T20:18+09:00
implementation_entry: APPROVED_CONDITIONAL_FOUNDATION_POC
implementation: NOT_STARTED
codex_plan: APPROVED_TO_PREPARE
codex_execution: BLOCKED_BY_EXECUTION_READINESS_GATE
next_gate: GM-FOUNDATION-POC-EXECUTION-READINESS-01
batch_counter: 1_of_10
base_release_on_main: 9.4.2
base_pr_38: MERGED
base_pr_42: OPEN_DRAFT
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 승인 문장

> 전체 Vertical Slice 본제작은 열지 않는다. 먼저 Mobile에서 핵심 코어를 위협하는 입력·상태·중단복귀·중복 적용·화면 가림 위험만 검증하는 TDD Foundation POC를 설계하고 계획한다.

## 허용된 산출물

### 계획·검증

- 구현 설계 문서.
- 테스트 우선 구현 계획.
- Godot Toolchain preflight 계약.
- Headless 자동 테스트 Harness 계약.
- Smartphone Aspect·Safe Area·Cutout·Text Scale 증거 수집 형식.

### 실행 준비 Gate 통과 후 허용될 코드

- 최소 `project.godot`.
- Scene과 무관하게 검증 가능한 Focus Task 상태 전이.
- Idempotent Atomic Result Ledger.
- Stroke Buffer·Draft·Candidate·Commit 상태 모델.
- Deterministic Test Recognizer.
- Session Snapshot과 Save Repository.
- App pause/resume·focus loss 복구 Coordinator.
- 무아트 Mobile Landscape Harness.
- 합성 비전투 상황 1개와 합성 단일 강적 상황 1개.

## 금지된 산출물

- 46–53분 전체 Slice 콘텐츠.
- 실제 수업·축제·현장·귀환 대사·퀘스트·콘텐츠 데이터.
- 실제 글자 인식 알고리즘·ML 모델·훈련 데이터.
- 최종 캐릭터·배경·VFX·UI Asset과 Audio.
- Boss 다중 페이즈와 완성 Grimoire/Main 화면.
- 확정 밸런스·확정 Touch 허용치·확정 성능 목표.
- Store·배포·결제·사업화 구현.

## 실행 잠금

다음 조건이 모두 만족되기 전에는 Codex가 제품 파일을 생성하거나 수정하지 않는다.

1. PR #38 병합으로 Base v9.4.2 planning-first 정본이 main에 존재함을 확인한다. **완료**.
2. Draft PR #42가 병합·종료·supersede 중 하나로 정리된다.
3. 최종 main의 `skills/PROJECT_BASE_ADAPTER.json`이 단일 Base release identity를 가진다.
4. Base Adapter·Snapshot·Generator·Required Workflow가 PASS한다.
5. Cold-start 핵심 문서를 최종 Base 상태에 직접 맞추고 Override 우선순위를 확인한다.
6. Godot Toolchain preflight를 실행한다.
7. Implementation Plan을 최신 main에 재대조한다.
8. `GM-FOUNDATION-POC-EXECUTION-READINESS-01`이 P0=0, P1=0으로 통과한다.

## Stop Gate

Foundation POC의 자동 테스트와 최소 Device Harness 증거가 준비되면 즉시 멈춘다. 다음 작업은 별도 승인 전까지 진행하지 않는다.

```text
POC 자동 테스트 PASS
+ Snapshot 중복 적용 0
+ 중단복귀 Draft 손실 0
+ 핵심 상황 정보 가림 없음
→ 사용자 검토
→ 실제 인식·콘텐츠·아트·오디오 진입 별도 결정
```

## 책임 원본

- `docs/planning/IMPLEMENTATION_ENTRY_01_GRILL_ME_2026-08-02.md`
- `docs/superpowers/specs/2026-08-02-mobile-foundation-poc-implementation-entry-design.md`
- `docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md`
- `docs/planning/IMPLEMENTATION_ENTRY_01_ADVERSARIAL_REVIEW_2026-08-02.md`
- `docs/planning/IMPLEMENTATION_ENTRY_01_COLD_START_OVERRIDE_2026-08-02.md`

이 승인은 기획·설계·구현 계획을 허용하지만, 실행 준비 Gate 전 코드 작성 승인은 아니다.
