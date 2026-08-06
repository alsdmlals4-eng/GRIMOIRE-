# PR #83 독립 리뷰 예외 승인 영수증

```yaml
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
exception_scope: PR83_ONLY
approved_at: USER_APPROVED_2026-08-06T23:28+09:00
source_user_instruction: 권장안대로 진행해
pr: 83
base_sha: 917ead7499482801610ba95ce37efafd1662d994
pre_exception_reviewed_head: 9d1a97f0ece4746f87ecb44ccd01b7aa0c656bb8
repository_collaborators: 1
human_independent_reviewer: STRUCTURALLY_UNAVAILABLE
copilot_review: ATTEMPTED_NO_REVIEW_CREATED
branch_policy: VERIFIED_UNPROTECTED
pre_exception_p0_p1_findings: 0
protected_product_files_changed: 0
merge_condition: REQUIRE_CURRENT_EXACT_HEAD_CHECKS_PASS
DOES_NOT_WAIVE_GUT_ADOPTION_PR_REVIEW: true
DOES_NOT_AUTHORIZE_PR82_TASK2: true
```

## 승인 범위

사용자는 PR #83의 설계·계획 정본을 main에 병합하기 위해, 저장소에 독립 검토자가 존재하지 않고 Copilot Review도 생성되지 않은 상황에서 **PR #83에 한정해** 외부 독립 리뷰 조건을 예외 처리하는 권장안을 승인했다.

이 예외는 다음 증거를 전제로 한다.

- PR #83의 이전 exact HEAD `9d1a97f0ece4746f87ecb44ccd01b7aa0c656bb8`에서 필수 5개 workflow가 PASS했다.
- 전체 diff 적대검토에서 P0/Critical과 P1/Important finding이 0이었다.
- 제품 코드, `project.godot`, Scene, Resource, asset 변경은 0이었다.
- main은 보호되지 않았고 Ruleset과 required check 강제는 없었다.
- 저장소 협업자는 소유자 한 명뿐이며 Copilot reviewer API와 `@copilot` 요청 모두 리뷰를 생성하지 않았다.

## 병합 조건

예외 기록으로 새 commit이 생성되므로 이전 CI 결과를 재사용하지 않는다. PR #83은 다음을 모두 만족할 때만 병합할 수 있다.

1. 현재 exact HEAD가 고정되어 있다.
2. 현재 exact HEAD의 필수 workflow가 모두 PASS한다.
3. unresolved review thread가 0이다.
4. 현재 diff에 P0/P1 finding이 없다.
5. Google Sheet에 같은 Decision ID와 예외 범위가 기록되고 readback된다.

## 비적용 범위

`DOES_NOT_WAIVE_GUT_ADOPTION_PR_REVIEW`

이 예외는 후속 GUT 9.7.1 formal-adoption 구현 PR의 독립 리뷰를 면제하지 않는다. 구현 PR은 GUT 실제 제품 소비, JUnit, product hash, legacy parity, HiGodot receipt Gate를 실행 증거로 검증하고 별도의 exact-head 리뷰 절차를 거쳐야 한다.

`DOES_NOT_AUTHORIZE_PR82_TASK2`

PR #82 Task 2는 GUT formal-adoption 구현 PR이 병합되고 merged-main readback과 blocker-zero 판정이 완료되기 전까지 계속 차단된다.
