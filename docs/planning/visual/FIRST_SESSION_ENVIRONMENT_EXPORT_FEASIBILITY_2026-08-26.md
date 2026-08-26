# First-Session Environment Export Feasibility — 2026-08-26

## Decision

Retain the three IMG-02 images as persisted source candidates. Do not perform a blind upsample or lossy conversion just to satisfy the planned `2560×1440 WebP Lossless` export string.

## Evidence

| Item | Observation |
| --- | --- |
| Source candidates | All three retained PNGs are `1672×941`; they do not exactly meet the planned `2560×1440` delivery target. |
| Local conversion tools | No ImageMagick, `cwebp`, or `ffmpeg` executable is available in the current fresh readback. |
| Project importer | Godot is available on the machine and existing PNG imports use the normal texture importer, but no product Scene currently consumes these IMG-02 candidates. |
| Quality risk | Enlarging a finished raster image adds no authored detail and risks softening the fine navy/gold linework and controlled magic-light contrast that the continuity guard protects. |

## Recommended continuation

1. Keep the local PNGs and their Notion records as the approved source-candidate tier.
2. When the user authorizes product implementation, select either a quality-preserving export toolchain or a regeneration path at the required delivery resolution before adding runtime files/manifests.
3. Do not generate IMG-03 state overlays until the runtime effect-reuse test establishes which state communication belongs to Light, Material, and Particles instead of new background art.

## Not claimed

No runtime export, Godot binding, gameplay capture, device/performance validation, or release-rights promotion was performed by this feasibility review.
