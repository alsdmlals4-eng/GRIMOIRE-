# PR151 stale-state reconciliation scope

Bounded current-state correction only.

- Treat merged PR #151 as merged history, not open protected work.
- Preserve Task8 recovery as the current execution gate.
- Preserve Human/Device/Performance/Full Vertical Slice `NOT_RUN` ceilings.
- Do not change gameplay, scenes, resources, data, Task8 product source, or Notion content in this repository PR.
- The existing current-authority regression is updated first so the stale state fails before the owner correction.
