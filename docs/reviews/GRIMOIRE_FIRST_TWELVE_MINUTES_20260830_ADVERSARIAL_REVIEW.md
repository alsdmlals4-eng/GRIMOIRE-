# GRIMOIRE 첫 12분 설계 — 적대적 검토 기록

> 검토 상태: `PLAN_REVIEW_COMPLETE__IMPLEMENTATION_NOT_STARTED`  
> 대상: `docs/superpowers/specs/2026-08-30-first-twelve-minutes-admission-class-practicum-design.md`  
> 기준: 현재 `main` local checkout, 2026-08-30 live GitHub PR readback, current GRIMOIRE authority  
> 범위: 입학식 → 첫 수업 → 첫 지도 실습 설계. 코드·이미지·scene의 구현 품질 PASS가 아니다.

## 검토 mode·전체 개선 loop와 실패 가정

각 loop는 사용자 의도, 정본/실제 구현, W6 호환성, 이미지·UI·입력, 거래 안전성, 장기 확장성, 검증 한계를 모두 다시 공격했다. `NOT_RUN` 런타임·사람·기기 검증을 PASS로 쓰지 않는다.

| Loop | 실패 가정과 attack | validate-critique | 최소 보정 | 회귀/대안/장기 적합성 재검사 | 판정 |
| --- | --- | --- | --- | --- | --- |
| 1 | 온실 실습이 W6 사건을 덮어쓰고 현재 Product Root를 무심코 확장한다. | 현재 root의 `HEAT` bootstrap/W6 context와 첫 10분 `FLOW` 문법은 서로 다르다. 발생 시 core·test drift가 크다. | 첫 실습 별도 context, W6 retain 경계와 W6 회귀 수용 기준을 명시했다. | 새 context와 shared core가 W6 전면 교체보다 장기적으로 안전하다. | `MUST_FIX_APPLIED` |
| 2 | 90–120초 입학식이 긴 컷신·관계 선택으로 변해 첫 직접 입력을 늦춘다. | 첫 5분 내 직접 `FLOW` 입력이라는 수용 기준과 충돌한다. | 단일 진행 행동, 영구 선택/글자 자동 지급 금지, 90–120초 상한을 명시했다. | 입학식을 완전히 생략하는 대안은 세계관 진입 가치가 낮고, 장기 프로필 선택은 아직 범위 밖이다. | `MUST_FIX_APPLIED` |
| 3 | `FOCUS`/`DISPERSE`가 말만 다른 정답/오답이 되거나, 대상·Commit이 Preview 이전에 자동으로 일어난다. | 현재 프로젝트 core의 대상 순서·명시 Commit 규칙과 직접 충돌한다. | 두 보조 글자의 이득과 남는 대가, 보조 없음의 유효성, 순서·단일 transaction 테스트를 명시했다. | 완전 자유 조합은 첫 12분 인지 부담이 크고, 하나만 허용하면 선택 학습이 사라진다. | `MUST_FIX_APPLIED` |
| 4 | "이미지 먼저"가 승인 전 후보를 scene에 꽂거나, 배경이 터치/클릭을 막고 빈 장식 프레임을 되살린다. | asset lifecycle과 사용자 UI 요청에 반한다. Godot의 draw order가 입력 순서를 보장하지 않는다. | 일괄 후보→검토→승인→정본 등록→scene 연결 순서와 `MOUSE_FILTER_IGNORE`/hit area 검사 기준을 명시했다. | 텍스트만으로 먼저 조립하는 대안은 사용자가 명시적으로 거절했으며, 후보 선연결은 provenance/evidence를 손상한다. | `MUST_FIX_APPLIED` |
| 5 | 첫 12분 전용 root가 W6 workflow를 복사하거나, 반대로 W6 root에 모든 콘텐츠가 누적되어 장기 확장이 막힌다. | 두 방향 모두 유지보수와 회귀 리스크가 높다. | 세 가지 구현 대안을 비교해 FirstSession shell + shared core + session context를 채택하고, main 전환 조건을 보정했다. | 채택안은 수업·실습·전투·축제의 후속 context를 수용하면서 거래 core는 하나로 유지한다. | `MUST_FIX_APPLIED` |

## 기준 Branch·Commit·Decision·정본·실제 diff

- 작업 branch: `main`; workspace에는 기존 사용자/이전 작업의 dirty 변경이 존재한다. 이 설계·검토 파일은 아직 commit/push하지 않았다.
- current product authority: `AGENTS.md`, `START_HERE.md`, `docs/ACTIVE_CONTEXT.md`, active v4.8 binding.
- protected runtime baseline: W6 decision-loop merge `713bfbfc4c16b9ea469f2aa2c313a72bc50e1b67` / PR #245.
- first-session source boundary: `docs/planning/GRIMOIRE_HUMAN_GAME_BLUEPRINT_20260830.md`의 "수업 → 지도 실습" 흐름과 최신 사용자 지시. PDF는 예시 자료로만 취급했다.
- live PR readback: PR #190과 PR #245는 `MERGED`; PR #187은 Task8 spell-use recovery의 `OPEN` 중복/역사적 continuation으로 read-only다. 이 설계는 PR #187을 수정하거나 대체하지 않는다.

## 최소 3개 실질 대안·벤치마크·trade study

상세 비교는 대상 설계의 §6.0에 반영했다.

1. W6 Product Root 직접 확장 — 빠르지만 context와 test 의미가 섞여 기각.
2. 첫 세션 workflow 전체 복제 — 격리는 쉬워도 core 거래 규칙이 복제되어 기각.
3. FirstSession shell + shared core + session context — 가장 작은 공통분모만 재사용하여 채택.

벤치마크는 특정 외부 게임을 복사하는 방식이 아니라, 현재 프로젝트의 core transaction, 5분 내 첫 직접 입력, W6 회귀 독립성, 승인 전 이미지 미연결이라는 내부 수용 기준이다.

## 열린·최근 병합 PR·중복 작업 비교

| 항목 | live 상태 | 본 설계의 처분 |
| --- | --- | --- |
| PR #187 `feat(task8): recover spell use screen` | `OPEN`, main 대상 | read-only. 새 first-session scene은 이 PR의 branch/변경을 소비하지 않는다. |
| PR #190 Task8 reconcile | `MERGED` | 역사적/현재 main provenance로만 보존. |
| PR #245 W6 decision loop | `MERGED` | 회귀 보호 baseline. |

## Notion/GitHub 동기화 비교

프로젝트 정책상 Notion은 historical discovery-only이며 routine read/write 대상이 아니다. 이번 설계의 정본은 repository Markdown이고, Notion destination readback은 적용하지 않았다. 이는 `NOTION_NOT_APPLICABLE_BY_CURRENT_REPOSITORY_ONLY_POLICY`다.

## 저장소 감사 범위·권한 지도·미검증 범위

확인한 범위는 current entry/root, reusable spell workflow screens/core, W6 target context, 현재 visual coverage/rights records, first-10-minute and human blueprint planning owners, active contract 및 live PR 상태다. 저장소 전체 tracked inventory 감사나 Godot runtime 실행은 수행하지 않았다. 따라서 전체 저장소 clean, runtime PASS, 사람/기기/성능/접근성 PASS는 주장하지 않는다.

## stale·중복·고아·untouched 소비자·파생본 Finding

| ID | 분류 | finding | 판정 | 처리 |
| --- | --- | --- | --- | --- |
| FTM-01 | `CONFLICT` | 첫 10분 `FLOW` 계획을 W6 `HEAT` Product Root에 합치면 content meaning과 regression owner가 충돌한다. | `MUST_FIX` | 설계 §3·§6에서 first context 분리와 W6 retain을 반영. |
| FTM-02 | `OMISSION` | 수업/실습/입학식 내용을 새 root에 단순 누적하면 장기 scene ownership이 불명확하다. | `MUST_FIX` | §6.0 대안 비교와 FirstSession shell/main 전환 gate 추가. |
| FTM-03 | `COMPLEMENT_GAP` | 이미지 후보의 실제 consumer와 승인 전 연결 금지가 없으면 빈 화면 또는 asset provenance drift가 생긴다. | `MUST_FIX` | §7의 4개 candidate, consumer, lifecycle, §10 수용 기준 반영. |
| FTM-04 | `COMPLEMENT_GAP` | 앱 중단 후 첫 세션 진행이 저장된 것처럼 보일 수 있다. | `SHOULD_FIX` | 명시적 restart behavior와 저장 연결 보류를 §6.3에 반영. |
| FTM-05 | `DUPLICATE_WORK` | PR #187은 유사한 spell-use 범위를 이미 열어 두고 있다. | `ALLOWED_LEGACY` | live open PR을 건드리지 않고, future implementation worktree에서 current main을 기준으로 진행. |

## REJECTED_CRITIQUE / BLOCKED_UNVERIFIED / ALLOWED_LEGACY

| 구분 | 내용 | 근거/재개 조건 |
| --- | --- | --- |
| `REJECTED_CRITIQUE` | 입학식에 즉시 영구 기숙사/관계/성향 선택을 넣어야 한다. | 현재 사용자 방향과 5분 내 첫 입력 기준에 비해 스코프 팽창이 크다. |
| `REJECTED_CRITIQUE` | 첫 실습은 W6와 같은 `HEAT` 및 동일 resource를 써야 한다. | `FLOW` 중심 첫 수업 계획과 W6 독립 회귀 기준에 반한다. |
| `BLOCKED_UNVERIFIED` | GRIMOIRE live Godot editor에서 실제 touch/hit area와 장면 전환이 작동한다. | 현재 연결된 live editor는 다른 프로젝트이며 GRIMOIRE 실행 증거가 없다. 구현 후 올바른 editor/headless session에서 확인한다. |
| `BLOCKED_UNVERIFIED` | 생성 후보가 실제 기기에서 가독성/성능/저감 모션 요구를 충족한다. | 이미지와 runtime consumer가 아직 없다. candidate batch와 구현 뒤 실제 기기 검증이 필요하다. |
| `ALLOWED_LEGACY` | W6 Frostbloom의 현재 `HEAT` bootstrap과 context/test 명칭. | 현재 merge baseline이며 첫 12분의 `FLOW` 설계와 병존해야 한다. |

## REMAINING_WORK_RECALCULATION_REQUIRED 결과

현재 승인 범위에서 남은 actionable work는 6개다.

1. 이 설계의 사용자 검토.
2. implementation plan 작성.
3. isolated worktree와 current-main fresh read.
4. 런타임 후보 이미지 4종을 한 묶음으로 생성·QA·사용자 승인.
5. TDD 기반 scene/data/adapter 구현과 W6 회귀 검증.
6. GRIMOIRE runtime, 사람/기기/성능/접근성 evidence gate 실행.

그러므로 `COMPLETION_CANDIDATE`가 아니며, `POST_COMPLETION_ADVERSARIAL_REVIEW_REQUIRED`와 `CLEAN_REVIEW_EXIT`는 구현 완료 시점의 후속 gate다.

## 실제 반영한 최소 변경과 회차별 verification

- 반영: 첫 12분 설계 문서에 W6 분리, 선택 trade-off, candidate lifecycle, 입력 안전성, TDD criteria, 세 접근 비교, restart behavior를 기록했다.
- 정적 검증: `git diff --check` 통과, 필수 흐름 token/문서 존재 검사 통과.
- 미실행: Godot scene load, GUT, runtime, device, accessibility, performance, export. 모두 `NOT_RUN`이다.

## BETTER_ALTERNATIVE_SEARCH 결과

세 접근 중 채택안 C가 현재의 W6 stable baseline을 보존하면서도 새 입학식·수업·실습을 하나의 시작 경험으로 제공하는 유일한 방식이었다. 더 작은 "입학식 오버레이만 W6 root에 붙이는" 안은 초기 파일 수는 적지만 첫 수업의 `FLOW`와 W6의 `HEAT`가 즉시 충돌하므로 더 강한 대안이 아니다.

## LONG_TERM_PLAN_FIT_RECHECK 결과

채택 구조는 후속 수업·실습·전투·축제 각각을 context/scene으로 늘릴 수 있고, `글자 → 주문 → 대상 → 시전` core는 하나로 유지한다. 전투/축제를 이번 first-session slice에 억지로 포함하지 않으므로 12분 teaching cadence와 실제 차후 소비처 사이의 경계도 유지한다.

## 보호한 코어·고유 정보·장점·범위

- `FIVE_POINT_STAR`, Preview 뒤 대상, 명시적 단일 Commit, 소비 전 취소 가능이라는 core.
- 플레이어 표면 용어 `글자 → 주문 → 대상 → 시전`.
- 사용자가 고친 직접 필기 마법, 빈 장식 frame 제거, 이미지 먼저 검토하는 방향.
- W6 merge baseline과 open PR #187의 read-only 경계.

## reference freshness·정적·런타임·회귀 재검사

설계 입력은 이번 turn에 fresh-read한 current authority와 live PR readback에 기반한다. `git diff --check` 및 문서 존재/필수 keyword 검사는 통과했다. 저장소 전체 freshness, runtime, GUT, screenshot, human/device/performance/accessibility는 아직 실행되지 않아 `NOT_RUN`이다.

## branch cleanup 상태

현재는 `main`의 dirty workspace이며 새 branch/worktree를 만들지 않았다. 기존 변경을 보존한다. 구현 단계가 승인되면 별도의 isolated worktree를 사용하며, existing open PR branch를 clean/rebase/modify하지 않는다.

## 최종 판정·남은 위험·다음 조건

`PLAN_REVIEW_COMPLETE__USER_SPEC_REVIEW_REQUIRED`.

5회의 전체 설계 개선 loop에서 확인된 `MUST_FIX`는 문서에 최소 보정으로 반영했고, 새 수용 기준 충돌은 남지 않았다. 다만 이것은 계획 문서에 대한 clean review일 뿐, 구현·asset·runtime·human verification 완료가 아니다. 다음 조건은 사용자가 본 설계를 검토하여 "입학식 → FLOW 수업 → 작은 온실 지도 실습"의 시간 배분과 `FOCUS`/`DISPERSE` trade-off를 확정하는 것이다.
