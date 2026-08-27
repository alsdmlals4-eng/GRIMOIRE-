# Task10 UI Hierarchy Repair Plan

Issue: #196

1. Reproduce the Task9 product-root layout at 1280×720 through Hera and inspect the runtime Control tree.
2. Remove duplicate screen descendants from the product root through the Godot editor, leaving each packed screen as the single owner of its controls.
3. Move the required sizing to `glyph_drawing_screen.tscn` and `circuit_placement_screen.tscn`.
4. Correct the spell-use surface copy to the approved Korean player-facing terms.
5. Add regression checks for single ownership, actionable sizing, and Korean baseline labels.
6. Run the full Godot runner and inspect glyph, circuit, and spell-use states with Hera.
7. Record the Godot authoring receipt, commit only task-owned files, then create and validate the issue PR.
