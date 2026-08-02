# GR-SYNC-20260802-12 — 다계열 수강·전문화 Working Sync Receipt

## 1. 상태

```yaml
sync_id: GR-SYNC-20260802-12
status: SYNCED_TO_WORKING_BRANCH
sheet_readback: PENDING
approved_decision: GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01
approved_option: B_MULTI_SCHOOL_ENROLLMENT_SPECIALIZATION_TREE
approved_at: 2026-08-02T17:19+09:00
current_grill_me_decision: GM-FULL-GAME-GROWTH-CHOICE-COST-01
baseline_main: 385b17d84608b6871c7453cdeacc43268c5cea91
working_branch: chatgpt/grimoire-full-game-structure-20260802
draft_pr: 36
grill_me_counter: 3_of_10
pending_decision_ids:
  - GM-FULL-GAME-MACRO-LOOP-01
  - GM-FULL-GAME-CHAPTER-RHYTHM-01
  - GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01
implementation: NOT_STARTED
codex: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 2. 사용자 승인

사용자는 마법 글자 커리큘럼 후보 중 `B — 다계열 수강·전문화 트리`를 선택했다.

```text
공통 문법·기초 계열 체험
→ 복수 메인 계열 수강
→ 계열별 성장·활용 기록
→ 일부 계열 심화
→ 전문화·연구 방향 선택
```

## 3. 승인 범위

- 복수 메인 계열 수강과 계열별 성장.
- 기초 체험 이후 일부 계열 심화.
- 전문화에 따른 해법·관계·연구·마도서 기록 차이.
- `흐름`을 첫 기초 계열 대표 사례로 유지.
- `집중 / 분산`을 공통 보조 문법의 첫 사례로 유지.

미확정:

- 본편 계열 수.
- 동시 수강 계열 수.
- 학년·학기 범위.
- 계열 레벨 상한.
- 전문화 진입 단계.
- 보조 글자 운용량.

## 4. 적대적 보호 규칙

- 미선택 계열이 메인 진행을 막지 않는다.
- 주요 사건은 복수 계열 또는 공통 문법 해법을 수용한다.
- 계열별 별도 캠페인·맵·적·UI·VFX 전체 세트를 의무 제작하지 않는다.
- 공통 사건·장소·적·보조 문법을 계열별 결과와 대가로 재사용한다.
- 반복 시전만으로 전문화하지 않는다.
- 초기 선택을 즉시 영구 잠금하지 않는다.
- 특정 계열이 대부분 상황의 상위 호환이 되면 재설계한다.
- 계열 수 증가와 한 주문의 글자 수 증가를 동시에 무제한 허용하지 않는다.

## 5. 구형 정본 처리

구형 장기 문서의 `다수 계열 / 3학년 / Lv.0~5 / Lv.4 전문화 / 보조 2·4·6` 중 다계열 수강과 전문화 방향은 재승인됐다.

그러나 정확한 학년·레벨·수치와 제작량은 아직 `PROVISIONAL / TEST_VALUE`이며, 이번 승인만으로 최종 본편 약속이 되지 않는다.

## 6. 다음 결정

`GM-FULL-GAME-GROWTH-CHOICE-COST-01`.

권장안:

`A — 수강 슬롯 + 성장 증거 인증형`.

```text
수강 선택
→ 이해
→ 직접 작성·통제 응용
→ 서로 다른 현장 활용
→ 시험·보고·교수 인증
→ 심화·전문화
```

성장 증거 후보:

- 이해.
- 숙련.
- 활용.
- 인증.

## 7. GitHub 반영

- `FULL_GAME_MAGIC_GLYPH_CURRICULUM_01_GRILL_ME_2026-08-02.md`.
- `FULL_GAME_MAGIC_GLYPH_CURRICULUM_01_APPROVAL_2026-08-02.md`.
- `FULL_GAME_GROWTH_CHOICE_COST_01_GRILL_ME_2026-08-02.md`.
- `FULL_GAME_STRUCTURE_GAP_AUDIT_2026-08-02.md`.
- `GRILL_ME_BATCH_MERGE_STATE.json`.
- 이 Working Sync Receipt.

## 8. Sheet 반영 대상

- 프로젝트 허브·작업 순서·확정 결정.
- GDD·제품 방향·핵심 루프.
- 성장 경제·메인 콘텐츠·플레이테스트.
- 감사·변경 이력.

## 9. 병합 경계

- 현재 카운터는 `3/10`.
- Draft PR #36은 병합하지 않는다.
- 10/10 또는 조기 Trigger에서 `GM-PREMERGE-ADVERSARIAL-GATE-01`을 실행한다.
