# GRIMOIRE 개발·기획 게이트

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
baseline_date: 2026-08-02
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE
primary_platform: Mobile
follow_up_platform: PC
platform_decision: GM-PLATFORM-02
mobile_orientation_decision: GM-MOBILE-ORIENTATION-01
mobile_orientation: LANDSCAPE_FIXED
planning: APPROVED
art_style_01: APPROVED_A_MODIFIED_LOCKED
art_bible_01: APPROVED_DUAL_STANDARD_ART_BIBLE
battle_screen_layout_01: APPROVED
battle_single_enemy_focus_01: APPROVED
battle_active_timer_01: APPROVED
battle_time_flow_01: APPROVED
battle_rules_01: APPROVED_SITUATION_RESOLUTION_RULES
asset_spec_01: APPROVED_SPEC
next_product_gate: MOBILE-FOUNDATION-01
queued_design_gates: BOSS-PHASE-01 / GRIMOIRE-SCREEN-01 / AUDIO-DIRECTION-01
implementation_ready: false
codex: BLOCKED
```

현재 승인은 기획·시각 규칙·전투 구조·Asset 제작 계약과 Mobile Landscape 방향을 확정한다. Mobile 실기기 구현·성능·접근성·사람 플레이 통과를 의미하지 않는다.

## 1. 전체 경로

```text
Gate 1 콘셉트·Vertical Slice — 완료
→ 기획 완결·벤치마킹·적대적 검토 — 완료
→ ART-STYLE-01 — 완료
→ ART-BIBLE-01 — 완료
→ 전투 화면·단일 강적·Active Timer·Time Flow·Battle Rules — 완료
→ ASSET-SPEC-01 — 완료
→ GM-PLATFORM-02 — Mobile 우선 승인
→ GM-MOBILE-ORIENTATION-01 — Landscape 고정 승인
→ MOBILE-FOUNDATION-01 — 현재 Gate
→ BOSS-PHASE-01·Grimoire/Main 파생 화면 영향 재검토
→ AUDIO-DIRECTION-01
→ Mobile 기준 기획·아트·UX 통합 검수
→ 사용자 Codex Plan 승인
→ Codex read-only Plan
→ 기술 검수
→ 실행 프로필 전환 승인
→ Validation-First 구현
→ QA·외부 플레이테스트
```

## 2. 완료된 기획·시각 Gate

### Gate 1·Vertical Slice

상태: `APPROVED`.

- 플레이어 약속과 비타협 코어.
- 수업·시험·축제·현장·귀환.
- 자유일정 3회.
- 목표 45~50분, 콘텐츠 상한 53분, 하드 상한 60분.
- 글자 `흐름 / 집중 / 분산`.
- 직접 작성 성공 7회, 복구 포함 목표 상한 10회.

### Art Style

상태: `APPROVED_A_MODIFIED_LOCKED`.

- 잠긴 기준 이미지 SHA-256: `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`.
- 원본 수정·재생성 금지.

### Art Bible

상태: `APPROVED_DUAL_STANDARD_ART_BIBLE`.

- Soft Storybook 배경 + Anime Cel 캐릭터.
- Navy/Gold UI + Blue Glyph.
- 고정 주인공 1명·전투 초상 1개.
- 동반 정령·수호 상태 배지.
- 우측 작성 Panel 축소→확장.
- Grimoire 화면 우선 파생.

### Asset Spec

상태: `APPROVED_SPEC`.

책임 원본: `docs/planning/ASSET_SPEC_01_APPROVAL_2026-08-01.md`.

- 해상도·형식·수량 상한·Manifest·License 계약 승인.
- 기존 16:9·720p/1080p/1440p·Ultrawide 검증 기준은 Mobile 실기기 적합성을 자동 증명하지 않음.
- 실제 Asset 제작·Godot Import·Memory·Runtime 검증은 `NOT_STARTED/NOT_RUN`.

## 3. 완료된 전투 Gate

### GM-BATTLE-SCREEN-LAYOUT-01

상태: `APPROVED_LAYOUT_DIRECTION`.

```text
상단·중앙 적·환경
+ 좌측 하단 주인공 초상
+ 좌측 보조 동반·수호 배지
+ 직접 작성 영역
```

### GM-BATTLE-SINGLE-ENEMY-FOCUS-01

상태: `APPROVED_ENCOUNTER_DIRECTION`.

- 강한 적 1개체.
- 잡몹·웨이브 제외.
- 일반 적 단일 페이즈.

### GM-BATTLE-ACTIVE-TIMER-INSTANT-CAST-PHASES-01

상태: `APPROVED_CORE_BATTLE_FLOW`.

- 적 주기공격.
- `[구현]` 후 마나 검증·즉시 시전.
- 보스만 다중 페이즈.

### GM-BATTLE-TIME-FLOW-01

상태: `APPROVED_TIME_FLOW_DIRECTION`.

- 판단·작성 중 진행.
- 시스템 해결 중 정지.
- 선택형 작성 감속.
- 동시 해결 금지·먼저 승인된 Event 우선.

### GM-BATTLE-RULES-01

상태: `APPROVED_SITUATION_RESOLUTION_RULES`.

- 적 HP 0 처치 대신 불안정도 0 진정·해결.
- 플레이어 HP 0 또는 선언된 치명적 환경 붕괴가 패배.
- 환경 보존도·부작용·남은 HP가 결과 품질을 결정.
- 수호 소환수는 다음 공격 피해를 완화하지만 Timer·작성·판단을 대행하지 않음.

## 4. GM-PLATFORM-02

상태: `USER_APPROVED_ACTIVE`.

책임 원본: `docs/planning/PLATFORM_MOBILE_FIRST_02_2026-08-02.md`.

- 1차 플랫폼 `Mobile`, 후속 플랫폼 `PC`.
- 기존 `GM-PLATFORM-01 / PC 우선·Mobile 후속`은 `SUPERSEDED`.
- 승인 코어·Slice·Art·Battle·Asset Spec은 보존한다.
- PC 전용 입력·해상도·테스트·출시 순서는 Mobile 기준으로 재검토한다.

## 5. GM-MOBILE-ORIENTATION-01

상태: `USER_APPROVED_ACTIVE`.

책임 원본: `docs/planning/MOBILE_ORIENTATION_01_APPROVAL_2026-08-02.md`.

- Mobile Vertical Slice의 Main·Field·Dialogue·Schedule·Writing·Battle·Result·Grimoire·Settings는 Landscape 고정.
- Portrait Gameplay와 Runtime 자동 회전은 Vertical Slice 범위에서 제외.
- 기존 16:9 자료는 Landscape 파생 기준으로 보존하지만 Mobile 실기기 품질 통과 증거로 자동 승격하지 않음.
- 한손 Portrait 편의보다 직접 작성 Canvas와 적 위험·상태·작성 정보의 동시 판독을 우선.
- Landscape 고정의 진입 마찰과 작은 기기 피로는 Resume Anchor·실기기 테스트·접근성 검증으로 다룸.

## 6. MOBILE-FOUNDATION-01

상태: `CURRENT_RECONCILIATION_GATE`.

목표: 승인된 직접 작성·상황 해결 코어가 Landscape Mobile에서 입력·화면·중단·성능 문제로 약화되지 않는 최소 기반을 확정한다.

확정·검증 대상:

1. Touch·Stylus stroke 입력과 후보 확인.
2. 화면 내 Undo·부분 삭제·전체 초기화·취소·확정·`[구현]`.
3. interrupted stroke·multi-touch·system gesture·stale recognition·중복 Commit 방어.
4. App pause/resume·background/foreground·focus loss 상태 유지.
5. Landscape 지원 Aspect Ratio·Safe Area·Notch·최소 Touch target 후보.
6. 작은 화면에서 적 위험·목표·주인공 상태·작성 Panel의 가림 방지.
7. Resume Anchor·자동 저장·이어하기·Draft 저장 소유권.
8. Memory·Texture·load·frame pacing·battery·thermal 측정 계획.
9. Android/iOS·Store·최소 기기·성능 목표 결정을 위한 사용자 패킷.
10. 후속 PC Mouse/Pen/Keyboard 적응 원칙.

통과 조건:

- 입력 실패·문법 실패·상황 설계 실패·비용 부족을 구분한다.
- 낮은 확신 후보 자동 선택과 자동 시전을 하지 않는다.
- 앱 중단·복귀와 입력 재진입에서 중복 시전·보상·기록·손상 상태가 없다.
- Landscape 화면 후보가 적·위험·작성 정보를 동시에 가리지 않는다.
- Portrait·자동 회전을 Vertical Slice 필수 지원으로 조용히 확장하지 않는다.
- Aspect Ratio·Safe Area·성능 수치는 근거 또는 사용자 승인 없이 최종 확정하지 않는다.
- 사용자가 Mobile Foundation 계약을 승인한다.

## 7. 후속 설계 Gate

### BOSS-PHASE-01

상태: `QUEUED_REVIEW_AFTER_MOBILE_FOUNDATION`.

- 보스 페이즈 수·전환 상태·Attack Timer·작성 Draft·환경 변화·반복 악용 방지.
- Landscape 화면과 중단·복귀 계약에 맞는지 재검토 후 확정.

### GRIMOIRE-SCREEN-01

상태: `QUEUED_REVIEW_AFTER_MOBILE_FOUNDATION`.

- 상황·글자·의도·결과·부작용·발견 관리.
- 자동 최적 추천·자동 시전 금지.
- Landscape 작은 화면 탐색·텍스트·Touch 조작 검증 필요.

### MAIN-SCREEN-01

상태: `QUEUED_AFTER_GRIMOIRE_SCREEN`.

- `새 게임 / 이어하기 / 설정` 중심 최소 구조.
- 수집형 로비 UI 금지.
- Portrait 별도 Main을 Vertical Slice 범위에 추가하지 않음.

### NAMING-PASS-01

상태: `NONBLOCKING_PENDING`.

- 세계 명명 규칙과 주요 이름.
- Mobile Foundation을 차단하지 않음.

## 8. AUDIO-DIRECTION-01

상태: `QUEUED`.

- 학교·시험·축제·현장·귀환의 청각 정체성.
- 획·후보·확정·시전·실패 원인 SFX.
- 적 공격 예고·Time State·Instability·Result 피드백.
- 무음 대체·haptic-off·Mobile speaker/headphone 환경과 License 우선순위.

## 9. 통합 검수

상태: `BLOCKED_BY_MOBILE_FOUNDATION_DERIVATIVE_SCREENS_AND_AUDIO`.

확인:

- Glyph·대상·위험 판독성.
- Art Bible·Asset Spec과 Landscape Mobile 화면 소비자 일치.
- 45~50/53/60분 시간 계약과 Resume Anchor.
- Touch·Stylus 입력과 UI 일치.
- 작은 화면·Safe Area·중단/복귀·성능·접근성.
- 단일 강적이 HP 스펀지로 변질되지 않음.
- 수호 소환수가 주문 설계보다 복잡하지 않음.
- Grimoire가 자동 주문 Stock으로 변질되지 않음.

## 10. Codex Plan 진입

상태: `BLOCKED`.

필수 조건:

1. `MOBILE-FOUNDATION-01` 승인.
2. `BOSS-PHASE-01`, `GRIMOIRE-SCREEN-01`, `AUDIO-DIRECTION-01`의 Mobile 영향 검수.
3. 기획·아트·UX 통합 검수 통과.
4. Base v9.4 Adapter·Snapshot·CI 정합화.
5. Godot 버전·Renderer·Mobile OS·Landscape Aspect·최소 기기 범위 재확인.
6. 사용자의 Codex Plan 승인.

그 뒤에만 Codex read-only Plan을 작성한다.

## 11. PLAYTEST_TUNING_REQUIRED

- 공격 간격·피해·HP·마나.
- 불안정도 변화량.
- 수호 완화율·사용 횟수.
- 환경 결과 임계값.
- 작성 감속 최종값·복귀 유예.
- Landscape Touch target·Canvas 크기·Gesture·인식 허용치·보정·Latency.
- 지원 Aspect Ratio·Text scale·Safe Area 세부값.
- Memory·Texture·load·frame pacing·battery·thermal.

## 12. 검증 경계

```text
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE_SCENE_RESOURCE_DATA = NOT_FOUND
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PC_ADAPTATION_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
