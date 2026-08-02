# GRIMOIRE 작업 규칙

이 파일은 **GRIMOIRE: 세계를 다시 쓰는 법**의 최상위 프로젝트 운영 권위다.

## 1. 프로젝트 바인딩

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: chatgpt/grimoire-mobile-first-canon-20260802
primary_platform: Mobile
follow_up_platform: PC
platform_decision: GM-PLATFORM-02
engine_baseline_candidate: Godot 4.7.1 stable
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE
work_mode: PLAN
planning: APPROVED
art_style_01: APPROVED_A_MODIFIED_LOCKED
art_bible_01: APPROVED_DUAL_STANDARD_ART_BIBLE
battle_rules_01: APPROVED_SITUATION_RESOLUTION_RULES
asset_spec_01: APPROVED_SPEC
next_product_gate: MOBILE-FOUNDATION-01
queued_design_gates: BOSS-PHASE-01 / GRIMOIRE-SCREEN-01 / AUDIO-DIRECTION-01
implementation: NOT_STARTED
codex: BLOCKED
canon_sync_policy: GM-CANON-SYNC-01
current_sync_bundle: GR-SYNC-20260802-07
```

첨부 Godot Linux 실행 파일은 버전 참고 자료이며 저장소 자산으로 커밋하지 않는다.

## 2. 권한 우선순위

1. 사용자의 최신 명시적 결정.
2. 이 `AGENTS.md`.
3. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`.
4. `START_HERE.md`.
5. `docs/ACTIVE_CONTEXT.md`.
6. 최신 Decision Addendum 또는 현재 승인 책임 원본.
7. 주제별 승인 책임 원본.
8. `docs/DEVELOPMENT_GATES.md`.
9. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
10. `skills/PROJECT_BASE_ADAPTER.json`과 생성 Snapshot.
11. 실제 코드·Scene·Resource·데이터·자산·테스트.
12. 고정 Base Release·Evidence Commit.
13. Legacy·과거 대화·외부 AI 결과·추정.

Sheet 단독 값이나 생성 이미지는 승인 근거와 상태가 없으면 정본이 아니다. 역사 기록의 PC-first 문구는 `GM-PLATFORM-02`를 대체하지 않는다.

## 3. 필수 읽기 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/PLATFORM_MOBILE_FIRST_02_2026-08-02.md
→ 질문 주제의 승인 책임 원본
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ skills/PROJECT_BASE_ADAPTER.json
```

GitHub·Sheet 조회로 해결되는 사실을 사용자에게 다시 묻지 않는다. 확정 결정은 기억 확인 목적으로 재질문하지 않는다.

## 4. Base v9.4 계약

```yaml
base_repository: alsdmlals4-eng/Base
release: v9.4.0
release_commit: a728712cb776ec98f4875914a580fcf7d0156593
evidence_commit: ef1fba11167e4da0b298123b0c85ebd268191a42
registry_sha256: 693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59
finalization_commit: 87a0b54c2847ce4b685879209205957c170cc1cd
execution_prompt: VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v9.md
```

- `skills/PROJECT_BASE_ADAPTER.json`만 편집 가능한 통합 권위다.
- `PROJECT_SKILL_SNAPSHOT.json`, `BASE_V9_ADAPTER.json`, `PROJECT_BASE_SKILL_ADAPTER.json`은 생성물이다.
- 생성물은 `tools/generate_project_operating_views.py`로 생성·검사하며 직접 편집하지 않는다.
- Base Skill 본문을 프로젝트에 복제하지 않는다.
- Trigger에 맞는 최소 Skill만 사용한다.

## 5. 벤치마킹 선행

결정 ID: `GM-BENCHMARK-FIRST-01`.

새 시스템·핵심 규칙·콘텐츠 구조·UX 흐름은 범위에 맞는 `QUICK / STANDARD / DEEP` 벤치마킹 후 설계한다. 공식·1차 자료를 우선하고 `ADOPT / ADAPT / REJECT`를 기록한다.

비발동:

- 오탈자·상태·SHA·링크 동기화.
- 승인 구조의 단순 데이터 입력.
- 설계를 바꾸지 않는 명백한 버그 수정.

## 6. 승인 정본 즉시 동기화

결정 ID: `GM-CANON-SYNC-01`.

```text
Decision ID
→ GitHub 권위 문서·계획 데이터
→ authority commit
→ 연결된 Google Sheet
→ 양쪽 Readback
→ SYNCED_TO_WORKING_BRANCH
→ PR 병합
→ main·Sheet 재검증
→ SYNCED_TO_MAIN
```

완료 보고에는 Decision ID, GitHub 경로, Commit, Sheet 범위, Readback, 남은 미검증을 기록한다.

## 7. 승인된 프로젝트 코어

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

비타협:

- 의미를 가진 글자.
- `메인 글자 1개 + 보조 글자 0개 이상`.
- 신규·미숙·중요 글자의 직접 작성.
- 상황·목표·위험에 따른 설계 판단.
- 즉각적이고 설명 가능한 세계 변화.
- 입력 실패·문법 실패·상황 설계 실패 분리.
- 학습→증명→표현→응용→발견·기록 순환.

## 8. 승인된 Vertical Slice

```text
첫 수업·교내 연습
→ 자유일정 A
→ 첫 실기시험
→ 자유일정 B
→ 학교축제
→ 자유일정 C
→ 첫 현장실습
→ 귀환·마도서 기록
```

- 목표 `45~50분`, 콘텐츠 상한 `53분`, 하드 상한 `60분`.
- 글자 `흐름 / 집중 / 분산`.
- 자유일정 `휴식 / 준비 / 교류` 3회.
- 필수 성공 작성 7회, 안내형 복구 포함 목표 상한 10회.
- 메인 동반 정령은 작은 늑대형 초기 형상 1개.
- 수호형 보조 소환수 1체 우선.
- 마도서는 과정과 결과를 기록하며 자동 주문 Stock이 아니다.

## 9. 승인된 시각·Asset 계약

책임 원본:

- `docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md`.
- `docs/planning/ASSET_SPEC_01_APPROVAL_2026-08-01.md`.

- Soft Storybook 배경 + 선명한 Anime Cel 캐릭터.
- Navy/Gold UI + 고대비 Blue Glyph.
- 고정 3/4 Field, 같은 장소 Half-body Dialogue, 별도 Battle, Result 후 Field 복귀.
- 고정 주인공 1명, 전투 상시 초상 1개.
- 동반 정령·수호 소환수는 상태 배지로 분리.
- Battle Writing Panel은 축소 Rail에서 작성 시 확장.
- Grimoire 파생 화면을 Main보다 먼저 설계.
- 잠긴 기준 이미지 SHA-256 `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`는 수정·재생성 금지.
- 기존 16:9·PC 해상도 규격은 승인 Asset 기준이지만 Mobile 실기기 적합성을 증명하지 않는다.

## 10. 승인된 전투 규칙

책임 원본: `docs/planning/BATTLE_RULES_01_APPROVAL_2026-08-01.md`.

- 기본 조우는 강한 적 1개체.
- 일반 적은 단일 페이즈.
- 적은 일정 시간마다 공격.
- 플레이어는 작성 후 `[구현]`으로 즉시 시전.
- 판단·작성 중 타이머 진행, 시스템 해결 중 정지.
- 선택형 작성 감속 제공; 정확한 배율은 튜닝 항목.
- 기본 적에게 일반 HP를 두지 않고 `불안정도`를 사용.
- 상황에 맞는 주문으로 불안정도 0에 도달하면 진정·해결.
- 플레이어 HP 0 또는 선언된 치명적 환경 붕괴가 패배.
- 환경 보존도·부작용·남은 HP·해결 방식이 결과 품질을 결정.
- 수호 소환수는 다음 공격 피해를 완화하지만 타이머·작성·판단을 대신하지 않는다.

## 11. GM-PLATFORM-02 / Mobile 우선

책임 원본: `docs/planning/PLATFORM_MOBILE_FIRST_02_2026-08-02.md`.

- 1차 플랫폼은 `Mobile`, 후속 플랫폼은 `PC`.
- `GM-PLATFORM-01 / PC 우선·Mobile 후속`은 `SUPERSEDED_BY GM-PLATFORM-02`.
- Touch·Stylus 작성과 명시적 Undo·삭제·초기화·취소·확정·구현을 Mobile 입력의 중심으로 재설계한다.
- OS, Store, 화면 방향, 최소 기기, 성능·메모리·배터리 수치, 인식 처리 방식은 아직 확정하지 않는다.
- 기존 Mouse/Pen/Keyboard 계약은 후속 PC 적응 자료이며 Mobile 기본 입력으로 사용하지 않는다.

## 12. 현재 작업 경로

```text
MOBILE-FOUNDATION-01
→ BOSS-PHASE-01·Grimoire/Main 파생 화면 영향 재검토
→ AUDIO-DIRECTION-01
→ Mobile 기준 기획·아트·UX 통합 검수
→ 사용자 Codex Plan 승인
→ Codex read-only Plan
→ 기술 검수
→ 실행 프로필 전환 승인
→ Validation-First 구현
```

`MOBILE-FOUNDATION-01`은 다음을 다룬다.

- Touch·Stylus 작성·복구·확정 계약.
- 화면 방향·지원 비율·Safe Area·System gesture 후보.
- 작은 화면의 Battle/Writing 정보 위계.
- App pause/resume·background/foreground·interrupted stroke·stale request 방어.
- Device·Memory·Texture·load·frame pacing·battery·thermal 검증 계획.
- 후속 PC 입력 적응 원칙.

정확한 공격 간격·피해·마나·불안정도 변화량·수호 완화율·Touch target·인식 허용치는 `PLAYTEST_TUNING_REQUIRED`다.

## 13. 현재 허용·금지

허용:

- Mobile Foundation·기획·아트·UX·전투 규칙 문서.
- Boss/Grimoire/Main/Audio의 Mobile 영향 분석.
- 벤치마킹·적대적 검토.
- GitHub·Sheet 정본 동기화.
- 운영 Adapter·검증 Tooling.

금지:

- Godot 제품 코드·Scene·Resource·게임 데이터 생성.
- Codex Build.
- 잠긴 기준 이미지 편집·재생성.
- OS·방향·성능·인식 수치를 증거 없이 확정.
- 실행하지 않은 Runtime·Mobile device·성능·접근성·사람 검증 완료 주장.
- 기본 브랜치 직접 수정.

PR 병합은 사용자 승인과 검증 통과가 필요하다.
