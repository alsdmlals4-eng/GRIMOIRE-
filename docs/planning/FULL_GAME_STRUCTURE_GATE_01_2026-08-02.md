# GM-FULL-GAME-PLANNING-ORDER-01 — 전체 게임 구조 우선 Gate

## 1. 상태

```yaml
decision_id: GM-FULL-GAME-PLANNING-ORDER-01
status: USER_APPROVED_ACTIVE
approved_at: 2026-08-02T15:48+09:00
current_design_gate: FULL-GAME-STRUCTURE-01
macro_loop_decision: GM-FULL-GAME-MACRO-LOOP-01
macro_loop_status: USER_APPROVED_ACTIVE
macro_loop_option: A_ACADEMIC_SPIRAL_WITH_OPTIONAL_FIELD_PRACTICUM
current_grill_me: GM-FULL-GAME-CHAPTER-RHYTHM-01
mobile_foundation_status: IN_PROGRESS_PAUSED_AT_UPSTREAM_DESIGN_DEPENDENCY
grill_me_counter: 1_of_10
implementation: NOT_STARTED
codex: BLOCKED
```

## 2. 결정

Mobile Wireframe과 화면별 상세 규격보다 먼저 전체 게임의 반복 가능한 구조를 확정한다.

```text
전체 게임의 핵심 재미와 플레이 약속
→ Macro·Chapter·Session Core Loop
→ 마법 학습·성장·관계·보상·경제 연결
→ 콘텐츠·학기·사건 확장 구조
→ 실패·복구·평가·장기 목표
→ Vertical Slice가 전체 게임을 대표하는지 재검증
→ Mobile UX Flow
→ Writing/Battle Wireframe
→ Android/iOS·Store·최소 기기·성능 Decision
→ MOBILE-FOUNDATION-01 통합 승인
```

화면은 미확정 게임 규칙을 대신 결정하지 않는다. Wireframe은 확정된 플레이어 행동·정보·선택·보상·실패를 표현하는 후속 산출물이다.

## 3. 기존 승인과 관계

다음 승인은 유지한다.

- 직접 글자를 쓰고 의미를 조합해 상황의 규칙을 바꾸는 코어.
- `흐름 / 집중 / 분산` Vertical Slice 문법.
- 수업→자유일정→시험→축제→현장실습→귀환 기록 흐름.
- 상황 해결형 전투와 불안정도·환경 결과.
- Mobile 우선·Landscape 고정·Smartphone 정식 Gate.
- Art Style·Art Bible·Asset Spec의 Vertical Slice 제작 상한.

기존 `planning_complete: true`는 다음처럼 해석한다.

```text
VERTICAL_SLICE_CONTENT_PLANNING_COMPLETE = true
FULL_GAME_STRUCTURE_PLANNING_COMPLETE = false
```

기존 Slice 승인을 폐기하거나 재질문하지 않는다. 전체 게임 구조와 충돌할 경우 새 Decision ID로 영향과 대안을 분리한다.

## 4. 확정된 첫 전체 게임 구조

`GM-FULL-GAME-MACRO-LOOP-01`에서 A안을 승인했다.

```text
새 마법 원리·상황 질문 학습
→ 자유일정에서 휴식·준비·교류·현장실습 중 선택
→ 시험·행사·훈련에서 통제된 응용
→ 메인 현장 사건에서 복합 적용과 책임 선택
→ 마도서 복기·발견·평가
→ 다음 원리와 더 어려운 상황 개방
```

- 기본 콘텐츠 단위는 `학습 나선 Chapter`.
- 기존 Vertical Slice는 첫 Chapter 검증판.
- 자유일정에서 숲·훈련장·전투 공간의 선택형 현장실습 전투를 허용.
- 선택형 전투는 일정 슬롯 1개를 소비하며 메인 사건·필수정보·무한 파밍을 대체하지 않는다.
- 권위: `docs/planning/FULL_GAME_MACRO_LOOP_01_APPROVAL_2026-08-02.md`.

## 5. FULL-GAME-STRUCTURE-01 완료 조건

다음이 모두 정의되고 사용자 승인을 받아야 한다.

1. 한 문장 핵심 재미와 반복 동력.
2. 순간·세션·챕터·학기 규모의 중첩 Core Loop.
3. 마법 글자 학습·숙련·발견·조합 확장 규칙.
4. 학교생활·관계·현장 사건이 서로 환류하는 구조.
5. 주인공·마도서·동반 정령·보조 소환수 성장축.
6. 보상·자원·소모처·선택 비용과 인플레이션 방지.
7. 성공·부분 성공·실패·재도전·평가의 장기 영향.
8. 콘텐츠 단위와 난이도·새 글자·새 상황의 확장 규칙.
9. 본편 범위와 Solo 제작 경계.
10. Vertical Slice 대표성 재검증.

진척:

- 1·2의 Macro 방향: `PARTIALLY_CLOSED_BY_GM-FULL-GAME-MACRO-LOOP-01`.
- 자유일정 현장실습 방향: `APPROVED_WITH_ECONOMY_AND_RHYTHM_DETAILS_PENDING`.
- 3~10: 계속 설계 필요.

## 6. 현재 금지

- 전체 게임 루프 없이 화면 구조를 최종 확정.
- Slice의 임시 태그를 본편 성장 경제로 자동 확대.
- 관계 수치·화폐·스킬 트리·글자 희귀도를 근거 없이 추가.
- 콘텐츠 반복성을 무작위 생성이나 반복 파밍으로 대신 해결.
- 선택형 현장실습을 무한 전투 파밍으로 확대.
- 기존 `PLANNING_COMPLETE` 문구를 전체 게임 완료 증거로 사용.
- Godot 제품 구현·Codex Build.

## 7. 현재 결정 질문

책임 문서:

`docs/planning/FULL_GAME_CHAPTER_RHYTHM_01_GRILL_ME_2026-08-02.md`

질문은 학습 나선 Chapter의 필수 기능과 순서·형태 변주 규칙이다. 이 결정이 승인되면 Grill Me counter가 `2/10`이 된다.
