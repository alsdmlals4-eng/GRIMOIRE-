from __future__ import annotations

from tools import run_local_gut_validation as validator


validator.DECISION_ID = "GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01"


def main() -> int:
    return validator.main()


if __name__ == "__main__":
    raise SystemExit(main())
