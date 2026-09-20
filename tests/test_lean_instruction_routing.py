import hashlib
import subprocess
import tempfile
import unittest
import json
import os
import sys
from pathlib import Path

from tools import generate_project_operating_views as operating


class AdoptedSourceTests(unittest.TestCase):
    def setUp(self):
        scratch = operating.ROOT / "artifacts" / "local-validation"
        scratch.mkdir(parents=True, exist_ok=True)
        self.folder = tempfile.TemporaryDirectory(dir=scratch)
        self.addCleanup(self.folder.cleanup)
        self.repo = Path(self.folder.name)
        self.git('init', '-q')
        (self.repo / 'skills/demo').mkdir(parents=True)
        self.file = self.repo / 'skills/demo/SKILL.md'
        self.file.write_text('approved body', encoding='utf-8')
        self.git('add', '.')
        self.git('-c', 'user.name=Test', '-c', 'user.email=test@example.invalid', 'commit', '-qm', 'approved')
        self.sha = self.git('rev-parse', 'HEAD').strip()
        self.git('update-ref', 'refs/remotes/origin/main', self.sha)
        self.adapter = {'base_policy_adoption': {'source_commit': self.sha,
            'owner_paths': ['skills/demo/SKILL.md']}}

    def git(self, *args):
        return subprocess.check_output(['git', '-C', str(self.repo), *args]).decode('utf-8')

    def read(self, path='skills/demo/SKILL.md'):
        self.assertTrue(callable(getattr(operating, 'read_adopted_base_source', None)), 'Exact adopted source loader missing')
        return operating.read_adopted_base_source(self.repo, self.adapter, path)

    def test_reads_git_object_not_untrusted_working_copy(self):
        self.file.write_text('stale or dirty body', encoding='utf-8')
        result = self.read()
        self.assertEqual(result['text'], 'approved body')
        self.assertEqual(result['sha256'], hashlib.sha256(b'approved body').hexdigest())

    def test_remote_drift_is_visible_without_silent_upgrade(self):
        self.file.write_text('new unadopted rule', encoding='utf-8')
        self.git('add', '.')
        self.git('-c', 'user.name=Test', '-c', 'user.email=test@example.invalid', 'commit', '-qm', 'new')
        self.git('update-ref', 'refs/remotes/origin/main', self.git('rev-parse', 'HEAD').strip())
        result = self.read()
        self.assertEqual(result['text'], 'approved body')
        self.assertTrue(result['remote_drift'])

    def test_unapproved_path_is_refused(self):
        self.assertTrue(callable(getattr(operating, 'read_adopted_base_source', None)), 'Exact adopted source loader missing')
        with self.assertRaises(ValueError):
            self.read('../private.md')

    def test_nonancestor_source_is_refused(self):
        self.git('checkout', '--orphan', 'other')
        self.git('-c', 'user.name=Test', '-c', 'user.email=test@example.invalid', 'commit', '-qm', 'other')
        self.git('update-ref', 'refs/remotes/origin/main', self.git('rev-parse', 'HEAD').strip())
        self.assertTrue(callable(getattr(operating, 'read_adopted_base_source', None)), 'Exact adopted source loader missing')
        with self.assertRaises(ValueError):
            self.read()

    def test_cli_is_utf8_even_with_windows_legacy_encoding(self):
        self.file.write_text("마법 — 재미", encoding="utf-8")
        self.git("add", ".")
        self.git("-c", "user.name=Test", "-c", "user.email=test@example.invalid",
                 "commit", "-qm", "unicode")
        self.sha = self.git("rev-parse", "HEAD").strip()
        self.git("update-ref", "refs/remotes/origin/main", self.sha)
        adapter = operating.read_json(operating.ADAPTER_PATH)
        adapter["base_policy_adoption"] = {
            "source_commit": self.sha, "owner_paths": ["skills/demo/SKILL.md"]}
        fixture = self.repo / "adapter.json"
        fixture.write_text(json.dumps(adapter), encoding="utf-8")
        code = ("from pathlib import Path; from tools import generate_project_operating_views as m; "
                "m.ADAPTER_PATH=Path(" + repr(str(fixture)) + "); raise SystemExit(m.main())")
        result = subprocess.run(
            [sys.executable, "-c", code, "--base-root", str(self.repo),
             "--read-base-path", "skills/demo/SKILL.md"],
            cwd=operating.ROOT, capture_output=True,
            env={**os.environ, "PYTHONIOENCODING": "cp949"})
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(json.loads(result.stdout.decode("utf-8"))["text"], "마법 — 재미")

    def test_empty_read_request_cannot_fall_through_to_writing_views(self):
        output = self.repo / "must-not-exist"
        code = ("from pathlib import Path; from tools import generate_project_operating_views as m; "
                "m.ROOT=Path(" + repr(str(self.repo)) + "); "
                "m.OUTPUTS={key: m.ROOT / 'must-not-exist' for key in m.OUTPUTS}; "
                "raise SystemExit(m.main())")
        result = subprocess.run([sys.executable, "-c", code, "--base-root",
                                 str(self.repo), "--read-base-path", ""],
                                cwd=operating.ROOT, capture_output=True)
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse(output.exists(), "Read-only invocation wrote a view")


class LeanRoutingContractTests(unittest.TestCase):
    def text(self, path):
        return (operating.ROOT / path).read_text(encoding="utf-8")

    def test_current_frontdoors_are_small_and_point_to_single_owners(self):
        agents = self.text("AGENTS.md")
        start = self.text("START_HERE.md")
        for body in (agents, start):
            self.assertLess(len(body.encode("utf-8")), 6500)
            self.assertIn("docs/ACTIVE_CONTEXT.md", body)
            self.assertIn("docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md", body)
            self.assertNotIn("adversarial_full_loop_minimum: 5", body)
            self.assertNotIn("layout: FIVE_POINT_STAR", body)
        self.assertIn("총 2회", agents)
        for term in ("NOT_RUN", "전역 설정", "저장 호환성", "다른 PR",
                     "크로마키", "월간 작업일지", "force/direct-main/admin"):
            self.assertIn(term, agents)

    def test_history_is_preserved_but_not_execution_authority(self):
        for name in ("AGENTS.md", "START_HERE.md"):
            archived = self.text("docs/archive/authority-before-lean/" + name)
            self.assertTrue(archived.startswith("# HISTORY_ONLY"))
            self.assertIn("FIVE_POINT_STAR", archived)
        self.assertIn("역사", self.text("START_HERE.md"))

    def test_local_skills_do_not_reintroduce_drawing_or_reopen_global_art(self):
        writing = self.text("skills/magic-writing-recovery/SKILL.md")
        art = self.text("skills/art-style-decision-gate/SKILL.md")
        self.assertIn("not for current card composition", writing)
        self.assertIn("do not select this Skill", writing)
        self.assertIn("not current approval authorities", art)
        self.assertIn("hold only its dependent", art)

    def test_exact_source_and_fun_binding_are_generated_and_resolvable(self):
        adapter = operating.read_json(operating.ADAPTER_PATH)
        snapshot = operating.read_json(operating.OUTPUTS["snapshot"])
        adoption = adapter["base_policy_adoption"]
        self.assertEqual(adoption, snapshot["base_policy_adoption"])
        self.assertEqual([883, 885], adoption["base_prs"])
        self.assertEqual("9.4.3", adapter["base_release"]["version"])
        self.assertEqual(2, adoption["full_scope_review_budget"])
        for link in (adoption["owner"], adoption["fun_binding"]):
            path, anchor = link.split("#")
            self.assertIn('id="' + anchor + '"', self.text(path))
        self.assertIn("--read-base-path", self.text(
            ".agents/skills/grimoire-workflow-router/SKILL.md"))

    def test_fun_contract_keeps_evidence_and_product_branch_boundaries(self):
        ux = self.text("docs/UX_UI_SYSTEM.md").split("\n---\n")[0]
        for term in ("GM-FUN-SPELL", "GM-FUN-EVENT", "GM-FUN-DUEL", "GM-FUN-STORY",
                     "NOT_MERGED_PRODUCT", "PLANNED", "counterevidence",
                     "DOC / MACHINE / RUNTIME / HUMAN / USER_APPROVAL / RELEASE",
                     "NOT_RUN", "REUSED_EVIDENCE", "가상 플레이어"):
            self.assertIn(term, ux)

    def test_generated_views_cannot_present_historical_state_as_current_owner(self):
        adapter = operating.read_json(operating.ADAPTER_PATH)
        result = operating.generate(adapter, "test")
        for name in ("base_view", "skill_view"):
            self.assertEqual(adapter["authority_scope"], result[name]["authority_scope"])
        skill = result["skill_view"]
        self.assertNotIn("approved_visual_manifest", skill["asset_and_license"])
        self.assertEqual("docs/ACTIVE_CONTEXT.md", skill["asset_and_license"]["approval_owner"])
        self.assertNotIn("docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
                         skill["current_truth_sources"])
        self.assertIn("Historical product snapshot", result["dashboard"])
        self.assertNotIn("Current work", result["dashboard"])
