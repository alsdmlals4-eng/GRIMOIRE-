---
name: magic-writing-recovery
description: Recover from mobile magic-letter writing recognition or grammar failures while preserving the player’s intended spell. Use for GRIMOIRE writing UX, input error, undo, retry, and recognition-feedback work.
---

# Magic Writing Recovery

Read `docs/UX_UI_SYSTEM.md`, `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`, and the current decision sources before proposing a change.

1. Separate input capture, recognition, grammar validation, and resource or state failure; never present them as one vague error.
2. Preserve the drawn input and show the recognized letter or connection before the player commits a cost.
3. Offer the smallest reversible recovery: retry the stroke, choose an alternative recognition only when evidence supports it, undo the latest circuit change, or resume from the saved partial circuit.
4. State the cause, the recoverable action, and the unchanged consequence in Korean plain language.
5. Do not silently substitute a spell, consume a resource for an uncommitted attempt, or widen recognition tolerance without a validated design decision.
6. Keep direct writing, stock preparation, and summon boundaries from the canonical planning sources intact.

Report the failure class, player-visible recovery, required evidence, and any unresolved accessibility or device-validation gate. Runtime or Android success remains `NOT_RUN` until independently tested.
