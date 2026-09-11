"""DIAGNOSTIC ONLY: shared-spell-rules-design (2026-09-10), sections 12/17.

These provisional numbers are not production defaults or balance approval.
No card consumption, survival, early victory, draw, persistence or RNG is modeled.
"""


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
