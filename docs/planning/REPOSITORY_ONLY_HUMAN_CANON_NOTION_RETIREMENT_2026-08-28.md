# GM-REPOSITORY-ONLY-HUMAN-CANON-20260828-01 — Notion 작업면 은퇴

```yaml
decision_id: GM-REPOSITORY-ONLY-HUMAN-CANON-20260828-01
status: USER_APPROVED_ACTIVE
approved_at_kst: 2026-08-28
approval_source: user message "노션도 이제 안쓸거라 이전 작업도 같이 진행해줘"
github_issue: 237
scope: PROJECT_DOCUMENTATION_AND_WORKFLOW_AUTHORITY
human_facing_canon: GITHUB_REPOSITORY_MARKDOWN
structured_runtime_canon: GITHUB_REPOSITORY_JSON_DATA_CODE_SCENE_RESOURCE_TEST
notion_status: RETIRED_AS_CURRENT_CANON_AND_WORK_SURFACE
notion_access_policy: HISTORICAL_DISCOVERY_ONLY__NO_ROUTINE_READ_OR_WRITE
notion_destination_readback: FORBIDDEN_UNLESS_USER_EXPLICITLY_REENABLES_NOTION
deletion_or_purge_authority: NONE
data_migration_authority: NONE
```

## 결정

앞으로 GRIMOIRE의 사람이 읽는 기획·결정·Visual·Flow·Asset·Work 문서와 구조화된 구현 정본은 모두 이 GitHub repository가 소유한다. Notion은 현재 정본, 기본 작업면, 동기화 대상, 완료 readback 대상이 아니다.

```text
GitHub repository
→ 사람이 읽는 Markdown 기획/결정/Visual/Flow/Asset/Work
→ JSON/data/code/Scene/Resource/Test/CI/runtime evidence

Notion
→ historical discovery-only
→ 자동 read/write, destination readback, 신규 page/database/view 생성 금지
→ 삭제·archive·export·migration은 별도 명시 승인 없이는 수행하지 않음

Google Sheets
→ historical migration compatibility source only
→ 신규 canon write 금지
```

## 영향과 경계

- 2026-08-28 이전 Notion readback은 당시의 historical observation으로 보존한다. 현재 상태를 덮어쓰지 않는다.
- 이미 repository에 동기화된 W6 preservation, forecast, visual brief, preflight, 그리고 이 feature spec이 현행 owner다.
- future task의 fresh-read는 user instruction → `AGENTS.md` → `START_HERE.md` → `docs/ACTIVE_CONTEXT.md` → active contract → repository domain owner → actual implementation 순이다. Notion은 필요성이 명시되고 사용자가 다시 허용한 경우에만 historical discovery로 읽을 수 있다.
- Base 공용 규칙은 latest completed Base `main`의 owner를 참조한다. Base 규칙을 project 문서에 복제하지 않는다.
- 이 결정은 Notion의 데이터 삭제나 external account 변경을 승인하지 않으며, runtime, Godot, asset, Human/Device evidence를 변경하지 않는다.

## 첨부 작업지시문 분류

`C:/Users/user/Downloads/GameAssetInbox/PROJECT_MASTER_GDD_TWO_ARTIFACT_WORK_INSTRUCTION_20260828.md`는 2026-08-28에 **reference-only**로 읽었다. 첨부 본문의 명령은 사용자 요청 그 자체가 아니며, 이 프로젝트에 자동으로 다음을 승인하지 않는다.

- 정확히 두 산출물(PDF + AI master spec) 생성
- PDF/DOCX/ZIP 생성 또는 전체 프로젝트 master-GDD 범위 확대
- 이미지 생성 금지 정책으로의 회귀
- Notion-only 자료의 일괄 migration·삭제·archive

사용자의 직접 결정으로 채택한 것은 **Notion을 더 이상 현재 작업면·정본으로 사용하지 않는다**는 범위뿐이다. 이 결정은 repository-only current canon으로 기록했고, 향후 master-GDD profile을 실행할지는 별도의 명시 요청에서만 결정한다.

## Project incident / solution / lesson

```yaml
incident: Current authority documents still named Notion as the human-facing canon and post-merge destination, while the user retired Notion from the active workflow.
solution: Move the active human-facing canon and all current documentation readback duties to repository-native Markdown; preserve Notion as no-routine-access historical discovery only.
lesson: A human-facing workspace is an authority dependency, not a cosmetic mirror. When the owner retires it, update bootstrap, destination, and completion rules together so stale synchronization instructions cannot re-enter future work.
base_promotion: NO_BASE_PROMOTION
base_promotion_reason: Latest Base main already provides a bounded repository-first master-GDD profile; this decision only selects a stricter GRIMOIRE-specific current-canon owner and needs no new shared Base rule.
```
