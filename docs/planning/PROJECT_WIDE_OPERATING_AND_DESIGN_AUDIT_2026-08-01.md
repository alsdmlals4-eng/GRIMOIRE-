# GRIMOIRE 프로젝트 전수 운영·기획 감사 — 2026-08-01

## 1. 감사 상태

```yaml
audit_id: GR-AUDIT-20260801-02
work_item_id: GM-PROJECT-OPERATING-RECONCILIATION-01
status: PASS_WITH_CORRECTIONS_IN_PROGRESS
work_mode: REVIEW_THEN_PLAN
project: "GRIMOIRE: 세계를 다시 쓰는 법"
base_repository: alsdmlals4-eng/Base
project_repository: alsdmlals4-eng/GRIMOIRE-
working_branch: agent/grimoire-v93-canon
sheet_id: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
implementation_authority: NONE
main_sync: PENDING_PR_MERGE
```

이 감사는 다음을 함께 대조했다.

1. Base `main`의 현재 운영체계·Release Lock·Skill Registry·핵심 Skill.
2. GRIMOIRE의 콜드 스타트 문서·권위 문서·Registry·Adapter·Issue·Draft PR.
3. Google Sheet 27개 탭의 실제 값.
4. 승인된 Art Style·Art Bible 초안·전투 레이아웃·전투 규칙·시간 흐름.
5. 제품 파일·런타임·사람 검증의 실제 존재 여부.

---

# PART A. Base 현행 운영체계 이해

## 2. Base 현재 핀

```yaml
base_main_head: a82976a3a42450ea413cdc5d4aebf701678110d8
release_line: v9.3.0
release_state: BASE_RELEASED
release_commit: 30ca6c7b5f93521f0eb0eed42d01437cd43c50ae
release_evidence_commit: 462a86db192d23d0f386281a1eb54b0a8cbad62e
release_registry_sha256: 9847bb2b225c776ad7916930f0f48c490bc2a898bea8e02ea1fdd0e6caac60c1
active_skill_count: 27
```

Base `main`은 Release 이후에도 변경될 수 있으므로 프로젝트는 검증된 Release/Evidence Commit과 Registry Hash를 고정한다. 편의상 최신 Base working tree를 실행 권위로 사용하지 않는다.

## 3. Base 최소 읽기·라우팅 구조

```text
START_HERE
→ AGENTS
→ OPERATING_MODEL
→ WORK_MODE_AND_SKILL_ROUTING
→ DOCUMENTATION_MAP
→ SKILL_REGISTRY
→ 질문에 필요한 최소 Skill·Reference·Template·Test
→ 프로젝트 정본·Sheet·실제 파일
```

`전부 살펴본다`는 모든 Skill 본문을 무조건 로드한다는 뜻이 아니다. Registry와 Documentation Map으로 책임을 찾고, 현재 작업에 필요한 최소 경로를 끝까지 검증한다.

## 4. 이번 작업에 활성화한 Base 책임

| 책임 | Skill·계약 | 사용 방식 |
|---|---|---|
| 작업 접수·범위·완료 보고 | `managing-project-intake-and-work-contract` | `route / contract / decompose / execution-report` |
| 저장소 운영 감사·구형 정합화 | `managing-game-project-operating-system` | `audit / reconcile-legacy / verify` |
| 적대적 검토 | `running-adversarial-review-and-refinement` | `repository-wide-audit` |
| 기획 문서·결정 동기화 | `managing-design-documents` + Decision Sync Policy | GitHub·Sheet 같은 Decision ID |
| 컨텍스트 복구 | `maintaining-project-context-and-handoff` | 현재 Snapshot·Active Context 갱신 |
| 검증 | `reviewing-and-validating-project-changes` | 정적·참조·CI·경계 검증 |
| 기획 후보 탐색 | Brainstorming | 선택지·리스크·최소 범위 비교 |

## 5. Base Adapter 핵심 계약

- 편집 가능한 통합 권위는 `skills/PROJECT_BASE_ADAPTER.json` 하나다.
- `PROJECT_SKILL_SNAPSHOT.json`과 Compatibility View는 Generator 산출물이다.
- Adapter Pin·Registry Hash·Route·생성물 중 하나라도 불일치하면 공유 Workflow 실행을 거부한다.
- Base Skill 본문을 프로젝트에 복제하지 않는다.
- 생성물을 손으로 고쳐 현재처럼 보이게 만들지 않는다.
- 프로젝트 고유 규칙과 사용자의 최신 결정이 Base 기본값보다 우선한다.

---

# PART B. 프로젝트 실제 진행도

## 6. 현재 제품 상태

```yaml
product_stage: DEMO_FIRST_VERTICAL_SLICE
primary_platform: PC
follow_up_platform: Mobile
engine_baseline_candidate: Godot 4.7.1 stable
planning_canon: APPROVED
art_style_01: APPROVED_A_MODIFIED_LOCKED
art_bible_01: APPROACH_APPROVED_DRAFT_USER_REVIEW_REQUIRED
asset_spec_01: BLOCKED_BY_ART_BIBLE
codex: BLOCKED
implementation: NOT_STARTED
runtime_validation: NOT_RUN
pc_input_validation: NOT_RUN
mobile_validation: NOT_RUN
human_playtest: NOT_RUN
```

실제 `project.godot`, `.tscn`, `.gd`, `.tres`, 제품용 게임 데이터, 런타임 Asset은 확인되지 않았다. 기존 Godot Scene·Node·Resource 명세는 기술 부록이며 구현 사실이 아니다.

## 7. 승인된 제품 코어

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

보호 계약:

- `메인 글자 1개 + 보조 글자 0개 이상`.
- Slice 글자 `흐름 / 집중 / 분산`.
- 입력 실패·문법 실패·상황 설계 실패 분리.
- 직접 작성은 정상 완주 필수 성공 7회, 안내형 복구 포함 목표 상한 10회.
- 수업→자유일정 A→시험→B→축제→C→현장실습→귀환·마도서 기록.
- 메인 동반 정령은 작은 늑대형 초기 형상 1개.
- 수호형 전투 보조 소환수 1체 우선, 정답·작성·시전을 대행하지 않음.
- 마도서는 과정과 결과를 기록하며 자동 주문 Stock이 아님.

## 8. 승인된 비주얼·전투 계약

### 비주얼

- 잠긴 기준 이미지 SHA-256: `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`.
- 원본 수정·재생성·리터치·재배치 금지.
- 16:9 고정 3/4 필드, SD 캐릭터, 같은 장소 반신 대화, 작성 Overlay, 별도 전투장, 결과 후 필드 복귀.

### 전투 화면

```text
전장 상단·중앙 = 적·환경 목표
좌측 하단 = 아군 얼굴 초상·상태
우측 = 축소형→확장형 직접 작성 영역
```

아군·수호 소환수 몸체는 전장에 상시 배치하지 않는다.

### 전투 핵심 흐름

- 기본 조우는 강한 적 1개체.
- 적은 일정 시간마다 공격.
- 플레이어는 유효 마법을 작성하고 `[구현]`을 누르면 마나 검증 후 즉시 시전.
- 일반 전투는 단일 페이즈.
- 보스만 다중 페이즈 허용.
- 플레이어 판단·작성 중 적 공격 타이머 진행.
- 마법·적 공격·보스 전환 해결 중 타이머 정지.
- 선택형 작성 감속 보조 제공, 초기 프로토타입 목표 `0.5×`, 최종값 미확정.

---

# PART C. Google Sheet 27개 탭 감사

## 9. 전체 판정

```yaml
workbook_structure: PASS
required_tabs: 27_OF_27_PRESENT
latest_battle_decisions: PRESENT
runtime_claim_boundary: PASS
cold_start_summary_freshness: FAIL
cross_tab_reference_freshness: PARTIAL
base_adapter_status_alignment: FAIL
```

## 10. 즉시 교정이 필요한 Sheet 항목

| 위치 | 현재 문제 | 교정 방향 |
|---|---|---|
| `00_프로젝트_허브` | 다음 Gate가 `ART-STYLE-01` | Art Style 승인·Art Bible 검토·Battle Rules 후행으로 갱신 |
| `05_GDD_요약` | 문서 개요·기술 로드맵이 Art Style 이전 상태 | 최신 아트·전투·운영 상태 반영 |
| `10_제품방향` | 현재 Gate가 `NEXT ART-STYLE-01` | `ART-BIBLE-01 DRAFT REVIEW`로 교정 |
| `30_데모범위...` | 시각 상태 `NEXT ART-STYLE-01`, 전투 SD 재사용 전제 | 적 중심 전투·초상 구조와 Art Bible 상태 반영 |
| `70_아트_오디오_에셋` | 그림체 미승인·Audio가 Art Style에 차단 | Art Style 승인, Art Bible/Audio 후행으로 교정 |
| `90_본제작_출시_사업` | Art Style `IN_PROGRESS`, Demo가 Android | Art Style 완료, PC Demo 우선으로 교정 |
| `71_이미지기획` | 미생성 A/B/C 비교·구형 전술장 브리프가 활성처럼 보임 | 역사/대체 상태 명시, 잠긴 기준판과 파생 전투 규칙 연결 |
| `99_변경이력` | 단일 강적 동기화가 Readback Pending | 실제 Readback Pass·Receipt로 교정 |

## 11. 도메인별 내용 충돌·과잉

### 핵심 루프

- 자유일정 선택에 `수업`이 섞여 있으나 수업은 고정 주요 일정이다.
- Slice 마도서 루프에서 소환수 성장 선택이 즉시 제공되는 것처럼 보이나 Slice 런타임은 초기 형상 1개다.
- 전투 루프 일부가 `다음 적 행동`으로 표기되어 있으나 승인된 일반 적 기본 규칙은 `다음 공격`이다.

### 전투·수호 소환수

- 수호 소환수의 `직접 작성 안전 시간`이 타이머 정지인지 피해 차단인지 미정이다.
- 새 시간 흐름 계약상 작성 중 기본 타이머는 진행하므로 수호 소환수는 임의로 전투 시간을 정지시켜서는 안 된다.
- 정확한 보호 효과는 `BATTLE-RULES-01`에서 결정해야 한다.

### 입력·UX

- 일부 검증 항목이 Android 중심으로 남아 PC 우선 정책과 불일치한다.
- `GR-I-06`은 시간 흐름이 미정으로 남아 있으나 `GM-BATTLE-TIME-FLOW-01`로 해결됐다.
- `GR-UX-11`은 `TIME FLOW NOT_APPROVED`로 남아 있으나 현재 승인됨.

### 아트

- Art Bible 초안의 `주인공·적·수호 소환수가 동시에 전장 식별` 문장은 최신 전투 레이아웃과 충돌한다.
- 필드·전투 SD 골격 재사용은 전투에서 아군 몸체를 상시 표시한다는 뜻으로 사용하면 안 된다. 캐릭터 Design Key·Cut-in·초상 일관성으로 재해석한다.
- Main·Grimoire 완성 화면은 잠긴 기준판에 없으며 파생 화면 설계가 남아 있다.

### 출시

- PC 우선 정책인데 `Godot Android Demo`와 Google Play가 구현 로드맵 중심으로 남아 있다.
- Mobile은 PC Demo 검증 이후 별도 적응 Gate로 이동해야 한다.

---

# PART D. GitHub 운영체계 감사

## 12. 콜드 스타트 Drift

| 파일 | 문제 | 판정 |
|---|---|---|
| `AGENTS.md` | 다음 차단 `ART-STYLE-01`, Addendum R | `STALE_BLOCKING` |
| `START_HERE.md` | 다음 Gate Art Style, 이전 Sync Bundle만 표시 | `STALE_BLOCKING` |
| `docs/ACTIVE_CONTEXT.md` | Art 승인 후 전투 결정 4종 누락 | `STALE_BLOCKING` |
| `CURRENT_CONFIRMED_DECISIONS.md` | 최신 전투·시간 결정 누락 | `STALE_BLOCKING` |
| `DOCUMENTATION_MAP.md` | Art 후보 미결정·이미지 미생성으로 표시 | `STALE_BLOCKING` |
| `DESIGN_DOCUMENT_REGISTRY.json` | 최신 override U, Battle 권위·State·Receipt 누락 | `STALE_BLOCKING` |
| `PROJECT_GOOGLE_SHEET_WORKBOOK.md` | 최신 Sync Bundle·검증일 누락 | `STALE_NONBLOCKING` |
| Draft PR #22 본문 | 최신 단일 적·타이머·시간 흐름 누락 | `STALE_REVIEW_SURFACE` |

## 13. Base v9.3 Adapter Drift

| 파일 | 실제 상태 | 문제 |
|---|---|---|
| `docs/BASE_RULES_VERSION.md` | v8·과거 commit | Base v9.3 Release Pin과 불일치 |
| `skills/PROJECT_BASE_ADAPTER.json` | v9.1, Sheet conflict/block | 현재 v9.3·Readback Pass와 불일치 |
| `PROJECT_BASE_SKILL_ADAPTER.json` | Android/Google Play primary | PC 우선 프로젝트와 불일치 |
| `PROJECT_SKILL_SNAPSHOT.json` | 구형 Base hash·3 route | 현행 27 Skill Registry와 불일치 |
| `skills/SKILL_REGISTRY.json` | Art Style 미결정·v8 prompt | 현재 Gate와 불일치 |
| `tests/test_base_v9_adoption.py` | 구형 Pin과 Art Style Block을 성공 조건으로 검사 | CI가 stale 상태를 PASS로 인증 |

Base 계약상 생성 Compatibility View와 Snapshot을 손으로 수정하면 안 된다. 따라서 다음은 한 묶음으로 실행해야 한다.

```text
Canonical PROJECT_BASE_ADAPTER 갱신
→ Base v9.3 Generator 실행
→ Snapshot·Compatibility View 재생성
→ Registry Hash·Route 검증
→ 테스트 기대값 갱신
→ CI·Adversarial Gate
→ Sheet Readback
```

현재 대화형 Planning 작업에서는 Generator를 실행하지 않았으므로 Adapter Route는 `ATOMIC_REGENERATION_REQUIRED / SHARED_ROUTE_EXECUTION_BLOCKED`로 분류한다.

---

# PART E. 적대적 검토 결과

## 14. 공격 관점

### 새 작업자 관점

FAIL. 시작 문서만 읽으면 Art Style을 다시 결정하려고 할 가능성이 높다.

### 제작자 관점

PARTIAL. 제품 코어와 범위는 명확하지만 Adapter와 Current Snapshot이 갈라져 실행 진입이 안전하지 않다.

### UX 관점

PARTIAL. 적 중심 화면과 시간 흐름은 정리됐지만 피해·방어·승패·수호 효과가 없어 전투가 아직 완전한 규칙으로 닫히지 않았다.

### 1인 제작 관점

PASS_WITH_GUARDRAILS. 단일 강적·단일 일반 페이즈·공용 배경 상태 변형은 범위를 보호한다. 다만 Main·Grimoire·표정·이름·Audio까지 동시에 확장하면 다시 팽창한다.

### 검증 관점

FAIL_CI_SEMANTICS. 현재 CI는 구형 Base Pin과 Art Style Block을 기대해 통과하므로 최신 운영 정합성을 증명하지 못한다.

## 15. 즉시 보완 분류

### 즉시 자동 교정

- 콜드 스타트 문서와 최신 결정 경로.
- Sheet 상단·상태·과거 Pending 표기.
- Art Bible 전투 충돌 Addendum.
- PR 설명.
- Current Snapshot·Active Context.

### 원자적 후행 작업

- Base v9.3 Adapter·Snapshot·Compatibility View·Registry·테스트 재생성.
- 원본 Generator와 검증 명령이 필요한 작업이므로 부분 편집 금지.

### 사용자 결정이 필요한 제품 기획

- 피해·방어·승리·패배·부분 성공 규칙.
- 수호 소환수의 실제 전투 효과.
- 일반 적 공격 간격의 튜닝 범위.
- 보스 페이즈 수·전환·회복 규칙.
- Main 화면·Grimoire 화면 파생 보드.
- 교수·동급생·메인 동반 정령 이름.

---

# PART F. 남은 기획과 권장 순서

## 16. 다음 작업 순서

```text
P0 운영 정본 복구
→ P0 Art Bible 전투 충돌 교정
→ P0 BATTLE-RULES-01
→ P1 BOSS-PHASE-01
→ P1 ART-BIBLE-01 사용자 검토·승인
→ P1 Main·Grimoire 파생 화면
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ Base v9.3 Adapter 원자적 재생성·CI
→ 사용자 Codex Plan 승인
```

`BATTLE-RULES-01`의 결정 질문은 다음 하나로 시작한다.

> 강한 적과의 일반 전투에서 플레이어가 이기는 조건을 `HP 0 처치`, `진정 게이지`, `상황 목표 해결` 중 무엇을 기본으로 할 것인가?

현재 현장실습의 폭주 정령과 프로젝트의 책임 설계 판타지를 고려하면 `상황 목표 해결 + 적 안정도/진정 상태`를 기본으로 하고, HP는 전투 압박과 실패 위험을 표현하는 보조 수단으로 사용하는 방향을 우선 검토한다. 아직 승인된 제품 결정은 아니다.

## 17. 범위 보호

- 감사·정합화가 새로운 게임 시스템을 자동 승인하지 않는다.
- 정확한 수치와 Balance는 Prototype 이전에 확정하지 않는다.
- Product Code·Scene·Resource·Runtime Asset을 생성하지 않는다.
- PR #22는 사용자 승인 없이 병합하지 않는다.
- 잠긴 Art Style 원본을 수정하지 않는다.

---

## 18. 감사 결론

프로젝트 코어·Vertical Slice·Art Style·최신 전투 방향은 일관된다. 가장 큰 문제는 제품 기획 자체보다 **콜드 스타트·Registry·Adapter·Sheet 상단이 서로 다른 시간대의 상태를 가리키는 운영 Drift**다.

따라서 다음 작업은 새로운 콘텐츠 확장이 아니라 현재 승인 결정을 한 번에 복원할 수 있도록 권위 경로를 먼저 교정하고, 그 뒤 `BATTLE-RULES-01`로 전투 규칙을 완성하는 것이다.
