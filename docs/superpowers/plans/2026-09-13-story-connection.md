# First-school-story connection implementation plan

Goal: connect existing playable lesson, duel and greenhouse in canonical S00-S05 order with preserved results and resumable current activity. Continue inline in approved workspace; do not modify legacy main, unrelated files or final art status.

S00-S05 delivered: eight runners687 assertions0 failures, live editor sequence and save/review choice verified. Runtime26212 diagnostics0/0, story-bridge-review-20260913.png. Further read found concrete LAB_SAMPLE_02 table in Blueprint24; earlier 'not specified' below is superseded by 'specified, not implemented'. Next task must port that table to shared rules owner before code, preserving existing greenhouse and standalone event IDs.

Spec: shared-spell-rules-design section15.2 and human-blueprint sections10-13. S06 specimen task is not yet specified as executable data; expose honest continuation boundary at S05 rather than skip to festival or claim chapter completion.

Research ADOPT: ink separates narrative state from game UI and saves current story state (https://www.inklestudios.com/2021/02/22/ink-version-1 and https://github.com/inkle/ink/blob/master/Documentation/RunningYourInk.md). ADAPT small fixed story coordinator with existing reducers; REJECT new narrative engine/dependency or inferred relationship points. No dialogue choice is auto-selected.

Architecture: story_flow.gd owns stage0..5, current activity snapshot and completed activity snapshots keyed2/3/4. Strict validation checks prefix, exact event IDs and terminal records with existing validators. story_save.gd specializes two-slot envelope in a new directory. story_screen.gd shows authored story copy or embeds existing activity screens; embedded child signals change/finish, disables local save/retry ownership and autosaves through parent. Completed actions remain idempotent via existing reducers. Dialogue advance carries expected stage to reject double clicks; advancing ongoing activity rejected. No numerical reward added.

- [ ] RED runner: missing coordinator; sequential S00/S01, reject early lesson advance, resolve lesson, duel STOP retained, greenhouse HELP retained, no skipped stage, invalid mixed-event save rejected, S05 stops honestly; copies independent.
- [ ] Implement coordinator/store and replayable payload validation. Existing event validity is structural not cryptographic/history proof; do not strengthen claims.
- [ ] RED screen embedding/lifecycle, autosave resume and target footer size; implement story scene and explicit child signals with standalone behavior unchanged. S00 uses existing generic player name '나', profile editor pending. S05 shows objective facts, not false praise.
- [ ] Run coordinator/UI + event/duel regression; exact Godot scene live from admission through lesson/duel/greenhouse with result readback and error check. Update Active Context/START_HERE and sync current branch only.

Five review axes: canonical order, state/terminal/prefix validation, autosave ownership and failure reporting, embedded controls/layout, runtime/regression. This is partial first-chapter functional integration, not final visuals, S06-S08, default-menu replacement, Human/mobile/release completion.

Follow-up within S05: Blueprint explicitly requires '원인부터 / 위험부터 생각했다' choice. Add optional reflection field (empty default supports earlier bridge development saves), allowed only stage5 and never inferred from spells. Flow.reflect returns copied state; UI choices call it and autosave. Report it as player's explanation, not objective action-order evidence or relationship reward. Add RED missing reflect and tests for early/unknown rejection, explicit choice and restore. Keep the S06 boundary open.
