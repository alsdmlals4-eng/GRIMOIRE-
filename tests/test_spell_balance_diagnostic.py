"""Regression checks for the diagnostic, not the Godot game rules."""

import unittest

from tools.spell_balance_diagnostic import damage, focus_pair


class ArithmeticTests(unittest.TestCase):
    def test_heat_boundaries(self):
        self.assertEqual(
            [(damage(h, 4), damage(h, 5)) for h in (3, 4, 5, 6)],
            [(0, 0), (0, 0), (1, 0), (2, 1)],
        )

    def test_shield_suppression(self):
        self.assertEqual(
            [(damage(3, s), damage(3, max(0, s - 3))) for s in (0, 3)],
            [(3, 3), (0, 3)],
        )

    def test_focus_pair(self):
        self.assertEqual(
            [focus_pair(s) for s in ((0, 3), (3, 0), (0, 0))],
            [(1, 3), (4, 3), (4, 6)],
        )


if __name__ == "__main__":
    unittest.main()
