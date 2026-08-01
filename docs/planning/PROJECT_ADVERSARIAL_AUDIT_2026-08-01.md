# GRIMOIRE 기존 프로젝트 적대적 검토 — 2026-08-01

## 1. 감사 상태

```yaml
audit_id: GR-AUDIT-20260801-01
status: PASS_WITH_CORRECTIONS_REQUIRED
scope: REPOSITORY_GITHUB_SHEET_VISUAL_AUTHORITY
repository: alsdmlals4-eng/GRIMOIRE-
working_branch: agent/grimoire-v93-canon
pull_request: 22
base_main: 4527356e9597f9a07295ee594caf019a38c4ed9f
product_files: NOT_FOUND
runtime_validation: NOT_RUN
human_playtest: NOT_RUN
```

목적은 `ART-BIBLE-01` 초안 이후 기존 프로젝트 전체를 다시 대조해 누락·충돌·과잉 확정·보완 지점을 찾는 것이다. 이 보고서는 제품 구현 승인이나 PR 병합 승인이 아니다.

---

## 2. 확인 범위

### 운영·권위 문서

- `AGENTS.md`
- `START_HERE.md`
- `docs/ACTIVE_CONTEXT.md`
- `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- `docs/DEVELOPMENT_GATES.md`
- `docs/DESIGN_DOCUMENT_REGISTRY.json`
- `docs/BASE_RULES_VERSION.md`
- `skills/PROJECT_BASE_ADAPTER.json`
- Issue `#21 Base v9.3·Vertical Slice v9 운영 정합화`

### 기획·비주얼 책임 원본

- `docs/planning/ART_STYLE_01_APPROVAL_2026-07-31.md`
- `docs/planning/visual/ART_STYLE_01_LOCKED_REFERENCE_MANIFEST.json`
- `docs/planning/GATE_2_VISUAL_PRESENTATION_SYSTEM.md`
- `docs/planning/GATE_2_CHARACTER_PRESENTATION_SYSTEM.md`
- `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md`
- `docs/UX_UI_SYSTEM.md`
- 잠긴 기준 이미지 SHA-256 `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`

### Google Sheet

- `00_프로젝트_허브`
- `01_작업순서`
- `02_현재_확정결정`
- `04_누락_충돌_감사`
- `05_GDD_요약`
- `60_UX_UI_접근성`
- `70_아트_오디오_에셋`
- `71_이미지기획_생성목록`
- `72_이미지검수_승인로그`
- `80_데모_버티컬슬라이스_플레이테스트`
- `99_변경이력`

### 실제 제품 파일

GitHub 검색에서 다음을 확인하지 못했다.

- `project.godot`
- `.tscn`
- `.gd`
- `.tres`
- 런타임 게임 데이터·Asset

따라서 Scene·Node·Resource·Script 관련 기존 문서는 구현 사실이 아니라 후행 기술 설계다.

---

# 3. 적대적 검토 요약

| ID | 심각도 | 유형 | 판정 | 요약 |
|---|---|---|---|---|
| AUD-C01 | HIGH | 운영 상태 | CONFLICT | `AGENTS.md`가 다음 차단을 `ART-STYLE-01`로 유지 |
| AUD-C02 | HIGH | 시작점 | CONFLICT | `START_HERE.md`가 다음 Gate와 최신 Addendum을 과거 상태로 안내 |
| AUD-C03 | HIGH | Base 계약 | KNOWN_BLOCKER | Base v9.3 권위와 실제 Version·Adapter v8/v9.1이 충돌 |
| AUD-C04 | HIGH | Sheet 계약 | CONFLICT | Adapter가 Sheet를 `SHEET_GITHUB_CONFLICT / BLOCKED`로 유지하지만 실제는 Readback Pass |
| AUD-C05 | HIGH | 플랫폼 UX | CONFLICT | PC 우선 정본과 Mobile 중심 UX 문구·Touch UI 예시가 혼합 |
| AUD-C06 | HIGH | 시각 정본 | OVERCLAIM_RISK | 이미지 내 이름·수치·파티·적 구성이 정본처럼 오인될 수 있음 |
| AUD-C07 | HIGH | 제작 범위 | SCOPE_RISK | 배경 예시 4종과 소환수 다수 형태가 Slice 자산 의무로 오인될 수 있음 |
| AUD-C08 | MEDIUM | 화면 누락 | GAP | 잠긴 Board에 Main·Grimoire 완성 화면이 없음 |
| AUD-C09 | MEDIUM | 캐릭터 정본 | UNRESOLVED | 주인공 정확한 외형 잠금 범위와 동반자 공식 이름 미확정 |
| AUD-C10 | MEDIUM | 색 의미 | UNRESOLVED | 청색·주황 글자 FX가 화면별 장식인지 상태 의미인지 불명확 |
| AUD-C11 | MEDIUM | 기술 부록 | TRACE_RISK | A~T Godot 명세가 실제 구현처럼 소비될 위험 |
| AUD-C12 | LOW | 기록 정리 | STALE_HISTORY | Sheet 과거 행에 `ART-STYLE USER_DECISION_REQUIRED`와 과거 Gate 표현이 역사 기록으로 남음 |

---

# 4. 세부 발견

## AUD-C01 — AGENTS.md 상태 포인터 지연

### 관찰

`AGENTS.md` 상단은 Base v9.3을 선언하면서도 `next_blocker: ART-STYLE-01`을 유지한다. 필수 읽기 순서도 최신 Addendum U가 아니라 Addendum R을 가리킨다.

### 영향

- 새 작업자가 이미 승인된 Art Style을 다시 질문할 수 있다.
- `ART-BIBLE-01` 대신 후보 비교·이미지 생성을 재개할 수 있다.
- 최신 잠금 계약을 읽기 전에 과거 기획 상태를 우선할 수 있다.

### 보정안

- `next_blocker: ART-BIBLE-01_USER_REVIEW`.
- 최신 Addendum을 `2026-08-01A` 또는 현재 최신 책임 원본으로 변경.
- Art Bible 상세는 아직 `DRAFT_USER_REVIEW_REQUIRED`임을 명시.

상태: `IMMEDIATE_FACTUAL_CORRECTION_RECOMMENDED`.

---

## AUD-C02 — START_HERE.md 진입 경로 지연

### 관찰

`START_HERE.md`는 다음 제품 Gate를 `ART-STYLE-01`로 표시하고 Addendum R을 읽도록 안내한다.

### 영향

콜드 스타트 시 현재 상태를 잘못 복원한다. `CURRENT_CONFIRMED_DECISIONS`와 `ACTIVE_CONTEXT`는 Art Style 승인과 Art Bible 진입을 반영하므로 시작점 문서 사이에 충돌이 있다.

### 보정안

- 다음 Gate를 `ART-BIBLE-01 / DRAFT_USER_REVIEW_REQUIRED`로 변경.
- Art Style 승인·잠긴 기준판·해시를 요약.
- 최신 Art Bible Draft와 State를 읽기 순서에 추가.

상태: `IMMEDIATE_FACTUAL_CORRECTION_RECOMMENDED`.

---

## AUD-C03 — Base v9.3 권위와 로컬 Version·Adapter 불일치

### 관찰

- `AGENTS.md`와 Registry는 Base `v9.3.0`을 권위 기준으로 선언한다.
- `docs/BASE_RULES_VERSION.md`는 v8 실행문과 2026-07-29 Commit을 유지한다.
- `skills/PROJECT_BASE_ADAPTER.json`은 Base `9.1.0`과 이전 release commit을 유지한다.
- Registry도 이를 `PENDING_ISSUE_21` 및 known stale files로 기록한다.

### 영향

- Skill route·validator·실행문을 어느 버전으로 읽어야 하는지 혼동.
- 향후 Codex Plan 전환 시 잘못된 Adapter가 실행 권한을 가질 수 있음.
- 현재 CI 성공은 Base v9 adoption 정적 검증이지 v9.3 전체 정합화 완료 증거가 아님.

### 보정안

Issue #21 범위에서 별도 처리:

1. `docs/BASE_RULES_VERSION.md` v9.3 전환.
2. `skills/PROJECT_BASE_ADAPTER.json`과 Snapshot 재생성.
3. Sheet status의 실제 Readback Pass 반영.
4. CI·Registry hash·stale reference 재검증.

상태: `KNOWN_BLOCKER / DO_NOT_BUNDLE_WITH_ART_BIBLE_CONTENT`.

---

## AUD-C04 — Adapter의 Sheet 상태가 실제 동기화와 충돌

### 관찰

`skills/PROJECT_BASE_ADAPTER.json`은 다음을 유지한다.

```text
declared_sync_status = SHEET_GITHUB_CONFLICT
sync_status = BLOCKED
```

그러나 `ART-STYLE-01` 승인 번들은 Google Sheet Readback Pass와 `SYNCED_TO_WORKING_BRANCH`를 기록했다.

### 영향

자동화 또는 후속 작업자가 Sheet를 읽지 않거나 쓰기 금지로 오판할 수 있다.

### 보정안

Issue #21에서 Adapter를 v9.3 기준으로 재생성하고, 상태를 현재 Sync 정책과 일치시킨다.

상태: `HIGH / KNOWN_OPERATIONAL_CONFLICT`.

---

## AUD-C05 — PC 우선과 Mobile Touch 표현 혼합

### 관찰

- 프로젝트 정본은 `PC` 우선, Mobile 후속이다.
- `docs/UX_UI_SYSTEM.md`와 Adapter project focus에는 Mobile Touch 중심 문구가 남아 있다.
- 잠긴 기준판 필드 화면에는 가상 Joystick·Touch Button이 보인다.

### 판정

잠긴 이미지의 Art Style·화면 구성은 권위지만, Touch Control 자체는 PC 런타임 UI 권위로 볼 수 없다.

### 보정안

- PC 파생 Board: Mouse/Keyboard 중심, Persistent Touch UI 제거.
- Mobile 파생 Board: 별도 Safe Area·손가락 가림·Touch 크기 검증.
- UX 문서의 Mobile 항목을 `FOLLOW_UP_ADAPTATION`으로 이동.

상태: `CORRECTED_IN_ART_BIBLE_DRAFT / SOURCE_DOC_FOLLOW_UP_REQUIRED`.

---

## AUD-C06 — 이미지 내 Text·수치·파티 구성이 정본으로 오인될 위험

### 관찰

잠긴 이미지에는 캐릭터 이름, HP·마나, Level, 비용, 보상량, 적 3체, 여러 파티 초상, 여러 소환수 예시가 포함된다.

### 판정

사용자는 이미지 자체를 수정하지 않는 Art·화면 기준으로 승인했다. 이는 이미지 속 모든 Text와 수치가 게임 규칙으로 승인됐다는 뜻이 아니다.

### 보정안

Art Bible에서 다음을 `PLACEHOLDER_IMAGE_TEXT_OR_DATA`로 명시:

- 이름.
- 수치.
- 파티 수.
- 적 수.
- 버튼 문구.
- 여러 소환수 형태.

상태: `CORRECTED_IN_ART_BIBLE_DRAFT`.

---

## AUD-C07 — 배경·소환수 예시에 의한 Scope 팽창

### 관찰

Board 하단에는 수업·시험장·축제·현장실습 배경이 개별 예시처럼 보이고, 우측에는 여러 전투 보조 소환수가 제시된다.

기획 Scope는 다음으로 제한된다.

- 학교 공용 장면 + 상태 변형.
- 현장 장면 + 같은 장소 전술장.
- 메인 동반 정령 초기 형상 1개.
- 수호형 보조 소환수 1체.

### 보정안

- 배경 예시는 완전 별도 맵이 아니라 공용 Camera·건축·기준선의 상태 변형으로 해석.
- 여러 보조 소환수는 장기 방향 참고이며 Slice 제작 의무가 아님.

상태: `CORRECTED_IN_ART_BIBLE_DRAFT`.

---

## AUD-C08 — 필수 화면 중 Main·Grimoire 완성안 누락

### 관찰

잠긴 Board는 다음을 잘 보여 준다.

- Field.
- Dialogue.
- Writing.
- Battle.
- Battle Writing.
- Result Return.

그러나 공용 비주얼 화면 작업 원칙이 요구하는 다음 완성 화면은 없다.

- Main/Start.
- Inventory 대응인 Grimoire/Knowledge Management.

### 보정안

잠긴 원본을 수정하지 않고 별도 파생 Board를 제작한다.

1. `BOARD-GR-MAIN-01`.
2. `BOARD-GR-GRIMOIRE-01`.

Art Bible 승인 전에는 제작하지 않는다.

상태: `GAP / DERIVATIVE_BOARD_REQUIRED_AFTER_APPROVAL`.

---

## AUD-C09 — 주인공 외형 잠금 범위와 동반자 이름

### 관찰

현재 문서 정본은 주인공의 서사 역할과 동반 정령의 작은 늑대형 초기 방향을 승인했다. 정확한 이름·세부 외형은 별도 명시가 부족하다.

잠긴 Board는 특정 주인공 외형과 이름 표기를 포함하지만, 승인 정본은 이를 시각 키와 화면 연속성 권위로 설명한다.

### 사용자 결정 필요

- 주인공 얼굴·성별·헤어·제복을 정확히 고정하는가.
- 또는 머리 실루엣·네이비 제복·금색 포인트만 고정하는가.
- 동반자 이미지 이름을 공식 이름으로 채택하는가.

상태: `USER_DECISION_REQUIRED`.

---

## AUD-C10 — 청색·주황 글자 FX 의미

### 관찰

비전투 작성은 청색, 전투 작성은 주황색으로 표현된다.

가능한 해석:

1. 장소별 미적 변형.
2. 위험·과부하·Commit 상태 의미.
3. 글자 속성 또는 진영 의미.

정본에서 의미가 확정되지 않았다.

### 권장안

- 기본 획·인식: 청색/청록.
- 위험·과부하·확정 Commit: 제한적 주황.
- 속성·진영 의미로 사용하지 않음.

상태: `USER_REVIEW_REQUIRED`.

---

## AUD-C11 — 기술 부록의 구현 사실 오인

### 관찰

기존 P0 A~T 명세에는 구체적 `res://` 경로·Node·Signal·Save 구조가 존재한다. 그러나 실제 제품 파일은 없다.

### 위험

후속 작업자가 이를 기존 구현으로 오인하거나 그대로 생성할 수 있다.

### 보정안

- 모든 기술 명세 상단에 `PROPOSED_TECHNICAL_APPENDIX / PRODUCT_FILES_NOT_FOUND` 유지.
- Art Bible·Asset Spec·Codex Plan 승인 전 경로를 구현 계약으로 사용하지 않음.
- 실제 프로젝트 생성 후 기존 구조와 재매핑.

상태: `ROLE_ALREADY_CORRECTED / CONTINUED_GUARDRAIL_REQUIRED`.

---

## AUD-C12 — Sheet 역사 행의 과거 상태

### 관찰

`04_누락_충돌_감사`의 과거 행에는 `ART-STYLE-01 = USER_DECISION_REQUIRED`가 남아 있다. `02_현재_확정결정`의 일부 과거 Decision은 다음 Gate를 `ART-STYLE-01`로 기록한다.

### 판정

- 과거 Audit·변경이력은 당시 상태 기록이므로 삭제하지 않는다.
- 현재 상태 탭과 작업순서가 최신 상태를 명확히 표시하면 충돌이 아니다.
- 다만 역사 행임을 표시하지 않는 소비자가 잘못 읽을 수 있다.

### 보정안

- 과거 행은 `HISTORICAL_AT_TIME_OF_RECORD`로 해석.
- 현재 상태 조회는 `02_현재_확정결정`의 최신 Decision과 GitHub State를 우선.
- 필요 시 Sheet 안내 행 또는 필터 규칙을 추가.

상태: `LOW / DOCUMENTATION_CLARITY_IMPROVEMENT`.

---

# 5. 누락 점검

## 5.1 Art Bible에 추가한 누락 규칙

- PC와 Mobile UI 권위 분리.
- 이미지 Text·수치·파티·적 수 Placeholder 처리.
- Main·Grimoire 파생 화면 필요.
- 주인공 외형 잠금 범위 확인.
- 동반자 공식 이름 확인.
- 청색·주황 FX 의미 확인.
- 배경 상태 변형과 자산 Scope 연결.
- 메인 동반자·보조 소환수 역할과 수량 분리.
- Font 방향과 라이선스 책임 분리.

## 5.2 아직 후행 Gate가 책임질 항목

### ASSET-SPEC-01

- 내부 해상도.
- 실제 Sprite·Portrait·Background·UI Pixel 크기.
- Animation·표정·상태 수량.
- 파일 형식·명명·폴더.
- Font·Asset·Shader License.

### AUDIO-DIRECTION-01

- 장소별 BGM.
- 작성·후보·Commit·실패·결과 SFX.
- 무음 대체와 동반자·수호 소환수 청각 분리.

### Runtime·Playtest

- PC Mouse·Pen 입력.
- 감속 비율.
- 실제 획 대비.
- 해상도별 UI 가독성.
- Motion Reduced·무음 대체.

---

# 6. 권장 처리 순서

```text
1. ART-BIBLE-01 초안 사용자 검토
2. 주인공 외형·동반자 이름·FX 의미 결정
3. AGENTS.md·START_HERE.md 상태 포인터 교정
4. ART-BIBLE-01 승인 및 Sheet 정본 동기화
5. BOARD-GR-MAIN-01·BOARD-GR-GRIMOIRE-01 별도 제작
6. Issue #21에서 Base v9.3 Adapter·Snapshot·CI 정합화
7. ASSET-SPEC-01
8. AUDIO-DIRECTION-01
9. 기획·아트 통합 검수
```

Base 운영 정합화는 Art Bible 콘텐츠와 별도 작업 단위로 유지한다.

---

# 7. 적대적 검토 판정

| 검토 관점 | 판정 | 이유 |
|---|---|---|
| 최신 사용자 결정 반영 | PASS | Art Style 잠금·이중 기준형 반영 |
| 프로젝트 고유성 | PASS | 마법학교·직접 작성·정령 동반·전술장 유지 |
| 범위 보호 | PASS_WITH_CORRECTIONS | 배경·소환수·반신 수량 상한 보정 |
| 권위 문서 일관성 | FAIL_PENDING_CORRECTION | AGENTS·START_HERE·Base Adapter 상태 지연 |
| PC 우선 일관성 | PASS_WITH_CORRECTIONS | Touch UI를 Mobile 후속 Placeholder로 분리 |
| 이미지 과잉 확정 방지 | PASS_WITH_CORRECTIONS | 이름·수치·파티·적 수 비정본화 |
| 필수 화면 완결 | PARTIAL | Main·Grimoire 파생 Board 누락 |
| 실제 구현 정합성 | NOT_RUN | 제품 파일 없음 |
| 런타임·사람 검증 | NOT_RUN | 구현 이후 필요 |

최종 판정: `PASS_WITH_CORRECTIONS_REQUIRED`.
