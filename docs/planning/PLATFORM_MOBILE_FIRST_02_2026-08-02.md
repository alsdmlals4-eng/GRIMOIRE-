# GRIMOIRE 플랫폼 우선순위 승인 — GM-PLATFORM-02

```yaml
decision_id: GM-PLATFORM-02
status: USER_APPROVED_ACTIVE
approved_at: 2026-08-02 KST
source: latest_explicit_user_instruction
supersedes: GM-PLATFORM-01
primary_platform: Mobile
follow_up_platform: PC
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE
implementation: NOT_STARTED
codex: BLOCKED
next_reconciliation_gate: MOBILE-FOUNDATION-01
```

## 승인 결정

GRIMOIRE의 1차 플랫폼은 `Mobile`, 후속 고려 플랫폼은 `PC`다. 기존 `GM-PLATFORM-01 / PC 우선·Mobile 후속`은 역사 기록으로 보존하되 활성 제품 방향에서는 `GM-PLATFORM-02`가 대체한다.

이 결정은 다음을 바꾸지 않는다.

- 프로젝트 코어와 플레이어 약속.
- 승인된 Vertical Slice와 45~50분 목표, 53분 콘텐츠 상한, 60분 하드 상한.
- `ART-STYLE-01`, `ART-BIBLE-01`, `GM-BATTLE-RULES-01`, `ASSET-SPEC-01`의 승인 사실.
- 잠긴 기준 이미지와 SHA-256 `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`.
- `PLANNING_ONLY_PROFILE`, 제품 구현 `NOT_STARTED`, Codex `BLOCKED`.

## 대체되는 활성 약속

다음 PC 전용 표현은 활성 플랫폼 계약이 아니며 Mobile 기준으로 재설계·검증해야 한다.

- LMB/RMB/Wheel/Ctrl+Z/키보드를 기본 입력으로 전제하는 조작 계약.
- PC 마우스·펜 Prototype을 첫 제품 검증으로 두는 순서.
- PC Demo 이후 Mobile 적응을 결정하는 출시 경로.
- 16:9·720p/1080p/1440p·Ultrawide만으로 화면 품질을 증명할 수 있다는 가정.

PC 입력·해상도 자료는 삭제하지 않고 후속 PC 적응을 위한 참고·호환 계약으로 보존한다.

## MOBILE-FOUNDATION-01

플랫폼 전환으로 다음 Gate를 `MOBILE-FOUNDATION-01`로 둔다. 이 Gate는 제품 코어를 바꾸는 기능 추가가 아니라 이미 승인된 코어를 Mobile에서 손실 없이 구현할 수 있는지 확인하는 정합화 Gate다.

필수 산출물:

1. Touch·Stylus 직접 작성, 후보 선택, Undo, 부분 삭제, 전체 초기화, 취소, `[구현]`의 입력 상태 계약.
2. 화면 방향·지원 비율·Safe Area·Notch·System gesture·한손/양손 사용 범위 후보와 검증 계획.
3. 작은 화면에서 적 위험·상황 목표·주인공 상태·작성 Panel이 서로 가리지 않는 정보 위계.
4. App pause/resume, focus loss, background/foreground, interrupted stroke, stale recognition, 중복 Commit 방지 계약.
5. Memory·Texture·load·frame pacing·battery·thermal 검증 항목과 측정 방법.
6. Mobile OS·최소 기기·Store 범위를 결정하기 위한 사용자 결정 패킷.
7. 후속 PC에서 Touch 동작 의미를 Mouse/Pen/Keyboard로 매핑하는 적응 원칙.

## 아직 확정하지 않는 항목

다음은 사용자 지시나 실제 벤치마킹·Prototype 증거가 없으므로 결정하지 않는다.

- Android·iOS 우선순위와 Store.
- Landscape·Portrait 또는 회전 지원.
- 최소 OS·최소 RAM·GPU·화면 크기.
- Frame rate·memory·battery·thermal 수치.
- 인식 알고리즘·오프라인/온라인 처리·개인정보 범위.
- Touch target, 글자 Canvas 크기, 감속률, 공격 간격의 최종값.

상태는 `USER_DECISION_REQUIRED` 또는 `PLAYTEST_TUNING_REQUIRED / NOT_RUN`이다.

## 다음 작업 순서

```text
GM-PLATFORM-02 정본 동기화
→ MOBILE-FOUNDATION-01
→ BOSS-PHASE-01·GRIMOIRE-SCREEN-01 재검토
→ AUDIO-DIRECTION-01
→ Mobile 기준 기획·아트·UX 통합 검수
→ 사용자 Codex Plan 승인
→ Codex read-only Plan·기술 검수
→ 실행 프로필 전환 승인
→ Validation-First 구현
```

Boss·Grimoire·Audio의 기존 승인·초안은 폐기하지 않는다. Mobile Foundation 결과에 따라 화면 소비자·입력·성능 부분만 재검토한다.

## 동기화 계약

Sync ID: `GR-SYNC-20260802-07`.

필수 반영:

- GitHub: `AGENTS.md`, `START_HERE.md`, `docs/ACTIVE_CONTEXT.md`, `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`, `docs/DEVELOPMENT_GATES.md`, `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`, `skills/PROJECT_BASE_ADAPTER.json`.
- Sheet: `00`, `01`, `02`, `04`, `05`, `10`, `15`, `20`, `30`, `60`, `70`, `80`, `90`, `99`.
- Issue: `#9` 갱신, `#16` 완료 처리.

GitHub authority commit과 Sheet Readback 전에는 `GITHUB_ONLY`, 완료 후 `SYNCED_TO_WORKING_BRANCH`다. main 병합과 재조회 전에는 `SYNCED_TO_MAIN`을 사용하지 않는다.
