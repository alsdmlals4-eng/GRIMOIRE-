import unittest
from tools import check_chapter_export as export


class ChapterExportTests(unittest.TestCase):
    def test_both_presets_are_audited(self):
        self.assertTrue(hasattr(export, "audit"), "QA preset needs the same closure gate")
        preset = (export.ROOT / "export_presets.cfg").read_text(encoding="utf-8-sig")
        self.assertTrue(export.audit(preset)["valid"])
        first, qa = preset.split("[preset.1]", 1)
        broken = first + "[preset.1]" + qa.replace('"res://src/core/shared_spell/story_save.gd", ', "")
        self.assertFalse(export.audit(broken)["valid"])
        self.assertIn("res://src/core/shared_spell/story_save.gd", export.audit(broken)["presets"][1]["missing"])
        self.assertFalse(export.audit(first)["valid"], "missing QA preset must not silently pass")


if __name__ == "__main__":
    unittest.main()
