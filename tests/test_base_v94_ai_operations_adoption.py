from __future__ import annotations
import json,unittest
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
class TestBaseV94Grimoire(unittest.TestCase):
 def test_identity_routes_and_state(self):
  a=json.loads((ROOT/'skills/PROJECT_BASE_ADAPTER.json').read_text(encoding='utf-8')); self.assertEqual('9.4.0',a['base_release']['version']); self.assertEqual('3f2c4a624d302b704c1b5322eb5c9f34ad55abb9',a['base_release']['release_commit']); self.assertEqual('ff117d24d5bdb121314e109a6aa9b4f552e0fdc1',a['base_release']['release_evidence_commit']); self.assertEqual('693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59',a['base_release']['registry_sha256']); self.assertIn('optimizing-ai-model-and-prompt-costs',{x['route_id'] for x in a['routing']['base_routes']}); self.assertEqual({'magic-writing-recovery','art-style-decision-gate'},{x['route_id'] for x in a['routing']['project_routes']}); self.assertEqual('PLANNING_ONLY_PROFILE',a['project']['execution_profile']); self.assertEqual('NOT_STARTED',a['current_state']['implementation'])
 def test_contracts(self):
  ai=(ROOT/'docs/AI_WORKFLOW.md').read_text(encoding='utf-8'); ux=(ROOT/'docs/UX_UI_SYSTEM.md').read_text(encoding='utf-8'); audit=(ROOT/'docs/reviews/2026-08-01_BASE_V9_4_ADOPTION_AUDIT.md').read_text(encoding='utf-8')
  for x in ('[모델 추천]','HARD_CONSTRAINT','Interface-first','Example-as-Fixture','refresh_trigger','NOT_RUN'): self.assertIn(x,ai)
  for x in ('입력 접수','처리 중','중단','즉시 완료','빠른 반복','재진입','Reduced Motion','mute','haptic-off','권위 시점'): self.assertIn(x,ux)
  self.assertIn('product_paths_changed: false',audit); self.assertIn('HUMAN_NOT_RUN',audit)
if __name__=='__main__': unittest.main()
