# GRIMOIRE 개발·기획 게이트

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
baseline_date: 2026-08-01
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE
planning: APPROVED
art_style_01: APPROVED_A_MODIFIED_LOCKED
art_bible_01: APPROVED_DUAL_STANDARD_ART_BIBLE
battle_screen_layout_01: APPROVED
battle_single_enemy_focus_01: APPROVED
battle_active_timer_01: APPROVED
battle_time_flow_01: APPROVED
battle_rules_01: APPROVED_SITUATION_RESOLUTION_RULES
next_product_gate: ASSET-SPEC-01
parallel_design_gate: BOSS-PHASE-01
implementation_ready: false
codex: BLOCKED
```

현재 승인은 기획·시각 규칙·전투 구조를 확정한다. 구현·성능·접근성·사람 플레이 통과를 의미하지 않는다.

## 1. 전체 경로

```text
Gate 1 콘셉트·Vertical Slice — 완료
→ 기획 완결·벤치마킹·적대적 검토 — 완료
→ ART-STYLE-01 — 완료
→ ART-BIBLE-01 — 완료
→ 전투 화면·단일 강적·Active Timer·Time Flow·Battle Rules — 완료
→ ASSET-SPEC-01 — 현재 Gate
→ BOSS-PHASE-01·Grimoire/Main 파생 화면 — 병행
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ 사용자 Codex Plan 승인
→ Codex read-only Plan
→ 기술 검수
→ 실행 프로필 전환
→ Validation-First 구현
→ QA·외부 플레이테스트
```

## 2. 완료된 기획 Gate

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

책임 원본: `docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md`.

- Soft Storybook 배경 + Anime Cel 캐릭터.
- Navy/Gold UI + Blue Glyph.
- 고정 주인공 1명·전투 초상 1개.
- 동반 정령·수호 상태 배지.
- 우측 작성 Panel 축소→확장.
- Grimoire 화면 우선 파생.

## 3. 완료된 전투 Gate

### GM-BATTLE-SCREEN-LAYOUT-01

상태: `APPROVED_LAYOUT_DIRECTION`.

```text
상단·중앙 적·환경
+ 좌측 하단 주인공 초상
+ 좌측 보조 동반·수호 배지
+ 우측 직접 작성
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

## 4. ASSET-SPEC-01

상태: `CURRENT_PRODUCT_GATE`.

확정 대상:

- 내부 해상도·16:9 Safe Frame·UI Scale.
- 캐릭터 SD·반신·초상·표정 상태 수량.
- 적·동반 정령·수호 소환수 상태·Animation 수량.
- 학교·현장 배경과 상태 변형 수량.
- Writing Panel·Grimoire·Main·Result UI Asset 수량.
- Glyph·Attack Warning·Instability·Result FX 상태.
- 파일 형식·명명·폴더·Import·License 규칙.
- Solo Production 제작량 상한.

통과 조건:

1. Art Bible 규칙과 수량이 일치.
2. 잠긴 원본을 편집하지 않음.
3. 일반 적 1체·단일 페이즈·주인공 초상 1개 범위를 보호.
4. Grimoire·Main 파생 화면에 필요한 최소 Asset을 포함.
5. 실제 Font·외부 Asset은 License Ledger에 기록.
6. 사용자의 승인.

## 5. 병행 설계 Gate

### BOSS-PHASE-01

상태: `NEXT_GAME_DESIGN_GATE`.

확정 대상:

- 보스 페이즈 수.
- 페이즈 전환 시 불안정도·Attack Timer·작성 Draft 유지.
- 페이즈별 공격 규칙과 환경 변화.
- 회복·리셋·반복 악용 방지.
- 일반 적과 구분되는 제작량 상한.

### GRIMOIRE-SCREEN-01

상태: `PENDING_DERIVATIVE_BOARD`.

- 상황·글자·의도·결과·부작용·발견 관리.
- 자동 최적 추천·자동 시전 금지.

### MAIN-SCREEN-01

상태: `PENDING_AFTER_GRIMOIRE_SCREEN`.

- `새 게임 / 이어하기 / 설정` 중심 최소 구조.
- 수집형 로비 UI 금지.

### NAMING-PASS-01

상태: `NONBLOCKING_PENDING`.

- 세계 명명 규칙.
- 교수·동급생·동반 정령 공식 이름.
- 이름은 Art Bible·Asset Spec을 차단하지 않음.

## 6. AUDIO-DIRECTION-01

상태: `PENDING_AFTER_ASSET_SPEC`.

- 학교·시험·축제·현장·귀환의 청각 정체성.
- 획·후보·확정·시전·실패 원인 SFX.
- 적 공격 예고·Time State·Instability·Result 피드백.
- 무음 대체와 License 우선순위.

## 7. 통합 검수

상태: `BLOCKED_BY_ASSET_SPEC_AUDIO_AND_DERIVATIVE_SCREENS`.

확인:

- Glyph·대상·위험 판독성.
- Art Bible과 Asset 수량 일치.
- 46/53/60분 시간 계약.
- PC 입력·UI 일치.
- Mobile 후속 적응 가능성.
- 단일 강적이 HP 스펀지로 변질되지 않음.
- 수호 소환수가 주문 설계보다 복잡하지 않음.
- Grimoire가 자동 주문 Stock으로 변질되지 않음.

## 8. Codex Plan 진입

상태: `BLOCKED`.

필수 조건:

1. `ASSET-SPEC-01` 승인.
2. `AUDIO-DIRECTION-01` 승인.
3. Grimoire/Main 파생 화면 검수.
4. 기획·아트 통합 검수 통과.
5. Base v9.3 Adapter·Snapshot·CI 정합화.
6. Godot 버전·Renderer·플랫폼 범위 재확인.
7. 사용자의 Codex Plan 승인.

그 뒤에만 Codex read-only Plan을 작성한다.

## 9. PLAYTEST_TUNING_REQUIRED

- 공격 간격·피해·HP·마나.
- 불안정도 변화량.
- 수호 완화율·사용 횟수.
- 환경 결과 임계값.
- 작성 감속 최종값·복귀 유예.
- 인식 허용치·보정·Latency.

## 10. 검증 경계

```text
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE_SCENE_RESOURCE_DATA = NOT_FOUND
RUNTIME_VALIDATION = NOT_RUN
PC_INPUT_VALIDATION = NOT_RUN
MOBILE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
