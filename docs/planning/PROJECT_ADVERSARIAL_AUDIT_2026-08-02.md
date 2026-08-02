# GRIMOIRE 프로젝트 적대적 감사 — 2026-08-02

```yaml
mode: REVIEW
skill_modes:
  managing-game-project-operating-system: audit
  running-adversarial-review-and-refinement: repository-wide-audit
  auditing-canonical-reference-freshness: impact-map/content-drift/propagation-gap
baseline_main: 3ecf67cb9e39145976c66cb1f0bc2c42d9c17d03
base_release: 9.4.0
sheet_tabs_inspected: 27
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_validation: NOT_RUN
human_validation: NOT_RUN
```

## 실패 가정

새 작업자가 과거 대화 없이 저장소의 시작 문서와 Google Sheet만 읽었을 때 현재 플랫폼, Base 버전, 완료 Gate, 다음 작업을 잘못 복원하고, 그 잘못된 상태로 PC 중심 기획을 추가하거나 이미 끝난 Asset Spec을 반복할 수 있다고 가정했다.

## 권위 지도

```text
latest explicit user instruction
→ AGENTS.md
→ CURRENT_CONFIRMED_DECISIONS.md
→ START_HERE.md / ACTIVE_CONTEXT.md
→ domain approval documents / DEVELOPMENT_GATES.md
→ PROJECT_BASE_ADAPTER.json / generated views
→ Google Sheet workspace
→ issues / plans / PR history
```

## 검증된 Findings

### P0 — 플랫폼 권위 충돌 (`MUST_FIX`)

- 최신 사용자 결정: `Mobile 우선 / PC 후속`.
- 활성 GitHub·Sheet: `PC 우선 / Mobile 후속`.
- 영향: 입력, 화면 비율, Safe Area, 성능, 일시중단/복귀, 테스트 대상, 출시 순서가 반대로 설계될 수 있다.
- 처리: `GM-PLATFORM-02`로 `GM-PLATFORM-01`을 대체하고 `MOBILE-FOUNDATION-01`을 정합화 Gate로 둔다.

### P0 — 콜드스타트 상태 충돌 (`MUST_FIX`)

- `AGENTS.md`와 `PROJECT_BASE_ADAPTER.json`은 Base v9.4를 반영했다.
- `START_HERE.md`, `ACTIVE_CONTEXT.md`, `CURRENT_CONFIRMED_DECISIONS.md`, `DEVELOPMENT_GATES.md`, Workbook과 Sheet 일부는 Base v9.3·PR #22·Asset Spec 대기 상태를 현행처럼 표시한다.
- 실제 main은 PR #26을 병합한 `3ecf67c...`, Asset Spec은 PR #24·#25로 승인·동기화 완료다.
- 영향: 하나의 질문에 여러 활성 답이 생기고 다음 작업이 Asset Spec 또는 Boss Phase로 갈린다.
- 처리: 활성 시작 문서·상태·Adapter·Sheet를 Base v9.4, Asset Spec 완료, Mobile Foundation 현재 Gate로 통일한다.

### P1 — Adapter 내부 동기화 상태 모순 (`MUST_FIX`)

- `PROJECT_BASE_ADAPTER.json`의 Base는 v9.4지만 `gdd_sheet.main_sync=PENDING_PR_MERGE`, `sync_status=SYNCED_TO_WORKING_BRANCH`, protected baseline은 Asset Spec commit 기준이다.
- 실제 Base v9.4 PR #26은 main에 병합됐고 Sheet write는 명시적으로 `NOT_RUN`이었다.
- 처리: 이 작업의 authority commit 이후 `GITHUB_ONLY`, Sheet Readback 후 `SYNCED_TO_WORKING_BRANCH`로 명확히 갱신한다.

### P1 — 열린 Issue의 구형 차단 조건 (`MUST_FIX`)

- Issue #16은 Base v9.1 채택 작업으로, Base v9.4 PR #26에 의해 완료·대체됐지만 열린 상태다.
- Issue #9는 Art Style을 현재 차단 조건으로 기록하지만 Art Style·Art Bible·Asset Spec은 승인 완료다.
- 처리: #16 완료 처리, #9를 Mobile Foundation·실행 프로필·구현 준비 기준으로 갱신한다.

### P1 — 제품 진행도와 다음 작업 드리프트 (`MUST_FIX`)

- Sheet 일부는 Asset Spec을 현재/다음 Gate로 표시하지만 다른 탭과 변경이력은 승인 완료로 기록한다.
- 구현 파일(`project.godot`, Scene, Script, Resource, 실제 제품 데이터)은 없다.
- 처리: 기획 진척과 제품 구현 진척을 분리한다. 기획은 Asset Spec까지 완료, 제품 구현은 `NOT_STARTED`이며 다음은 Mobile Foundation이다.

### P1 — Mobile 제품 기반 누락 (`SHOULD_FIX`)

현재 정본은 다음을 PC 전용으로 설계했다.

- LMB/RMB/Wheel/Ctrl+Z/Keyboard 입력.
- 16:9, 1280×720 최소 판독, 1920×1080 logical, ultrawide.
- PC Demo와 마우스·펜 사용자 중심 플레이테스트.
- PC 출시 후 Mobile 적응 순서.

Mobile-first에서는 Touch·Stylus, system gesture 충돌, safe area/notch, background/foreground, interrupted stroke, device performance/battery/thermal, 작은 화면의 작성 영역이 핵심 위험이다. 단, OS·방향·수치를 임의 확정하지 않는다.

### P2 — 역사 상태와 활성 상태의 혼재 (`SHOULD_FIX`)

- `02_현재_확정결정`, `01_작업순서`, `99_변경이력`에는 PR #22 working branch 당시 상태가 역사와 현행 구분 없이 남은 곳이 있다.
- 과거 기록은 삭제하지 않고 `ALLOWED_LEGACY/HISTORY`로 유지하되 현재 행·요약에서 재활성화되지 않게 한다.

### P2 — 검증 증거 상한 (`BLOCKED_UNVERIFIED`)

- GitHub connector에서 main HEAD의 combined status와 workflow run을 조회했으나 반환된 상태 항목이 없었다.
- PR #26 본문은 exact HEAD 검사 통과를 주장하지만 이번 세션에서 CI 로그를 독립 재실행하지 않았다.
- 로컬 전체 tracked-file inventory와 generator/unit test는 실행 환경이 없어 `NOT_RUN`이다.
- Google Sheet Readback은 connector로 수행할 수 있으며 실제 쓰기 후 재조회한다.

## 기각한 비판

### `REJECTED_CRITIQUE` — 승인된 코어·전투·아트 전면 재기획

플랫폼 전환은 기존 프로젝트 코어, 상황 해결형 전투, Art Style, Art Bible, Asset Spec을 자동 무효화하지 않는다. 문제는 입력·레이아웃·성능·검증 소비자의 Mobile 적응이며, 승인 내용을 폐기하는 전면 재기획은 범위·비용 대비 근거가 없다.

### `REJECTED_CRITIQUE` — PC 자료 삭제

PC는 후속 플랫폼이며 기존 마우스·키보드·해상도 자료는 호환·적응 근거로 가치가 있다. 활성 기본값에서 내려야 하지만 이력과 후속 계약으로 보존한다.

## 보호 범위

- 프로젝트 코어와 플레이어 약속.
- Vertical Slice, 글자 `흐름/집중/분산`, 작성 횟수·시간 상한.
- Art Style/Bible, Battle Rules, Asset Spec, 잠긴 이미지 SHA.
- `PLANNING_ONLY_PROFILE`, 구현 `NOT_STARTED`, Codex `BLOCKED`.
- 역사 Decision·Sync receipt·PR 기록.

## 권장 다음 작업

```text
GR-SYNC-20260802-07 완료
→ MOBILE-FOUNDATION-01
  → Touch/StyIus interaction contract
  → orientation/aspect/safe-area decision packet
  → mobile interruption/resume state machine
  → device/performance validation matrix
  → small-screen Battle/Writing layout proof
→ BOSS-PHASE-01·GRIMOIRE-SCREEN-01 영향 재검토
→ AUDIO-DIRECTION-01
→ 통합 검수
```

## 현재 판정

`CONFLICT_CONFIRMED / REFINEMENT_IN_PROGRESS`.

GitHub·Sheet·Issue Readback과 Draft PR 생성 뒤 `CONFLICT_FIXED` 여부를 다시 판정한다. Runtime·device·performance·human은 계속 `NOT_RUN`이다.
