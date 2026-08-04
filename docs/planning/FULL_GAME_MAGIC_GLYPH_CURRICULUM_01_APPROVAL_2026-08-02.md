# GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01 — 다계열 수강·전문화 승인

## 1. 승인 상태

```yaml
decision_id: GM-FULL-GAME-MAGIC-GLYPH-CURRICULUM-01
status: USER_APPROVED_ACTIVE_WITH_SLICE_INHERITANCE_UPDATE
approved_option: B_MULTI_SCHOOL_ENROLLMENT_SPECIALIZATION_TREE
approved_at: 2026-08-02T17:19+09:00
slice_inheritance_updated_at: 2026-08-04T08:15+09:00
slice_update_decision: GM-SLICE-HEAT-FLOW-OBSERVATION-01
parent_decision: GM-FULL-GAME-CHAPTER-RHYTHM-01
gate: FULL-GAME-STRUCTURE-01
implementation: NOT_STARTED
codex: DEFERRED
```

## 2. 승인된 전체 방향

전체 게임은 복수의 메인 마법 계열을 수강하고, 계열별 성장과 활용 기록을 쌓아 전문화하는 학교 RPG 구조를 사용한다.

```text
공통 문법·기초 계열 체험
→ 복수 메인 계열 수강 선택
→ 계열별 이해·숙련·현장 활용·인증
→ 일부 계열 심화
→ 전문화·연구 방향 선택
→ 선택 계열에 따른 해법·관계·기록 차이
```

전문화는 속성 피해량만 높이는 트리가 아니라 다음을 심화한다.

- 어떤 대상과 현상을 다룰 수 있는가.
- 어떤 위험과 안전 규칙을 감수하는가.
- 어떤 상황에서 더 정밀하거나 책임 있는 해법을 제시하는가.
- 어떤 교수·동료·연구·마도서 기록과 연결되는가.

## 3. Vertical Slice 계승 — GM-SLICE-HEAT-FLOW-OBSERVATION-01 반영

이 절은 2026-08-04 승인된 `GM-SLICE-HEAT-FLOW-OBSERVATION-01`에 따라 갱신됐다.

```yaml
first_representative_main_glyph: HEAT
first_reusable_connection_grammar: FLOW
first_optional_support_grammar:
  - FOCUS
  - DISPERSE
representative_known_circuit: HEAT_PLUS_FLOW
slice_safe_grammar: MAIN_1_PLUS_CONNECTION_AND_OPTIONAL_SUPPORT
```

- `열`은 Vertical Slice에서 처음 실제 사건에 적용하는 대표 메인 글자다.
- `흐름`은 열을 비롯한 여러 메인 현상에 재사용될 수 있는 첫 연결 문법이다.
- `집중 / 분산`은 출력과 범위를 조절하는 첫 선택 보조 문법이다.
- Slice의 제한된 문법은 입문 단계의 대표 범위이며, 전체 게임의 다계열 구조를 폐기하지 않는다.
- 교수의 `열 + 흐름` 외곽 회로는 한 가지 응용 예시일 뿐이며 유일한 해법·필수 루트·평가 기준이 아니다.
- 플레이어는 같은 글자를 다른 대상·경로·출구·보조·환경 협력에 적용하거나, 사건 목표를 달리하여 복수의 유효 결과를 만들 수 있다.

이전 문장 `흐름은 첫 기초 메인 계열의 대표 사례`는 이 결정으로 명시적으로 대체된다.

## 4. 필수 보호 규칙

1. 미선택 계열이 메인 진행·필수 정보·유일 해법을 봉쇄하지 않는다.
2. 주요 사건은 최소 두 계열 또는 공통 문법 기반의 복수 해법을 제공한다.
3. 계열별 별도 캠페인·맵·적·UI·VFX 전체 세트를 의무 제작하지 않는다.
4. 공통 사건·장소·적·보조 문법을 계열별 결과와 대가로 재해석한다.
5. 반복 시전만으로 계열 레벨과 전문화를 무한 상승시키지 않는다.
6. 초기 계열 선택을 즉시 되돌릴 수 없는 영구 잠금으로 만들지 않는다.
7. 계열 수 증가와 주문 글자 수 증가를 동시에 무제한 허용하지 않는다.
8. 특정 계열이 대부분 상황의 상위 호환 정답이 되면 재설계한다.
9. 교수·NPC가 보여준 예시 주문을 기준 답안으로 사용하지 않는다.
10. 준비된 대표 패턴 밖의 합리적 주문도 의미·상황·대가 판정으로 허용한다.

## 5. 유지되는 장기 후보와 미확정 값

유지되는 방향:

- 현상·물질·개념 중심 메인 계열.
- 계열별 독립 성장.
- 기초 체험 후 선택 계열 심화.
- 전문 연구·졸업 연구.
- 공통 연결·보조 문법과 계열 친화 보조의 결합.

미확정 `TEST_VALUE`:

- 본편 메인 계열 총수.
- 한 시점에 수강 가능한 계열 수.
- 학년·학기 범위.
- 계열 레벨 단계와 상한.
- 전문화 진입 시점.
- 보조 글자 안전 운용량.
- 계열별 고유 교수·장소·VFX 제작량.

구형 `3학년 / Lv.0~5 / Lv.4 전문화 / 보조 2·4·6`은 참고 기본값이며 이 승인만으로 최종 수치가 되지 않는다.

## 6. 적대적 판정

```yaml
school_rpg_fantasy: STRENGTHENED
replay_and_identity: STRENGTHENED
solo_scope_risk: HIGH_REQUIRES_BOUNDING
mobile_writing_fatigue_risk: HIGH_REQUIRES_VALIDATION
optimal_build_risk: OPEN
parallel_content_waste_risk: OPEN
faculty_example_becoming_answer_key: PROHIBITED
```

## 7. 후속 결정

`GM-FULL-GAME-GROWTH-CHOICE-COST-01 — 계열 성장축·수강 선택 비용·전문화 잠금 규칙`
