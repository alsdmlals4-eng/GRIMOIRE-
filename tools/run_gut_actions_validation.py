from __future__ import annotations

import sys

from tools import run_local_gut_validation as validator
from tools.gut_failure_evidence import render_failure_evidence, resolve_evidence_dir


validator.DECISION_ID = "GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01"


def main() -> int:
    return_code = validator.main()
    if return_code != 0:
        print(render_failure_evidence(resolve_evidence_dir(sys.argv[1:])))
    return return_code


if __name__ == "__main__":
    raise SystemExit(main())
