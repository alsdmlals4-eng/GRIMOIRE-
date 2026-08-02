# GR-SYNC-20260802-10 — Working Branch Sync Receipt

## 1. 상태

```yaml
sync_id: GR-SYNC-20260802-10
latest_change_id: GR-SYNC-20260802-11
status: SYNCED_TO_WORKING_BRANCH
sheet_readback: PASS
sequence_decision: GM-FULL-GAME-PLANNING-ORDER-01
approved_grill_me_decisions:
  - GM-FULL-GAME-MACRO-LOOP-01
  - GM-FULL-GAME-CHAPTER-RHYTHM-01
latest_approved_option: A_FIXED_FUNCTIONS_VARIABLE_ORDER
latest_approved_at: 2026-08-02T16:18+09:00
current_grill_me_decision: GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01
baseline_main: 385b17d84608b6871c7453cdeacc43268c5cea91
working_branch: chatgpt/grimoire-full-game-structure-20260802
draft_pr: 36
authority_head_before_final_receipt: 49e9c3e0c43aeba7252cafb0006e5868a3d4c84c
final_head_resolution: CURRENT_BRANCH_CONTAINING_THIS_RECEIPT; exact SHA recorded in Google Sheet
current_design_gate: FULL-GAME-STRUCTURE-01
mobile_foundation: IN_PROGRESS_PAUSED_AT_UPSTREAM_DESIGN_DEPENDENCY
grill_me_counter: 2_of_10
pending_decision_ids:
  - GM-FULL-GAME-MACRO-LOOP-01
  - GM-FULL-GAME-CHAPTER-RHYTHM-01
implementation: NOT_STARTED
codex: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 2. 승인된 전체 게임 구조

### Macro Loop

```text
새 마법 원리·상황 질문 학습
→ 자유일정에서 휴식·준비·교류·현장실습 중 선택
→ 시험·행사·훈련에서 통제된 응용
→ 메인 현장 사건에서 복합 적용과 책임 선택
→ 마도서 복기·발견·평가
→ 다음 원리와 더 어려운 상황 개방
```

기본 콘텐츠 단위는 `학습 나선 Chapter`다.

### Chapter Rhythm

각 Chapter는 다음 다섯 기능을 갖되 순서·형태·비중을 바꾼다.

```text
발견·학습
선택·준비
통제된 응용
실전·책임 선택
복기·다음 질문
```

보호 규칙:

- 인접 Chapter의 완전히 동일한 장면 순서 복제 금지.
- 각 Chapter 기획 카드에 다섯 기능 담당 장면 명시.
- 자유일정 창 `1~3회 후보 / TEST_VALUE`.
- 현장실습은 허가·안전·공간·서사 상태가 맞을 때만 개방.
- 현장실습은 메인 현장 사건의 책임과 세계 변화를 대체하지 않음.
- 기존 장소·상태 변형·콘텐츠 형식 재사용 우선.

## 3. 현장실습 계약 유지

- 공간: 학교 실습장, 숲·생태 구역, 안전 구획, 승인 전투 공간.
- 비용: 자유일정 슬롯 1개.
- 전투: 단일 강적 중심 상황 해결형 전투.
- 보상: 첫 완료·새 조건·새 해법·마도서 기록 우선.
- 금지: 핵심 글자·필수 정보·유일 해법 독점, 무한 성장 파밍, 메인 사건 자동 해결.
- 정확한 길이·보상·감쇠: 후속 `TEST_VALUE`.

## 4. Chapter Rhythm 적대적 감사

### 닫힌 위험

- 모든 Chapter가 수업→시험→축제→현장을 동일하게 복제하는 위험.
- 고정 달력 때문에 서사 사건이 틀에 끌려가는 위험.
- 모든 Chapter가 사건 우선 구조로 고정되어 학교생활이 약해지는 위험.

### 남은 검증

- 변주가 과해 Chapter 목표를 이해하기 어려운지.
- 동일 콘텐츠 형식이 다른 이름으로만 반복되는지.
- 자유일정 현장실습이 여전히 다른 선택을 압도하는지.
- 기능 전환점이 Mobile 세션 Anchor로 적합한지.

## 5. 마법 커리큘럼 정본 대조

### 최신 Vertical Slice 정본

- `흐름 + 집중/분산`.
- 메인 1 + 보조 0~1.
- 다중 보조·순서 문법·완성 주문 스톡은 Slice 제외.
- 직접 작성 필수 성공 7회, 복구 포함 목표 상한 10회.

### 구형 장기 방향

- 다수 메인 계열 후보.
- 3개 학년·메인 Lv.0~5 후보.
- 보조 역할 10종·학년별 보조 2/4/6개 후보.
- 전문화·스톡·독립 연구 후보.

구형 문서는 `PROVISIONAL / PLANNING_DEFAULT` 항목을 포함하므로 전체 게임의 자동 약속으로 사용하지 않는다.

## 6. 현재 다음 결정

`GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01`.

권장안:

`A — 제한된 의미 나선`.

```text
Chapter당 새 메인 글자 1개
또는 새 보조 글자·문법 1개
→ 이전 글자를 새 상황에서 재해석
→ 통제된 응용
→ 자유일정·현장실습 실험
→ 메인 현장 책임 선택
→ 마도서 활용·부작용 기록
```

Chapter 1의 `흐름 + 집중/분산`은 대비 학습을 위한 승인된 예외다.

## 7. GitHub 반영

- `FULL_GAME_MACRO_LOOP_01_APPROVAL_2026-08-02.md`.
- `FULL_GAME_CHAPTER_RHYTHM_01_GRILL_ME_2026-08-02.md`.
- `FULL_GAME_CHAPTER_RHYTHM_01_APPROVAL_2026-08-02.md`.
- `benchmarks/FULL_GAME_MAGIC_GLYPH_CURRICULUM_CANON_RECONCILIATION_2026-08-02.md`.
- `FULL_GAME_MAGIC_GLYPH_CURRICULUM_01_GRILL_ME_2026-08-02.md`.
- `FULL_GAME_STRUCTURE_GAP_AUDIT_2026-08-02.md`.
- `GRILL_ME_BATCH_MERGE_STATE.json`.
- 이 Working Sync Receipt.

## 8. Google Sheet Readback

갱신·재조회 범위:

- `00_프로젝트_허브!H2`.
- `01_작업순서!A20:J20`.
- `02_현재_확정결정!E31:J31`.
- `02_현재_확정결정!A34:J34`.
- `03_근거_라이브러리!A13:I13`.
- `04_누락_충돌_감사!A27:H27`.
- `05_GDD_요약!A4:J4`.
- `10_제품방향!A9:F9`.
- `12_핵심루프!A10:J11`.
- `30_데모범위_품질기준_제작기반!A6:H6`.
- `50_메인콘텐츠!A8:J8`.
- `80_데모_버티컬슬라이스_플레이테스트!A17:J17`.
- `99_변경이력!A28:H28`.

Readback 판정:

```text
Decision ID match = PASS
Approved option match = PASS
Counter 2/10 = PASS
Pending decisions 2 = PASS
Next Grill Me match = PASS
Chapter function contract match = PASS
Legacy curriculum conflict boundary match = PASS
Existing authority row overwrite = NONE
Implementation/Runtime/Device/Human boundary = PRESERVED
```

## 9. 병합 경계

- 현재 Grill Me counter: `2/10`.
- pending Decisions:
  - `GM-FULL-GAME-MACRO-LOOP-01`.
  - `GM-FULL-GAME-CHAPTER-RHYTHM-01`.
- Draft PR #36은 10/10 또는 조기 Trigger 전까지 병합하지 않는다.
- 병합 직전 최신 GitHub·Sheet·PR·CI·Review를 `GM-PREMERGE-ADVERSARIAL-GATE-01`로 전수 검토한다.
