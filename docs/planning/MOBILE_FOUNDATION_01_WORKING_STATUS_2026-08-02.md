# MOBILE-FOUNDATION-01 Working Status — 2026-08-02

```yaml
gate: MOBILE-FOUNDATION-01
status: IN_PROGRESS
primary_platform: Mobile
orientation: LANDSCAPE_FIXED
session_resume_save: CONTRACT_DEFINED
landscape_ux_foundation: CONTRACT_DEFINED_WITH_TEST_VALUES
device_class: USER_APPROVED_ACTIVE
smartphone_quality_gate: REQUIRED
tablet_scope: BEST_EFFORT_SMOKE_ONLY
required_aspect_matrix: DEFINED_FOR_SMARTPHONE
os_store_minimum_device_performance: DEFERRED_WITH_BOUNDARY
implementation: NOT_STARTED
codex: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_playtest: NOT_RUN
```

## 완료한 기획 계약

### GM-MOBILE-SESSION-RESUME-SAVE-01

- Resume Anchor A~D와 Slice Complete.
- `Draft / Recognizing / Candidate / Committed / Resolved / Recorded` 상태 소유권.
- Transient Buffer / Session Snapshot / Persistent Transaction / Progress Save 분리.
- App 중단·프로세스 종료·stale 인식·손상 Save 복구.
- 중복 Commit·비용·피해·보상·마도서 기록 0 계약.

책임 원본: `docs/planning/MOBILE_SESSION_RESUME_SAVE_01_2026-08-02.md`.

### GM-MOBILE-LANDSCAPE-UX-FOUNDATION-01

- Runtime Safe Root·Cutout 경계.
- Android 48dp·iOS 44pt 공식 하한과 프로젝트 48/56 UI unit 시험값 분리.
- Objective/Threat, Player Status, World/Enemy, Writing Rail/Panel, Confirm/Recovery 5구역.
- Rail 12~16%, Full Writing 36~44% 초기 후보.
- UI/Text Scale 100/115/130%, 작성 감속 1.0×/0.5× 시험값.
- Smartphone Landscape 필수 Aspect Matrix와 Tablet Smoke 경계.

책임 원본:

- `docs/planning/MOBILE_LANDSCAPE_UX_FOUNDATION_01_2026-08-02.md`.
- `docs/planning/MOBILE_LANDSCAPE_UX_FOUNDATION_01_DEVICE_CLASS_ADDENDUM_2026-08-02.md`.

### GM-MOBILE-DEVICE-CLASS-01

사용자 승인안 A:

- Smartphone Landscape를 Vertical Slice 필수 지원·품질 Gate로 지정.
- Smartphone 필수 Matrix: `16:9 / 18:9 / 19.5:9 / 20:9 / 좌·우 Cutout / 하단 System indicator`.
- Tablet `4:3 / 3:2`는 Best-effort Smoke Test만 수행.
- Tablet 전용 Layout·동일 품질·Store 정식 지원은 약속하지 않음.
- Foldable·Multi-window는 Vertical Slice 제외.

책임 원본: `docs/planning/MOBILE_DEVICE_CLASS_01_APPROVAL_2026-08-02.md`.

## 공식 벤치마크

- Android 상태 저장·48dp Touch target.
- Apple Landscape 게임 Control·44pt 주요 Touch target·Safe Area.
- Godot `DisplayServer.get_display_safe_area()`·`get_display_cutouts()`.

책임 원본: `docs/planning/benchmarks/MOBILE_FOUNDATION_PLATFORM_GUIDELINES_BENCHMARK_2026-08-02.md`.

## 다음 순서

```text
Smartphone Landscape Writing/Battle Wireframe 계약
→ Android/iOS·Store·최소 기기·성능 Decision Packet
→ MOBILE-FOUNDATION-01 통합 승인
→ 구현 계획
```

Writing Rail/Panel 비율, Touch UI unit, UI/Text Scale, 감속, Canvas 최소 크기는 계속 `TEST_VALUE`이며 Runtime·실기기·사람 검증 전 확정하지 않는다.

제품 구현·Godot Scene·Script·Resource·Asset 제작은 계속 금지한다.
