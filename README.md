# GRIMOIRE: 세계를 다시 쓰는 법

마법 글자의 의미를 배우고 직접 주문을 설계해 상황의 규칙을 바꾸는 마법학교 성장 RPG입니다.

## 프로젝트 상태

| 항목 | 현재 기준 |
|---|---|
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| 현행 Slice | `서리꽃 온실의 심장 / SINGLE_INCIDENT_SPIRAL` |
| 주문 회로 | `FIVE_POINT_STAR` |
| Spell Workflow | `Task 3~7 MERGED_MAIN_VERIFIED` |
| Task 8 | `LOCAL_ACCEPTANCE_PASS_UNMERGED / PR_PREP_REVERIFY_PENDING` |
| Frostbloom Graybox | `INTERNAL_PACK_PASS` |
| 제품 Runtime | `PARTIAL_FOUNDATION_IMPLEMENTED` |
| Human validation | `NOT_RUN` |
| Device validation | `NOT_RUN` |
| Performance validation | `NOT_RUN` |
| Full Vertical Slice validation | `NOT_RUN` |
| Windows export | `NOT_RUN` |
| Android export/device | `NOT_RUN` |

현재 저장소에는 Godot `4.7.x` 프로젝트와 Star Circuit Runtime POC, Spell Workflow Task 3~7의 병합 구현이 존재합니다. 이는 완성형 제품 Vertical Slice가 끝났다는 뜻이 아닙니다. Task 8 제품 변경은 local acceptance 기록만 있고 `main`에는 아직 병합되지 않았으며, Human/Device/Performance/Export/Full Slice 증거는 계속 `NOT_RUN`입니다.

## 시작 순서

1. `AGENTS.md`
2. `START_HERE.md`
3. `docs/ACTIVE_CONTEXT.md`
4. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
5. `docs/planning/CURRENT_UNRESOLVED_GATES.md`
6. `docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_01_APPROVAL_2026-08-11.md`
7. `docs/planning/WORLD_CHARACTER_THREE_YEAR_STORY_01_APPROVAL_2026-08-11.md`
8. `docs/planning/YEAR_ONE_GROWTH_ECONOMY_TEST_VALUES_01_APPROVAL_2026-08-11.md`
9. `docs/superpowers/specs/2026-08-06-spell-workflow-ui-v2-design.md`
10. `docs/DEVELOPMENT_GATES.md`

## 핵심 제품 약속

```text
상황·문맥 읽기
→ 필요한 의미 판단
→ 글자 획득·작성
→ FIVE_POINT_STAR 회로 설계
→ 주문 Preview·확정
→ 대상 선택·최종 결과 Preview
→ 명시적 사용
→ 불안정도·환경·관계 변화
→ 결과·대가·발견을 마도서에 기록
→ 다음 상황에서 학습 적용
```

플레이어는 정답 주문을 단순 소비하는 대신 자신이 이해한 글자 의미와 문맥으로 해결책을 설계합니다. 학교의 `정식`은 절대 진리가 아니라 검증된 안전 선례이며, 플레이어는 `원문 / 정식 / 문맥 / 개정`의 관계를 배우며 무엇을 바꿀 수 있고 무엇을 바꾸지 말아야 하는지 판단합니다.

## 현행 Vertical Slice — 서리꽃 온실의 심장

현재 데모의 사람 플레이 대상은 여러 학교 이벤트를 짧게 훑는 Campus Montage가 아니라 **하나의 사건을 깊게 파는 `SINGLE_INCIDENT_SPIRAL`**입니다.

```text
서리꽃 온실 사건 진입
→ 상황·문맥 조사
→ 제한된 자유 선택과 준비
→ 글자 획득·작성
→ FIVE_POINT_STAR 주문 설계·사용
→ 첫 실제 상태 개선
→ 과거 개정 흔적 발견
→ 새 문맥에서 두 번째 주요 판단·주문
→ 시설·생명·정령·관계·발견 결과
→ 귀환·마도서 복기
```

핵심 계약:

- 실제 플레이 목표 `46분`, 콘텐츠 재작업 기준 `53분`, 하드 상한 `60분`.
- 직접 작성 성공 `7회`, 안내형 복구 포함 상한 `10회`.
- 조사 노드 `4개 중 2개 선택`; 모든 조합이 합리적 완료를 허용해야 함.
- 대표 자유일정 창은 `1개`; 네 선택이 특정 정답 하나로 수렴하지 않도록 한다.
- 주요 FIVE_POINT_STAR Commit 최소 `2회`.
- 첫 주요 해결은 실제 상태를 개선하며, 이후 옛 개정 기록이 발견되어도 그 선택을 가짜 선택으로 되돌리지 않는다.
- 강한 정령/압력 Encounter `1개`; mob wave·HP sponge를 기본 구조로 사용하지 않는다.
- 결과 축: `시설 / 생명 / 정령 / 관계 / 발견`.
- 학교축제와 장기 커리큘럼은 이 46분 Slice 안에서 플레이하지 않고 장기 제품의 `PREVIEW_ONLY`로 취급한다.

1학년 전체는 별도로 7 Chapter `2 / 2 / 3` 구조를 유지하며, `서리꽃 온실의 심장`은 Chapter 6의 확장 사건과 Internal Slice의 압축 검증판을 구분합니다.

## 주문 언어·회로

현행 주문 설계는 단순 `흐름 / 집중 / 분산` 3종만을 정본으로 사용하지 않습니다.

### Main Glyph 5종

- `HEAT` — 열 발생·전달
- `FLOW` — 에너지·물질의 이동과 방향 전환
- `PROTECT` — 보호막·피해 완화
- `COOL` — 열 제거·과열 진정
- `MEND` — 균열·파손·구조 손상 회복

### Auxiliary Glyph 5종

- `FOCUS` — 범위를 좁히고 정밀도·성공률 보정
- `DISPERSE` — 범위를 넓히고 국소 강도 완화
- `STABILIZE` — 실패 편차·역류 위험 감소
- `SUSTAIN` — 지속시간 증가와 추가 비용
- `AMPLIFY` — 출력 증가와 마나·위험 증가

회로는 중앙 Main 정확히 `1` + 외곽 Auxiliary `0~5`의 `FIVE_POINT_STAR`를 사용합니다. Historical `3×3` 회로는 provenance이며 현행 신규 설계 권위가 아닙니다.

## Spell Workflow 구현 경계

```text
글자 그리기
→ 회로 배치
→ 주문 사용
```

현재 `main`에 병합된 범위:

- Task 3 / PR #104 — immutable `PreparedSpell` + exactly-once inventory
- Task 4 / PR #105 — Stage 2 atomic glyph preparation
- Task 5 / PR #106 — Stage 3 target/use atomic transaction
- Task 6 / PR #108 — glyph drawing workflow screen
- Task 7 / PR #110 — circuit placement workflow screen

Task 8 Spell Use Screen은 기존 Task 5 Stage 3 권위를 소비하는 UI이며 새 target/use/Mana/result authority를 만들지 않습니다. 과거 local acceptance 증거는 병합 완료 증거가 아니며 현재 remote `main`에는 Task 8 제품 PR이 존재하지 않습니다.

## 전투·상황 해결

```text
강한 적 또는 불안정한 현상
→ 공격/위험 Timer 아래 상황 판단·글자 작성
→ 주문 설계·최종 결과 Preview
→ 명시적 주문 사용
→ 불안정도·환경 변화
→ 진정·해결 또는 다음 압박
```

- 기본 목표는 HP 0 처치가 아니라 `불안정도 0 → 진정·해결`.
- 판단·작성 중 Timer는 진행하지만 시스템 해결·연출 중에는 멈춘다.
- 플레이어 HP 0 또는 선언된 치명적 환경 붕괴는 패배가 될 수 있다.
- 환경 보존도·부작용·남은 상태·해결 방식이 결과 품질을 바꾼다.
- 수호 소환수는 다음 공격 피해를 완화하지만 Timer·작성·판단을 대행하지 않는다.

## 마도서

마도서는 자동 주문 Stock이나 정답 목록이 아닙니다.

```text
관찰·가설
→ 사용한 글자와 회로
→ 대상·문맥
→ 결과
→ 부작용·대가
→ 새 발견
```

을 남기는 학습 기록이며, 이후 사건에서 플레이어가 과거 경험을 근거로 더 나은 결정을 내리게 하는 Meta Loop의 핵심입니다.

## 세계·3년 성장

세계는 `원문 / 정식 / 문맥 / 개정`의 네 층으로 이해합니다.

- 1학년 질문: **정답은 왜 맞는가?**
- 2학년 질문: **누가 세계를 바꿀 권리가 있는가?**
- 3학년 질문: **무엇을 바꾸지 않을 책임이 있는가?**

1학년 계열은 `유동학(FLOW) / 변성학(HEAT) / 결계학(PROTECT)`이며 `FOCUS / DISPERSE`는 공통 조율 문법입니다.

## Art Bible

- Soft Storybook 배경 + 선명한 Anime Cel 캐릭터.
- Navy/Gold UI + 고대비 Blue Glyph.
- 고정 3/4 Field, 같은 장소 Half-body Dialogue, 별도 Battle, Result 후 Field 복귀.
- 고정 주인공 1명, 전투 상시 초상 1개.
- 동반 정령·수호 소환수 상태 배지.
- 우측 Writing Panel은 축소 Rail에서 작성 시 확장.
- Grimoire 파생 화면을 Main보다 먼저 설계한다.
- AI-generated look을 줄이고 스타일 일관성·가독성·세계관/핵심 시스템 적합성을 우선한다.

잠긴 기준 이미지 SHA-256:

`b55ce1dec6c2521668602d1ce6547526e7f40b8c7c9b6f5276d9289a67f14f7a`

기존 승인·잠금 Visual의 원본은 별도 승인 없이 수정·재생성하지 않습니다.

## 현재 구현·검증 원칙

- 새 시스템·핵심 규칙·콘텐츠 구조·UX 흐름은 결정 관련 벤치마킹 후 설계한다.
- 제품 코드·Scene·Resource는 승인된 authoring 경계를 따른다.
- 시스템-only PoC/자동 테스트를 Human/Player Experience PASS로 승격하지 않는다.
- Human/Device/Performance/Full Slice 검증을 실제로 실행하기 전까지 `NOT_RUN`을 유지한다.
- Task 8 제품 구현과 Frostbloom Runtime은 기존 권위를 재사용하며 중복 transaction/Mana/result/save 시스템을 만들지 않는다.

## 다음 제품 경로

```text
Task 8 PR-prep fresh revalidation
→ Task 8 exact-head PR / CI / merge / merged-main readback
→ Task 9 responsive/mobile landscape acceptance
→ Frostbloom release-near Vertical Slice runtime integration
→ 실제 후보 UI/아트/애니메이션/VFX/음악/SFX 연결
→ Human usability + Player experience evidence
→ Windows/Android delivery validation
```

기획 단계에서는 위 구현 경로를 실행 완료로 간주하지 않습니다.
