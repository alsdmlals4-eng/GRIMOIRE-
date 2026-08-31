# Circle / Clock Task8 — Star Runtime Removal Receipt

## 상태

```yaml
decision_id: GM-CIRCLE-CLOCK-CARD-CORE-01
feature_id: FTR-CIRCLE-CLOCK-CARD-CORE-01
work_unit: TASK8_STAR_RUNTIME_REMOVAL_WITH_LEGACY_SAVE_PRESERVED
recorded_at: 2026-09-01
branch: codex/card-clock-system-20260831
state: MACHINE_VERIFIED__EXACT_EDITOR_RUNTIME_OBSERVED__REMOTE_PR_CI_REQUIRED
next_gate: CIRCLE_CLOCK_POST_TASK8_HUMAN_DEVICE_ACCESSIBILITY_PRECHECK
```

## 작업 전 문제

새 기본 진입점과 서클·시계·카드 shell이 이미 존재했지만, `FIVE_POINT_STAR`·`Main/Auxiliary` 전용 runtime source, scene, test runner consumer와 그 전용 test data가 함께 남아 있었다. 이 상태는 별형 주문을 없애고 새 기록에서 서클 경험을 시작한다는 승인된 방향과 충돌했다.

동시에 실제 사용자 소유 legacy Star save는 repository 밖 `user://` 영역에 있어, Star runtime 제거가 그 파일을 자동 변환·이동·삭제하는 이유가 되어서는 안 됐다.

## 채택한 구조와 이유

- `GlyphDefinition`과 vocabulary를 역할 없는 공용 글자로 전환했다. `role`, `Main`, `Support` public API와 registry grouping을 금지하고, 서클은 1~3개 글자의 순서 독립 조합만 해석한다.
- 직접 필기 경험은 `src/ui/glyph_writing/`의 공용 canvas와 `CircleGlyphWritingPanel`로 유지한다. 글자 인식 뒤에도 플레이어가 `글자로 사용`을 명시해야 하며, 한 입력 revision은 한 번만 적용된다.
- `StoryEventRoot`는 서클 Preview → 명시 대상 지정 → 명시 시전 → goal/threat clock 결과 순서를 유지한다. 메뉴·대화 열람·벽시계 시간은 사건 시계를 움직이지 않는다.
- Star-only runtime directory, scene, component, GUT/current-runner suite, old static contract, and stale Frostbloom Star fixture는 scoped 삭제했다. Git history와 superseded documentation은 보존했다.

## legacy save 보존 readback

아래 파일은 읽기 전용으로만 확인했다. 이 work unit은 해당 파일에 write, move, delete, migration을 수행하지 않았다.

```yaml
path: C:/Users/user/AppData/Roaming/Godot/app_userdata/GRIMOIRE Star Circuit Runtime POC/grimoire_campaign_anchor.json
bytes: 4483
last_write_utc: 2026-08-31T00:03:08.8424318Z
sha256: 6E023ABFC03857EAC40E0E9A529EB4FF237036421AE7DB7040C5CF9C0688B944
state: KEEP_UNRESOLVED__COMPATIBILITY_ONLY
```

## 검증 증거

| 검증 | 결과 | 근거와 한계 |
| --- | --- | --- |
| 역할 없는 글자·no-Star guard TDD | PASS | guard와 role-free tests를 먼저 RED로 확인한 뒤, 현재 source/data에서 green으로 전환했다. |
| Godot custom runner | PASS | Godot 4.7.1 headless: 31 suites, 1,370 assertions, 0 failures. |
| full Python static suite | PASS | 231 tests, 2 skipped, 0 failures. v3.1/v4.5 및 Star-only formal current-state를 강제하던 stale static contracts는 현행 v4.8 authority를 검증하지 못하므로 removal scope에서 제외했다. |
| default scene smoke | PASS | Godot 4.7.1 headless `--quit-after 3` exit 0. |
| scoped runtime consumer scan | PASS | `src`, `data`, `tests`, `project.godot`에서 실제 `FIVE_POINT_STAR`, `star_circuit`, `main_glyph`, `auxiliary_glyphs`, retired workflow consumer가 없음을 확인했다. 남은 일치는 role-free negative assertions와 no-Star guard의 금지 path뿐이다. |
| exact-worktree editor front door | OBSERVED | Hera PID 39820, `C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-/.worktrees/p/`; 1280×720 live UI tree 및 runtime screenshot에서 새 기록/이어하기/도감/설정/종료를 확인했고 error/warning 0건이었다. |
| exact-worktree editor first event | OBSERVED | 같은 editor에서 1280×720 `StoryEventRoot`가 직접 글자 새기기, Preview, 대상, 시전, `서리 안정화 0/6`, `온실 균열 확산 0/4`를 함께 표시했다. error/warning 0건이었다. |
| fixture boundary | PASS | `artifacts/foundation-poc/glyph-fixture-rows.json`는 존재 여부만 확인했고 변경하거나 stage하지 않았다. |
| CI contract reconciliation | PREPARED | 삭제된 Star/component-sheet test를 호출하던 workflow를 제거하고, Circle/Clock story runtime의 authority + Godot runner workflow로 교체했다. 원격 CI 결과는 별도 확인이 필요하다. |

## 증명하지 않는 항목

- 사람/플레이어 UX, Mobile device, performance, accessibility, export, full vertical slice, release: `NOT_RUN`.
- legacy Star save의 새 Circle story migration: 구현하지 않았다. 새 경험은 새 기록의 story progress로 시작해야 한다.
- 카드의 mana distribution, draw/mulligan/pass/field/combat/score detailed rules: `RULESET_PENDING`; `[7,7,6] / 20`은 고정 수치가 아닌 예시다.
- 승인된 glyph source images는 catalogued 상태이나 Star 제거 뒤 현재 runtime texture consumer는 없다. provenance-backed source asset일 뿐, current visual binding 증거는 아니다.

## 다음 안전 작업

`CIRCLE_CLOCK_POST_TASK8_HUMAN_DEVICE_ACCESSIBILITY_PRECHECK`에서 실제 story handoff와 first event input을 사람/모바일에 맞춰 검증한다. 카드 상세 룰은 사용자가 제공하는 별도 규칙 결정 뒤에만 구현한다.
