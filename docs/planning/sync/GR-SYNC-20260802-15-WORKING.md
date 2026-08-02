# GR-SYNC-20260802-15 — 숨김 소폭 감점·학기말 평가 Working Sync Receipt

## 1. 상태

```yaml
sync_id: GR-SYNC-20260802-15
status: SYNCED_TO_WORKING_BRANCH
sheet_readback: PENDING
authority_head_before_sheet: 20185faaade9b9ba7485806284ef0dc856b60701
approved_decision: GM-FULL-GAME-FAILURE-LONG-TERM-IMPACT-01
approved_option: A_RESULT_TAG_RECOVERY_SPIRAL_WITH_HIDDEN_MINOR_SEMESTER_EVALUATION
approved_at: 2026-08-02T18:23+09:00
current_grill_me_decision: GM-FULL-GAME-SCOPE-ENDING-01
baseline_main: 385b17d84608b6871c7453cdeacc43268c5cea91
working_branch: chatgpt/grimoire-full-game-structure-20260802
draft_pr: 36
grill_me_counter: 6_of_10
implementation: NOT_STARTED
codex: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 2. 사용자 승인

사용자는 권장 A안을 승인하고 다음을 명시했다.

```text
결과는 약간의 점수 감점만 진행
→ 감점은 학기 중 알려주지 않음
→ 학기 종료 때 전체 결과를 평가
```

## 3. 정본 해석

- 사건의 실제 결과·부작용·발견은 즉시 세계와 마도서에 남긴다.
- 내부 평가 점수·사건별 감점·예상 등급·장학 임계값은 학기 중 공개하지 않는다.
- 부분 성공·실패는 작은 상한형 감점만 누적한다.
- 한 번의 실패가 학기 평가·장학·전문화·진행을 지배하지 않는다.
- 학기말에는 전체 포트폴리오와 함께 종합 평가한다.
- 내부 원점수는 숨기지만 어떤 사건과 행동이 평가에 반영됐는지는 문장으로 설명한다.
- 회복 콘텐츠는 감점 삭제가 아니라 새 긍정 증거·발견·대체 해법을 제공한다.

## 4. GitHub 반영

- Failure Long-term Impact Grill resolved.
- Hidden Semester Evaluation Approval created.
- Full Game Scope and Ending Grill created.
- Gap Audit advanced to `P2_CLOSED_6 / OPEN_1`.
- Batch State advanced to `6/10`.
- 이 Working Sync Receipt 생성.

## 5. Google Sheet 반영 대상

- `00·01·02·03·04·05·10·12·30·41·50·52·80·90·99`.

검증 항목:

- Decision ID와 승인 옵션.
- 학기 중 비공개 항목.
- 작은 사건별·학기 총감점 상한.
- 즉시 장학 박탈·관계 단절·콘텐츠 폐쇄 없음.
- 학기말 종합 평가와 대표 근거 설명.
- Grill counter `6/10`.
- 다음 Decision `GM-FULL-GAME-SCOPE-ENDING-01`.

## 6. 병합 경계

- Draft PR #36은 병합하지 않는다.
- 기본 병합은 `10/10`이다.
- 조기 Trigger 발생 시 `GM-PREMERGE-ADVERSARIAL-GATE-01`을 먼저 실행한다.
