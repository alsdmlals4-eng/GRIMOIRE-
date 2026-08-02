# MOBILE-FOUNDATION-01 Working Status — 2026-08-02

```yaml
gate: MOBILE-FOUNDATION-01
status: IN_PROGRESS
primary_platform: Mobile
orientation: LANDSCAPE_FIXED
session_resume_save: CONTRACT_DEFINED
landscape_ux_foundation: PARTIAL_CONTRACT_DEFINED
device_class: USER_DECISION_REQUIRED
required_aspect_matrix: BLOCKED_BY_DEVICE_CLASS
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
- 16:9~20:9·좌우 Cutout Smartphone 검증 후보.

책임 원본: `docs/planning/MOBILE_LANDSCAPE_UX_FOUNDATION_01_2026-08-02.md`.

## 공식 벤치마크

- Android 상태 저장·48dp Touch target.
- Apple Landscape 게임 Control·44pt 주요 Touch target·Safe Area.
- Godot `DisplayServer.get_display_safe_area()`·`get_display_cutouts()`.

책임 원본: `docs/planning/benchmarks/MOBILE_FOUNDATION_PLATFORM_GUIDELINES_BENCHMARK_2026-08-02.md`.

## 현재 사용자 Decision

`GM-MOBILE-DEVICE-CLASS-01`:

- A: Smartphone 우선 정식 Gate + Tablet Best-effort Smoke Test. **권장안**.
- B: Smartphone·Tablet 동시 정식 지원.
- C: Smartphone 전용·Tablet 명시적 미지원.

책임 원본: `docs/planning/MOBILE_DEVICE_CLASS_01_GRILL_ME_2026-08-02.md`.

## 다음 순서

```text
GM-MOBILE-DEVICE-CLASS-01 사용자 결정
→ 필수 Aspect·기기 Matrix 확정
→ Smartphone Landscape Writing/Battle Wireframe 계약
→ Android/iOS·Store·최소 기기·성능 Decision Packet
→ MOBILE-FOUNDATION-01 사용자 승인
```

제품 구현·Godot Scene·Script·Resource·Asset 제작은 계속 금지한다.
