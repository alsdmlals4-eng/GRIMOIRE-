# GM-IMPLEMENTATION-ENTRY-01 — 구현 진입 범위 Grill Me

## 상태

```yaml
decision_id: GM-IMPLEMENTATION-ENTRY-01
status: USER_APPROVED_ACTIVE
approved_option: A_FOUNDATION_POC_ONLY_TDD_WITH_HARD_CONTENT_LOCK
approved_at: 2026-08-02T20:18+09:00
approval_phrase: 권장안대로 진행
merge_approved_at: 2026-08-02T20:59+09:00
batch_position: 1_of_10
implementation_entry: APPROVED_CONDITIONAL_FOUNDATION_POC
product_implementation: NOT_STARTED
codex_plan: ALLOWED
codex_execution: BLOCKED
base_release_on_main: 9.4.3
base_pr_38: MERGED
base_pr_42: CLOSED_SUPERSEDED
base_pr_44: MERGED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 질문

기획 계약이 main과 Google Sheet에 동기화된 다음, 어떤 범위까지 구현 진입을 허용할 것인가?

## 확인된 제약

- 현재 저장소에는 제품용 `project.godot`, Scene, Script, Resource, 게임 데이터가 없다.
- 기존 개발 Gate는 `BOSS-PHASE-01`, `GRIMOIRE-SCREEN-01`, `AUDIO-DIRECTION-01`, Mobile 통합 검수를 전체 Vertical Slice 구현 전 조건으로 둔다.
- 실제 글자 인식 알고리즘, Renderer, Mobile OS 최소 범위, 최소 기기, 성능 기준은 확정되지 않았다.
- PR #38은 planning-first를 도입했고, 기존 PR #42는 supersede 종료됐으며, 대체 PR #44가 Base v9.4.3 first-prompt governance를 main에 병합했다.
- `docs/ACTIVE_CONTEXT.md`, `docs/DEVELOPMENT_GATES.md`, `docs/DESIGN_DOCUMENT_REGISTRY.json`에는 최신 병합·Gate 상태보다 오래된 필드가 남아 있다. `START_HERE.md`와 Override는 이번 Branch에서 보정했다.

## A — Foundation POC만 TDD로 조건부 진입 — 승인·권장

허용 범위:

1. Godot 최소 프로젝트와 Headless 테스트 진입점.
2. Focus Task 순수 상태 전이.
3. 중복 적용을 막는 Atomic Result Ledger.
4. Touch·Stylus 획 Buffer와 Draft 생명주기.
5. 낮은 확신 자동 확정 금지를 검증하는 결정적 Test Recognizer.
6. App pause/resume·focus loss·중단복귀 Snapshot.
7. Landscape Safe Area와 확장형 우측 Writing Panel의 무아트 Harness.
8. 합성 비전투 상황 1개와 합성 단일 강적 상황 1개.
9. Smartphone Aspect·Cutout·Text Scale 검증 Harness와 증거 수집 형식.

계속 금지:

- 46–53분 Slice 콘텐츠 제작.
- 실제 수업·축제·현장·귀환 콘텐츠와 최종 대사.
- 실제 필기 인식·ML·훈련 데이터.
- 최종 Art·Audio·Asset Import.
- 보스 다중 페이즈, 완성 Grimoire/Main 화면.
- 밸런스·성능·Touch 허용치의 최종값 확정.
- Store·배포·Monetization 작업.

실행 전 필수 조건:

```text
main의 Base v9.4.3 단일 identity 확인 — 완료
→ Cold-start 핵심 문서 직접 재조정
→ Godot Toolchain preflight
→ Implementation Plan을 Base v9.4.3 최종 main에서 재검토
→ GM-FOUNDATION-POC-EXECUTION-READINESS-01 PASS
→ 그 뒤에만 코드 작성
```

장점:

- 가장 위험한 입력·중단복귀·중복 Commit·작은 화면 문제를 콘텐츠 비용 전에 검증한다.
- 실제 인식 알고리즘과 Asset을 뒤로 미뤄 실패 비용을 줄인다.
- 승인된 Mobile UX·Writing/Battle 계약을 공통 상태 모델로 검증할 수 있다.

위험:

- Harness가 재미 검증으로 오인될 수 있다.
- 임시 Test Recognizer가 실제 인식 품질을 대표하지 않는다.
- Cold-start와 Toolchain 검증 없이 실행하면 최신 Base 계약을 잘못 적용할 수 있다.

방어:

- 모든 화면·수치·인식 결과에 `POC / TEST_VALUE / NOT_CONTENT_COMPLETE`를 표시한다.
- 실제 제품 콘텐츠·아트·오디오 파일을 변경 금지 목록으로 CI에서 검사한다.
- 실행 준비 Gate 전에는 Codex 실행을 차단한다.

## B — 전체 Vertical Slice를 즉시 구현

기획된 46–53분 전체 흐름, 실제 콘텐츠, Art·Audio·Grimoire·Boss까지 한 번에 구현한다.

판정: 기각. 제품 프로젝트가 없고 파생 Gate와 실제 입력·기기 검증이 끝나지 않아 재작업 폭이 지나치게 크다.

## C — 모든 후속 Gate 완료까지 구현을 전면 대기

BOSS·Grimoire·Audio·통합 검수·기기·성능 수치가 모두 확정될 때까지 프로젝트 파일을 만들지 않는다.

판정: 안전하지만 과도하게 늦다. 입력·저장·원자 결과·Landscape Harness 같은 선행 기술 위험을 미리 줄일 기회를 잃는다.

## 최종 판정

사용자의 `권장안대로 진행`을 A안 승인으로, `병합 승인`을 PR #43 병합 승인으로 기록한다.

이 승인은 **Foundation POC 설계·계획 진입과 해당 정본 병합**을 허용한다. 별도 실행 준비 Gate 전에는 제품 코드 작성을 허용하지 않는다.
