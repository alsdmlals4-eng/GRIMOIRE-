# 스펠 Active Context

## 현재 상태

- 프로젝트명: `스펠` (임시)
- 저장소: `https://github.com/alsdmlals4-eng/Spell`
- 기준 브랜치: `gpt/planning-spell-20260725`
- 기준 날짜: 2026-07-27
- 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`
- Vertical Slice 계약: `APPROVED_AT_GATE_1_WITH_P0_AMENDMENT`
- 적대적 검토 루프 01: `PASS_WITH_FOLLOWUP`
- 적대적 검토 루프 02: `PASS_WITH_CORRECTIONS`
- 시각 표현: `LANDSCAPE_HYBRID_2D_WITH_SEPARATE_TACTICAL_BATTLE_CONFIRMED`
- 캐릭터 표현: `SD_FIELD_HALF_BODY_DIALOGUE_CONFIRMED`
- 메인 소환수 성장: `FOUR_STAGE_FORM_SELECTION_AND_LONG_TERM_RIDING_CONFIRMED_DIRECTION`
- 구현: `NOT_STARTED`
- Codex: `NOT_RUN`
- 이미지·사운드 대량 제작: `NOT_STARTED`
- CORE_POC: `REMOVED_BY_USER_DECISION`
- PR 병합: `NOT_APPROVED`
- 다음 차단 결정: `ART-STYLE-01`

Gate 1과 현재 시각·캐릭터·소환수 방향의 승인은 제품 콘셉트와 프리프로덕션 기준을 확정한다. 실행 프로필 전환, Codex, Godot 구현, 런타임 검증과 PR 병합은 별도 승인 대상이다.

---

## 질문 전 필수 복원 순서

```text
START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG.md와 최신 Addendum
→ 질문 주제의 단일 책임 원본
```

이미 `CONFIRMED`, `APPROVED`, `CORE_CONFIRMED`, `SUPERSEDED`인 결정을 기억 확인 목적으로 다시 선택하게 하지 않는다.

질문 가능 상태:

- `USER_DECISION_REQUIRED`
- `UNRESOLVED`
- `PLAYTEST_TUNING_REQUIRED`
- `ASSET_SPEC_REQUIRED`
- `TECHNICAL_REVIEW_PROPOSAL`
- 사용자 명시적 재개방

---

## 활성 책임 원본

1. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
2. `docs/planning/GATE_1_FINAL_APPROVAL.md`
3. `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`
4. `docs/planning/GATE_2_ADVERSARIAL_REVIEW_LOOP_2026-07-27B.md`
5. `docs/planning/GATE_2_VISUAL_PRESENTATION_SYSTEM.md`
6. `docs/planning/GATE_2_CHARACTER_PRESENTATION_SYSTEM.md`
7. `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md`
8. `docs/planning/GATE_2_SUMMON_GROWTH_AND_FORM_SYSTEM.md`
9. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27S.md`
10. `docs/planning/DECISION_LOG.md`
11. `docs/DEVELOPMENT_GATES.md`
12. `docs/DESIGN_DOCUMENT_REGISTRY.json`
13. `docs/ASSET_LICENSE_LEDGER.md`
14. `skills/SKILL_REGISTRY.json`

기존 세부 문서는 `REFERENCE_CANDIDATE`다. 최신 사용자 지시와 위 책임 원본이 우선한다.

---

## 승인된 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.

## 승인된 최상위 경험

> 마법 글자의 의미를 이해하고 상황에 맞는 주문을 설계해 발견하는 지적 마법 판타지.

우선순위:

1. 조합하고 발견하는 지적 재미
2. 직접 쓰는 마법의 손맛
3. 숙련하고 자동화하는 성장감

---

## 승인된 Vertical Slice

```text
프롤로그·학교 도착
→ 첫 수업·교내 연습
→ 자유일정 A
→ 첫 실기시험
→ 자유일정 B
→ 학교축제
→ 자유일정 C
→ 첫 현장실습
→ 귀환·마도서 기록
→ 다음 학기 예고
```

- 첫 완주 목표 `45~50분`, 상한 `60분`
- 공통 `Situation Challenge`
- 자유일정 `휴식 / 준비 / 교류`
- 세션 경계 중심 최소 저장
- M0→M1→M2→M3→M4는 Slice 내부 체크포인트

---

## 승인된 화면·캐릭터·전투 표현

```text
학교·자유일정·비전투 탐색
= 가로형 고정·장면 기반 3/4 필드
= 3.5~4등신 SD 캐릭터

대화
= 기존 장소 배경 위 반신 일러스트

전투
= 별도 고정 3/4 전술 전투장
= 필드와 동일한 SD 비율·기본 골격 재사용

마법 작성
= 현재 화면 감속·암전 + 전용 작성 오버레이

전투 종료
= 결과를 반영한 원래 필드 장면으로 복귀
```

기존 `같은 필드 화면에서 전투` 결정은 최신 사용자 승인으로 대체됐다.

시각 우선순위:

```text
글자 궤적
→ 주문 대상
→ 위험 경고
→ 세계 변화 인과
→ 캐릭터·소환수
→ 장식·입자
```

---

## 승인된 2계층 소환수

```text
메인 동반 소환수
= 항상 같은 개체가 동행
= 학습·관계·일상·현장·기록

전투 보조 소환수
= 위험·전투에서 호출
= 작성 시간을 확보하는 전술 지원
```

공통 금지:

- 글자·회로 작성 대행
- 메인·보조 글자 자동 선택
- 자동 주문 설계·정답 제시
- 소환수만으로 전투 자동 해결

### 메인 동반 소환수

- 원소·정령 중심
- 동물 형상은 가능하지만 전체 체계를 동물형으로 고정하지 않음
- 대표 방향은 신비한 정령수 계열, 늑대형 레퍼런스가 유력
- 장기 4단계 성장
- 성장 단계별 크기·실루엣·원소 표현 변화
- 해금한 현재 단계 이하의 이전 형상 선택 가능
- 실제 성장 단계와 표시 형상 분리
- 장기 탑승 기능
- Vertical Slice는 초기 형상 1개만 필수
- 2~4단계 런타임·형상 선택 UI·탑승은 Slice 제외

### 전투 보조 소환수

확정:

- 원소·정령 중심 시각 언어
- 역할 우선 실루엣
- Vertical Slice는 수호 또는 견제 1체

미확정:

- 4역할 전체 체계
- 성장 단계·이전 형상 선택·탑승
- 획득·편성·재화 구조

---

## 이미지 작업 규칙

- 이미지 관련 선택은 가능한 경우 예상 인게임 이미지로 제시
- 생성 이미지는 자동 최종 자산·시스템 확정이 아님
- 사용자 승인 두 번째 인게임 구성 이미지는 `USER_APPROVED_VISUAL_REFERENCE`
- 이미지 생성 실패 시 동일 요청 재입력을 기본 해결책으로 사용하지 않음
- 기존 브리프를 유지하고 한글 장문·UI 복잡도·한 장의 요소 수를 줄여 재시도

상태:

```text
CONCEPT_EXPLORATION
VISUAL_REFERENCE_CANDIDATE
USER_APPROVED_VISUAL_REFERENCE
ART_BIBLE_APPROVED
RUNTIME_ASSET_APPROVED
```

---

## 적대적 검토 루프 02 결과

최종 판정: `PASS_WITH_CORRECTIONS`

수정 완료:

- 승인 결정을 다시 묻는 정본 누락 보완
- 현재 확정 결정 스냅샷 신설
- 같은 화면 전투를 별도 전술 전투장으로 교체
- 필드·전투 SD 재사용 규칙 확정
- 메인 소환수 성장 단계와 표시 형상 분리
- 탑승을 장기 방향으로 유지하되 Slice 제외
- 전투 소환수 4역할 과잉 확정 방지
- 이미지 생성 실패 처리 규칙 추가

코어·Vertical Slice 세션·완주 상한은 변경하지 않았다.

---

## 현재 보호 결정

- 승인된 코어를 증거 없이 재개방하지 않음
- 복수 메인 글자 결합 금지
- 신규·미숙·중요 글자는 직접 작성
- 입력 실패와 설계 실패 분리
- 필수 정보는 선택형 대화나 자유일정에만 숨기지 않음
- 중요 일정 사이 자유일정 1회
- 휴식은 손해 전용 선택이 아님
- 세션별 전용 미니게임·프레임워크 금지
- 첫 완주 상한 60분
- 필드 SD + 대화 반신 + 별도 고정 3/4 전투장
- 메인 소환수 장기 성장 약속이 초기 Slice를 팽창시키지 않음
- Art Bible·Asset Specification 전 대량 자산 제작 금지
- 실행 프로필 전환 전 Codex·Godot 구현 금지
- 사용자 승인 없는 PR 병합 금지

---

## 다음 작업

`ART-STYLE-01`

동일한 인게임 구성으로 그림체 후보를 이미지 비교한다.

- 학교 필드 SD
- 대화 반신
- 별도 3/4 전술 전투장
- 메인 원소 정령수 초기 형상
- 수호 또는 견제 전투 보조 소환수
- 마법 작성 오버레이

그림체 확정 후:

```text
ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 승인된 자산 제작
→ GM-VS-PROFILE-01 재검토
```
