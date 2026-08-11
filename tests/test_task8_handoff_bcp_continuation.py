from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
SYNC_ID = "GR-SYNC-20260812-21-TASK8-HANDOFF-BCP"
LOCAL_BRANCH = "feat/task8-spell-use-screen-v2"
LOCAL_HEAD = "8c611f601aa98397ed1558e92ab207e0e8347a9b"
PROJECT_MAIN_AT_HANDOFF = "d1e4d747ee1f28b8a29adcd25726fd975a81d168"
PROJECT_HANDOFF_MERGE = "d277a2f5cd4a57947d176e3c49ae7f8f6db97230"
BASE_MAIN_AT_HANDOFF = "1d6cc79ae95ffb67ba4de618f010a6540fc6e02c"
BASE_PROPOSAL_MERGE = "449b83c6f1afdf191327a52a8e71d11b4fba7eb3"
BASE_PROPOSAL_ID = "BCP-2026-024-execution-sandbox-authority-split-recovery"
BASE_PROPOSAL_PR = "https://github.com/alsdmlals4-eng/Base/pull/297"
LEGACY_TASK8_STATUS = "TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING"
LEGACY_NEXT_GATE = "TASK8_RECEIPT_HERA_REVIEW_PR"


class Task8HandoffBcpContinuationTests(unittest.TestCase):
    def _read(self, relative_path: str) -> str:
        return (ROOT / relative_path).read_text(encoding="utf-8")

    def test_current_continuation_owners_route_to_sync21_without_product_promotion(self) -> None:
        for relative_path in (
            "docs/ACTIVE_CONTEXT.md",
            "docs/planning/CURRENT_UNRESOLVED_GATES.md",
        ):
            with self.subTest(path=relative_path):
                text = self._read(relative_path)
                self.assertIn(SYNC_ID, text)
                self.assertIn("TASK8_LOCAL_ACCEPTANCE_PASS_UNMERGED", text)
                self.assertIn("TASK8_PR_PREP_REVERIFY_PENDING", text)
                self.assertIn("CURRENT_DEDICATED_CODEX_REUSE_ALLOWED_FOR_CODEX_ONLY_CONTINUATION", text)
                self.assertIn(LEGACY_TASK8_STATUS, text)
                self.assertIn(LEGACY_NEXT_GATE, text)
                self.assertNotIn("TASK8_MERGED_MAIN_VERIFIED", text)

    def test_sync21_preserves_exact_resume_identity_and_evidence_limits(self) -> None:
        text = self._read(
            "docs/planning/sync/GR-SYNC-20260812-21-TASK8-HANDOFF-BCP.md"
        )
        for required in (
            SYNC_ID,
            LOCAL_BRANCH,
            LOCAL_HEAD,
            PROJECT_MAIN_AT_HANDOFF,
            PROJECT_HANDOFF_MERGE,
            BASE_MAIN_AT_HANDOFF,
            "task8-spell-use-screen-v2@b680",
            "15 tests / 90 assertions / 0 failures",
            "42 suites / 1,588 assertions / 0 failures",
            "HERA_SOURCE_DELTA_NONE_OBSERVED",
            "HISTORICAL_EDIT_OPERATION_RECEIPT_NOT_RETROACTIVELY_PROVABLE",
            "CODEX_FETCH_HEAD_PERMISSION_DENIED",
            "CODEX_GITHUB_NETWORK_BLOCKED",
            "HIGODOT_CURRENT_SESSION_REVALIDATION_REQUIRED",
            "HUMAN_NOT_RUN",
            "DEVICE_NOT_RUN",
            "PERFORMANCE_NOT_RUN",
            "FULL_VERTICAL_SLICE_NOT_RUN",
        ):
            with self.subTest(required=required):
                self.assertIn(required, text)
        self.assertNotIn("TASK8_MERGED_MAIN_VERIFIED", text)

    def test_learning_closure_routes_duplicate_runtime_lesson_to_existing_owner(self) -> None:
        text = self._read(
            "docs/planning/sync/GR-SYNC-20260812-21-TASK8-HANDOFF-BCP.md"
        )
        for required in (
            "LRN-GR-20260812-01",
            "BASE_CANDIDATE",
            "LRN-GR-20260812-02",
            "REUSE_EXISTING_BCP",
            "BCP-2026-015-external-runtime-session-same-snapshot-recovery",
            "LRN-GR-20260812-03",
            "PROJECT_ONLY",
            "PROJECT_APPLICATION = APPLIED",
        ):
            with self.subTest(required=required):
                self.assertIn(required, text)

    def test_base_proposal_storage_closes_learning_without_base_implementation_authority(self) -> None:
        for relative_path in (
            "docs/ACTIVE_CONTEXT.md",
            "docs/planning/CURRENT_UNRESOLVED_GATES.md",
            "docs/planning/sync/GR-SYNC-20260812-21-TASK8-HANDOFF-BCP.md",
        ):
            with self.subTest(path=relative_path):
                text = self._read(relative_path)
                self.assertIn(BASE_PROPOSAL_ID, text)
                self.assertIn(BASE_PROPOSAL_PR, text)
                self.assertIn(BASE_PROPOSAL_MERGE, text)
                self.assertIn("BASE_PROPOSAL_STORAGE_MERGED_SUBMITTED", text)
                self.assertIn("BASE_IMPLEMENTATION_AUTHORITY_NOT_GRANTED_IN_THIS_STAGE", text)
                self.assertIn("LEARNING_CLOSURE_OPEN_COUNT = 0", text)
                self.assertIn("TASK8_PR_PREP_REVERIFY_PENDING", text)

    def test_start_here_and_development_gates_expose_current_codex_reuse_exception(self) -> None:
        for relative_path in (
            "START_HERE.md",
            "docs/DEVELOPMENT_GATES.md",
        ):
            with self.subTest(path=relative_path):
                text = self._read(relative_path)
                self.assertIn(SYNC_ID, text)
                self.assertIn("CURRENT_DEDICATED_CODEX_REUSE_ALLOWED_FOR_CODEX_ONLY_CONTINUATION", text)
                self.assertIn("FRESH_POWERSHELL_REQUIRED_WHEN_SESSION_RECREATION_OR_CAPABILITY_BOUNDARY", text)
                self.assertIn("TASK8_PR_PREP_REVERIFY_PENDING", text)
                self.assertIn(LEGACY_TASK8_STATUS, text)
                self.assertIn(LEGACY_NEXT_GATE, text)

    def test_resume_contract_separates_remote_authority_from_local_executor_capability(self) -> None:
        text = self._read(
            "docs/planning/sync/GR-SYNC-20260812-21-TASK8-HANDOFF-BCP.md"
        )
        for required in (
            "REMOTE_AUTHORITY_RECEIPT",
            "LOCAL_EXECUTION_RECEIPT",
            "EXECUTOR_CAPABILITY_BLOCKER",
            "DO_NOT_RETRY_BLOCKED_REMOTE_CHECK_IN_CODEX",
            "FRESH_GITHUB_CONNECTOR_READBACK_REQUIRED_BEFORE_REMOTE_WRITE",
            "NO_STAGE_COMMIT_PUSH_DURING_HANDOFF",
        ):
            with self.subTest(required=required):
                self.assertIn(required, text)


if __name__ == "__main__":
    unittest.main()
