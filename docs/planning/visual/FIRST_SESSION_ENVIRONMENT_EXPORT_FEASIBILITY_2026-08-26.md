# First-Session Environment Export Feasibility — 2026-08-26

## Decision

Retain the three IMG-02 images as persisted source candidates and export them at their native `1672×941` resolution as lossless WebP candidates. Do not perform a blind upsample just to satisfy the planned `2560×1440` delivery target.

## Evidence

| Item | Observation |
| --- | --- |
| Source candidates | All three retained PNGs are `1672×941`; they do not exactly meet the planned `2560×1440` delivery target. |
| Local conversion tools | No ImageMagick, `cwebp`, or `ffmpeg` executable is available; Godot 4.7.1's built-in `Image.save_webp(..., true)` produced the three native-resolution lossless WebP candidates. |
| Project importer | Godot is available on the machine and existing PNG imports use the normal texture importer, but no product Scene currently consumes these IMG-02 candidates. |
| Quality risk | Enlarging a finished raster image adds no authored detail and risks softening the fine navy/gold linework and controlled magic-light contrast that the continuity guard protects. |

## Recommended continuation

1. Keep the local PNGs, lossless WebP export candidates, manifests, and Notion records together as the approved source-candidate tier.
2. When the user authorizes product implementation, use the manifest paths for Scene binding; if a 2560×1440 delivery target becomes mandatory, regenerate at that resolution rather than enlarging this finished raster.
3. Do not generate IMG-03 state overlays until the runtime effect-reuse test establishes which state communication belongs to Light, Material, and Particles instead of new background art.

## Not claimed

No Godot Scene binding, gameplay capture, device/performance validation, or release-rights promotion was performed by this feasibility review.
