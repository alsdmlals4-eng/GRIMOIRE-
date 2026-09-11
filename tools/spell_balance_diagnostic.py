"""DIAGNOSTIC ONLY: shared-spell-rules-design (2026-09-10), sections 12/17.

These provisional numbers are not production defaults or balance approval.
No card consumption, survival, early victory, draw, persistence or RNG is modeled.
"""

from itertools import combinations


def damage(attack: int, guard: int) -> int:
    """Nonnegative internal diagnostic inputs only; survival is not modeled."""
    return max(0, attack - guard)


def focus_pair(shields: tuple[int, int]) -> tuple[int, int]:
    """Compare gather/ember and ember/ember under nonnegative shield inputs.

    Returns total damage for each two-exchange path. Both paths are assumed
    legal and neither survival nor early match termination is modeled.
    """
    return (
        damage(4, shields[1]),
        damage(3, shields[0]) + damage(3, shields[1]),
    )


def opening_counts() -> dict[str, int]:
    """Count physical opening hands, not uniformly weighted kind patterns.

    Source: shared-spell rules sections 15.1/17; two copies of each kind.
    The 41 and 15 sets can overlap. Opening eligibility does not guarantee
    later casts: draws, consumption, survival and future hands are excluded.
    """
    deck = ("EMBER", "EMBER", "WIND", "WIND",
            "WARD", "WARD", "GATHER", "GATHER")
    rows = [tuple(deck[i] for i in ids) for ids in combinations(range(8), 4)]
    return {
        "total": len(rows),
        "no_direct_glyph": sum("EMBER" not in h and "WIND" not in h for h in rows),
        "gather_and_ember": sum("GATHER" in h and "EMBER" in h for h in rows),
        "two_embers": sum(h.count("EMBER") == 2 for h in rows),
    }
