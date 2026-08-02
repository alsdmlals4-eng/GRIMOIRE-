# GR-SYNC-20260802-10 — Working Branch Sync Receipt

## 1. 상태

```yaml
sync_id: GR-SYNC-20260802-10
status: SYNCED_TO_WORKING_BRANCH
sequence_decision: GM-FULL-GAME-PLANNING-ORDER-01
approved_grill_me_decision: GM-FULL-GAME-MACRO-LOOP-01
approved_option: A_ACADEMIC_SPIRAL_WITH_OPTIONAL_FIELD_PRACTICUM
approved_at: 2026-08-02T16:03+09:00
current_grill_me_decision: GM-FULL-GAME-CHAPTER-RHYTHM-01
baseline_main: 385b17d84608b6871c7453cdeacc43268c5cea91
working_branch: chatgpt/grimoire-full-game-structure-20260802
draft_pr: 36
current_design_gate: FULL-GAME-STRUCTURE-01
mobile_foundation: IN_PROGRESS_PAUSED_AT_UPSTREAM_DESIGN_DEPENDENCY
grill_me_counter: 1_of_10
pending_decision_ids:
  - GM-FULL-GAME-MACRO-LOOP-01
implementation: NOT_STARTED
codex: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 2. 사용자 승인 반영

사용자는 전체 게임 Macro Loop 권장안 A를 승인했다.

추가 승인:

> 자유일정에서도 현장실습을 선택해 숲·훈련장·전투 공간에서 전투를 진행할 수 있다.

따라서 전체 게임의 기본 반복 구조는 다음과 같다.

```text
새 마법 원리·상황 질문 학습
→ 자유일정에서 휴식·준비·교류·현장실습 중 선택
→ 시험·행사·훈련에서 통제된 응용
→ 메인 현장 사건에서 복합 적용과 책임 선택
→ 마도서 복기·발견·평가
→ 다음 원리와 더 어려운 상황 개방
```

기본 콘텐츠 단위는 `학습 나선 Chapter`이며 기존 Vertical Slice는 첫 Chapter의 검증판이다.

## 3. 선택형 현장실습 계약

- 공간: 학교 모의전투장·실습장, 숲·생태 구역, 안전이 확보된 사건 지역, 별도 승인 전투 공간.
- 비용: 자유일정 슬롯 1개.
- 전투: 강한 적 또는 훈련 표적 1개체 중심 상황 해결형 전투.
- 목표: 진정·통제·보호·환경 대응과 실전 관찰.
- 보상: 첫 완료·새 조건·새 해법·마도서 현장 기록 우선.
- 금지: 핵심 글자·필수정보·유일 해법 독점, 무한 성장 파밍, 메인 현장 사건 자동 해결.
- 제작 보호: 기존 공간·적 변형 재사용 우선, 고유 상황 질문 없는 반복 전투 추가 금지.
- 미확정: 정확한 전투 길이·보상량·반복 감쇠는 후속 `TEST_VALUE`.

## 4. Vertical Slice 영향

기존 45~50분 대표 경로와 53분 콘텐츠 상한은 자동 변경하지 않는다.

- 본편 자유일정의 네 번째 선택축으로 현장실습을 승인했다.
- Slice A/B/C 슬롯에 선택형 전투를 실제 몇 회 노출할지는 대표성 재검증에서 정한다.
- Slice에 포함할 경우 기존 전투장·숲/온실 공간을 재사용하고 시간 예산을 재배분한다.
- 새 전투를 단순 추가해 53분 상한을 초과하는 것은 승인되지 않았다.

## 5. 적대적 감사 갱신

닫힘:

- 작업 순서 충돌.
- 전체 게임 Macro Loop 부재.

열린 공백:

- Chapter 리듬과 순서 변주.
- 새 글자 커리큘럼·조합 확장.
- 성장 선택 비용.
- 보상 경제·소모처.
- 부분 성공·평가의 장기 영향.
- 본편 범위와 종결 조건.

새 위험:

- 선택형 전투가 자유일정의 지배적 선택이 되는 문제.
- 반복 전투 파밍.
- 메인 현장 사건의 긴장 약화.
- 추가 공간·적·직접 작성으로 인한 제작량·피로 증가.

현재 보호 규칙은 승인 문서와 Gap Audit에 기록했다.

## 6. GitHub 반영

- `docs/planning/FULL_GAME_STRUCTURE_GATE_01_2026-08-02.md`
- `docs/planning/FULL_GAME_STRUCTURE_GAP_AUDIT_2026-08-02.md`
- `docs/planning/benchmarks/FULL_GAME_CORE_LOOP_STANDARD_BENCHMARK_2026-08-02.md`
- `docs/planning/FULL_GAME_STRUCTURE_01_GRILL_ME_2026-08-02.md`
- `docs/planning/FULL_GAME_MACRO_LOOP_01_APPROVAL_2026-08-02.md`
- `docs/planning/FULL_GAME_CHAPTER_RHYTHM_01_GRILL_ME_2026-08-02.md`
- `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
- 이 Working Sync Receipt.

## 7. Google Sheet 반영 대상

- `00_프로젝트_허브!H2`.
- `01_작업순서!A20:J20`.
- `02_현재_확정결정!A33:J33`에 Macro Loop 승인 추가.
- `04_누락_충돌_감사!A26:H26`.
- `10_제품방향` 전체 게임 구조 상태.
- `12_핵심루프` Macro Loop 승인과 다음 Chapter Rhythm 후보.
- `40_핵심시스템_메인콘텐츠` 선택형 현장실습.
- `41_성장_경제` 자유일정 4축과 파밍 금지.
- `50_메인콘텐츠` 선택형 현장실습 콘텐츠 단위.
- `80_데모_버티컬슬라이스_플레이테스트` 대표성 재검증 경계.
- `99_변경이력!A27:H27`.

## 8. 현재 다음 결정

`GM-FULL-GAME-CHAPTER-RHYTHM-01`.

권장안:

`A — 기능 고정·순서 가변형`.

```text
발견·학습 / 선택·준비 / 통제된 응용 / 실전·책임 선택 / 복기
```

기능은 유지하되 Chapter마다 순서·형태·비중을 변주한다.

## 9. 병합 경계

- 현재 Grill Me counter는 `1/10`.
- pending Decision은 `GM-FULL-GAME-MACRO-LOOP-01`.
- Draft PR #36은 10/10 또는 조기 Trigger 전까지 병합하지 않는다.
- 병합 직전 최신 GitHub·Sheet·PR·CI·Review를 `GM-PREMERGE-ADVERSARIAL-GATE-01`로 전수 검토한다.
