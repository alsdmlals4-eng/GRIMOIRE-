# GRIMOIRE 작업 규칙

이 파일은 **GRIMOIRE: 세계를 다시 쓰는 법**의 최상위 프로젝트 운영 권위다.

## 1. 프로젝트 바인딩

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/grimoire-v93-canon
primary_platform: PC
follow_up_platform: Mobile
engine_baseline_candidate: Godot 4.7.1 stable
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE
work_mode: PLAN
planning: APPROVED
art_style_01: APPROVED_A_MODIFIED_LOCKED
art_bible_01: APPROVED_DUAL_STANDARD_ART_BIBLE
battle_rules_01: APPROVED_SITUATION_RESOLUTION_RULES
next_product_gate: ASSET-SPEC-01
parallel_design_gate: BOSS-PHASE-01
implementation: NOT_STARTED
codex: BLOCKED
canon_sync_policy: GM-CANON-SYNC-01
```

첨부 Godot Linux 실행 파일은 버전 참고 자료이며 저장소 자산으로 커밋하지 않는다.

## 2. 권한 우선순위

1. 사용자의 최신 명시적 결정.
2. 이 `AGENTS.md`.
3. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`.
4. `START_HERE.md`.
5. `docs/ACTIVE_CONTEXT.md`.
6. 최신 Decision Addendum.
7. 주제별 승인 책임 원본.
8. `docs/DEVELOPMENT_GATES.md`.
9. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
10. `skills/PROJECT_BASE_ADAPTER.json`과 생성 Snapshot.
11. 실제 코드·Scene·Resource·데이터·자산·테스트.
12. 고정 Base Release·Evidence Commit.
13. Legacy·과거 대화·외부 AI 결과·추정.

Sheet 단독 값이나 생성 이미지는 승인 근거와 상태가 없으면 정본이 아니다.

## 3. 필수 읽기 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG_ADDENDUM_2026-08-01F.md
→ 질문 주제의 승인 책임 원본
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ skills/PROJECT_BASE_ADAPTER.json
```

GitHub·Sheet 조회로 해결되는 사실을 사용자에게 다시 묻지 않는다. 확정 결정은 기억 확인 목적으로 재질문하지 않는다.

## 4. Base v9.3 계약

```yaml
base_repository: alsdmlals4-eng/Base
release: v9.3.0
release_commit: 30ca6c7b5f93521f0eb0eed42d01437cd43c50ae
evidence_commit: 462a86db192d23d0f386281a1eb54b0a8cbad62e
registry_sha256: 9847bb2b225c776ad7916930f0f48c490bc2a898bea8e02ea1fdd0e6caac60c1
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

## 7. 승인된 코어

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

## 9. 승인된 Art Bible

책임 원본: `docs/planning/ART_BIBLE_01_APPROVAL_2026-08-01.md`.

- Soft Storybook 배경 + 선명한 Anime Cel 캐릭터.
- Navy/Gold UI + 고대비 Blue Glyph.
- 고정 3/4 Field, 같은 장소 Half-body Dialogue, 별도 Battle, Result 후 Field 복귀.
- 고정 주인공 1명, 전투 상시 초상 1개.
- 동반 정령·수호 소환수는 상태 배지로 분리.
- Battle Writing Panel은 축소 Rail에서 작성 시 확장.
- 본문 고딕계, 제목 제한적 세리프계 방향.
- Grimoire 파생 화면을 Main보다 먼저 설계.
- 잠긴 기준 이미지 SHA-256 `b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`는 수정·재생성 금지.

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
- 수호 소환수는 다음 공격 피해를 완화하지만 타이머·작성·판단을 대신하지 않음.

## 11. 현재 작업 경로

```text
ASSET-SPEC-01
→ BOSS-PHASE-01·Grimoire/Main 파생 화면
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ 사용자 Codex Plan 승인
→ Codex read-only Plan
→ 기술 검수
→ 구현
```

## 12. 현재 허용·금지

허용:

- 기획·아트·UX·전투 규칙 문서.
- Asset Specification·Audio Direction.
- 벤치마킹·적대적 검토.
- GitHub·Sheet 정본 동기화.
- 운영 Adapter·검증 Tooling.

금지:

- Godot 제품 코드·Scene·Resource·게임 데이터 생성.
- Codex Build.
- 잠긴 기준 이미지 편집·재생성.
- Asset Spec 전 대량 이미지·사운드 제작.
- 실행하지 않은 런타임·성능·접근성·사람 검증 완료 주장.
- 기본 브랜치 직접 수정.

PR 병합은 사용자 승인과 검증 통과가 필요하다. 2026-08-01F 작업에는 사용자의 일괄 승인이 기록되어 있으나 CI·Readback 실패 시 병합하지 않는다.
