# GM-REPOSITORY-ONLY-HUMAN-CANON-20260828-01 — Notion 작업면 은퇴

```yaml
decision_id: GM-REPOSITORY-ONLY-HUMAN-CANON-20260828-01
status: USER_APPROVED_ACTIVE__MIGRATION_COMPLETE_MERGED_MAIN_READ_BACK
approved_at_kst: 2026-08-28
approval_source: user messages "노션도 이제 안쓸거라 이전 작업도 같이 진행해줘" and "노션의 기존 노션의 구조나 작업물들이 누락되지않게 옮겨줘(구형 데이터는 안 옮겨도 괜찮아)"
github_issue: 237
scope: PROJECT_DOCUMENTATION_AND_WORKFLOW_AUTHORITY
human_facing_canon: GITHUB_REPOSITORY_MARKDOWN
structured_runtime_canon: GITHUB_REPOSITORY_JSON_DATA_CODE_SCENE_RESOURCE_TEST
notion_status: RETIRED_AS_CURRENT_CANON_AND_WORK_SURFACE
notion_access_policy: HISTORICAL_DISCOVERY_ONLY__NO_ROUTINE_READ_OR_WRITE
notion_destination_readback: FORBIDDEN
deletion_or_purge_authority: NONE
data_migration_authority: USER_APPROVED_NOTION_TO_REPOSITORY_ONLY
migration_audit_owner: docs/planning/NOTION_TO_REPOSITORY_MIGRATION_AUDIT_2026-08-28.md
repository_project_home: docs/PROJECT_HOME.md
migration_completion_pr: 238
migration_completion_main: 1a30b9e0715b1d19e56e24f256f695b869369ca2
```

## 결정

앞으로 GRIMOIRE의 사람이 읽는 기획·결정·Visual·Flow·Asset·Work 문서와 구조화된 구현 정본은 모두 이 GitHub repository가 소유한다. Notion은 현재 정본, 기본 작업면, 동기화 대상, 완료 readback 대상이 아니다.

```text
GitHub repository
→ 사람이 읽는 Markdown 기획/결정/Visual/Flow/Asset/Work
→ JSON/data/code/Scene/Resource/Test/CI/runtime evidence

Notion
→ historical discovery-only
→ routine read/write, destination readback, 신규 page/database/view 생성, 삭제·archive·external export 금지

Google Sheets
→ historical migration compatibility source only
→ 신규 canon write 금지
```

## 영향과 경계

- 2026-08-28 이전 Notion readback은 당시의 historical observation으로 보존한다. 현재 상태를 덮어쓰지 않는다.
- 사용자는 Notion의 기존 구조와 현재 가치가 있는 작업물이 누락되지 않게 repository로 옮기도록 명시 승인했고, `GR-NOTION-MIGRATION-20260828-01`은 PR #238 merged main `1a30b9e0715b1d19e56e24f256f695b869369ca2` readback으로 완료됐다. Notion은 다시 **historical discovery-only**다. 새 Notion 작업, 수정, 동기화, 삭제, archive, export는 금지한다.
- 구형 SHA/PR/hand-off, `RETIRED` 표기, superseded visual policy처럼 현재 정본으로 되살리면 안 되는 자료는 repository에 현행 문서로 복사하지 않는다. audit ledger에 source identity와 분류만 남긴다.
- migration 완료 조건(모든 nonlegacy source의 분류와 exact repository destination readback)은 audit에서 충족됐으며, Notion은 `HISTORICAL_DISCOVERY_ONLY__NO_ROUTINE_READ_OR_WRITE`다.
- 이미 repository에 동기화된 W6 preservation, forecast, visual brief, preflight, 그리고 이 feature spec이 현행 owner다.
- future task의 fresh-read는 user instruction → `AGENTS.md` → `START_HERE.md` → `docs/ACTIVE_CONTEXT.md` → active contract → repository domain owner → actual implementation 순이다. Notion은 사용자가 다시 허용한 경우에만 historical discovery로 읽을 수 있다.
- Base 공용 규칙은 latest completed Base `main`의 owner를 참조한다. Base 규칙을 project 문서에 복제하지 않는다.
- 이 결정은 Notion의 데이터 삭제나 external account 변경을 승인하지 않으며, runtime, Godot, asset, Human/Device evidence를 변경하지 않는다.

## 첨부 작업지시문 분류

`C:/Users/user/Downloads/GameAssetInbox/PROJECT_MASTER_GDD_TWO_ARTIFACT_WORK_INSTRUCTION_20260828.md`는 2026-08-28에 **reference-only**로 읽었다. 첨부 본문의 명령은 사용자 요청 그 자체가 아니며, 이 프로젝트에 자동으로 다음을 승인하지 않는다.

- 정확히 두 산출물(PDF + AI master spec) 생성
- PDF/DOCX/ZIP 생성 또는 전체 프로젝트 master-GDD 범위 확대
- 이미지 생성 금지 정책으로의 회귀
- Notion-only 자료의 일괄 migration·삭제·archive

사용자의 직접 결정으로 채택한 것은 **Notion을 더 이상 현재 작업면·정본으로 사용하지 않는다**와 **구형 데이터는 제외하되 기존 Notion의 구조·현재 작업물을 repository로 빠짐없이 옮긴다**는 범위다. 이관은 merged-main readback까지 끝났고, repository-only current canon이 지속된다. 향후 master-GDD profile을 실행할지는 별도의 명시 요청에서만 결정한다.

## Project incident / solution / lesson

```yaml
incident: Current authority documents, the project operating adapter, and generated routing views still named Notion as the human-facing canon and post-merge destination, while the user retired Notion from the active workflow.
solution: Move the active human-facing canon and all current documentation readback duties to repository-native Markdown; correct the editable adapter, regenerate its compatibility views, and use Notion once as a read-only migration source before preserving it as no-routine-access historical discovery only.
lesson: Retiring a human-facing workspace needs a migration-completeness audit as well as a new authority owner; otherwise the project risks either losing useful work or reviving stale state as current truth.
base_promotion: NO_BASE_PROMOTION
base_promotion_reason: Latest Base main already provides a bounded repository-first master-GDD profile; this decision only selects a stricter GRIMOIRE-specific current-canon owner and needs no new shared Base rule.
```
