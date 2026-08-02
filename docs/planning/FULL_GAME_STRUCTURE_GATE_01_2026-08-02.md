# GM-FULL-GAME-PLANNING-ORDER-01 — 전체 게임 구조 우선 Gate

## 1. 상태

```yaml
decision_id: GM-FULL-GAME-PLANNING-ORDER-01
status: USER_APPROVED_ACTIVE
approved_at: 2026-08-02T15:48+09:00
approval_basis: 사용자 지적 "게임 기획을 먼저 짜야 하는 것 아닌가"와 후속 "좋아 진행하자"
current_design_gate: FULL-GAME-STRUCTURE-01
mobile_foundation_status: IN_PROGRESS_PAUSED_AT_UPSTREAM_DESIGN_DEPENDENCY
previous_next_work: Smartphone Landscape Writing/Battle Wireframe
new_next_work: GRIMOIRE 전체 게임 구조 및 핵심 루프 설계
grill_me_counter_effect: NO_COUNT_PROGRESS_AND_SEQUENCE_APPROVAL
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

기존 `planning_complete: true`는 다음처럼 해석을 교정한다.

```text
VERTICAL_SLICE_CONTENT_PLANNING_COMPLETE = true
FULL_GAME_STRUCTURE_PLANNING_COMPLETE = false
```

기존 Slice 승인을 폐기하거나 재질문하지 않는다. 다만 전체 게임 구조와 충돌할 경우 새 Decision ID로 영향과 대안을 분리한다.

## 4. FULL-GAME-STRUCTURE-01 완료 조건

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

## 5. 현재 금지

- 전체 게임 루프 없이 화면 구조를 최종 확정.
- Slice의 임시 태그를 본편 성장 경제로 자동 확대.
- 관계 수치·화폐·스킬 트리·글자 희귀도를 근거 없이 추가.
- 콘텐츠 반복성을 무작위 생성이나 반복 파밍으로 대신 해결.
- 기존 `PLANNING_COMPLETE` 문구를 전체 게임 완료 증거로 사용.
- Godot 제품 구현·Codex Build.

## 6. 첫 결정 질문

책임 문서:

`docs/planning/FULL_GAME_STRUCTURE_01_GRILL_ME_2026-08-02.md`

질문은 전체 게임의 가장 큰 반복 단위를 무엇으로 잡을지다. 이 결정이 승인되면 첫 Grill Me 승인 Decision으로 카운터가 `1/10`이 된다.
