# 스펠 기획 결정 추가 기록 — 2026-07-27S

## 문서 상태

- 적대적 검토 ID: `GM-VS-REVIEW-LOOP-02`
- 캐릭터 결정: `GM-CHARACTER-PRESENTATION-01`
- 전투 화면 결정: `GM-BATTLE-PRESENTATION-01`
- 소환수 성장 결정: `GM-SUMMON-GROWTH-01`
- 상태: `PASS_WITH_CORRECTIONS`
- 사용자 지시: 지금까지 작업한 내용을 적대적 검토 루프로 최종 검수하고 GitHub에 반영
- Gate 1: `APPROVED`
- 프로젝트 코어: `CORE_CONFIRMED`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- 구현: `NOT_STARTED`
- Codex: `NOT_RUN`
- 다음 차단 결정: `ART-STYLE-01`

---

## 1. 사용자 승인 결정

### 캐릭터 표현

```text
필드·학교생활
= 3.5~4등신 SD 캐릭터

대화
= 기존 장소 배경 위 반신 일러스트

전투
= 별도 고정 3/4 전술 전투장
= 필드와 동일한 SD 비율 재사용
```

사용자가 승인한 두 번째 인게임 예상 이미지는 화면 구성의 `USER_APPROVED_VISUAL_REFERENCE`다.

### 전투 화면

기존 `같은 필드 화면에서 전투`는 최신 결정으로 대체한다.

```text
필드에서 위험 확인
→ 별도 고정 3/4 전술 전투장
→ 마법 작성·전투·환경 변화
→ 결과를 반영해 원래 필드로 복귀
```

### 메인 동반 소환수

- 원소·정령 중심
- 동물 형상은 가능하지만 전체 체계를 동물형으로 고정하지 않음
- 현재 대표 방향은 신비한 늑대형 정령수 계열
- 장기 4단계 성장
- 성장 단계별 크기·모습 변화
- 해금된 현재 단계 이하의 이전 형상 선택 가능
- 실제 성장 단계와 표시 형상 분리
- 장기적으로 탑승 기능 해금
- 탑승은 초기 Vertical Slice 제외

### 전투 보조 소환수

확정:

- 같은 세계관의 원소·정령 시각 언어
- 전투에서 호출
- 역할 우선 실루엣
- Vertical Slice는 수호 또는 견제 1체

미확정:

- 공격·견제·수호·보조 4역할 전체 체계
- 성장 단계
- 이전 형상 선택
- 탑승
- 획득·편성·재화 구조

---

## 2. 적대적 검토 결론

| Finding | 판정 | 처리 |
|---|---|---|
| 승인 내용을 다시 묻는 정본 누락 | `P0 MUST_FIX` | 현재 결정 스냅샷 신설·질문 전 조회 의무화 |
| 기존 시각 문서의 같은 화면 전투 | `P0 MUST_FIX` | 별도 전술 전투장으로 교체 |
| 필드·대화·전투 자산 폭증 | `P1 SHOULD_FIX` | 필드·전투 SD 비율과 기본 골격 재사용 |
| 메인 소환수 4단계 전체를 Slice에 제작 | `P0 SCOPE` | 장기 방향 유지, Slice는 초기 형상 1개 |
| 이전 형상과 실제 능력 혼동 | `P1` | actual_growth_stage와 display_form_stage 분리 |
| 탑승과 장면 기반 맵 충돌 | `P1` | 연출형·구간형 우선, Slice 제외 |
| 전투 소환수 4역할 과잉 확정 | `P0` | 비교 후보로 유지, Slice는 수호/견제 1체 |
| 이미지 실패 때 동일 요청 재입력 요구 | `P1 OPERATING` | 브리프 보존·내부 단순화 재시도 규칙 추가 |

최종 판정: `PASS_WITH_CORRECTIONS`

---

## 3. 신설·갱신 책임 원본

신설:

- `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- `docs/planning/GATE_2_ADVERSARIAL_REVIEW_LOOP_2026-07-27B.md`
- `docs/planning/GATE_2_CHARACTER_PRESENTATION_SYSTEM.md`
- `docs/planning/GATE_2_SUMMON_GROWTH_AND_FORM_SYSTEM.md`

갱신:

- `docs/planning/GATE_2_VISUAL_PRESENTATION_SYSTEM.md`
- `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md`

---

## 4. 재질문 방지 결정

새 디자인 질문 전 다음을 확인한다.

```text
START_HERE
→ ACTIVE_CONTEXT
→ CURRENT_CONFIRMED_DECISIONS
→ DECISION_LOG와 최신 Addendum
→ 주제별 책임 원본
```

질문 가능한 상태:

- `USER_DECISION_REQUIRED`
- `UNRESOLVED`
- `PLAYTEST_TUNING_REQUIRED`
- `ASSET_SPEC_REQUIRED`
- `TECHNICAL_REVIEW_PROPOSAL`

승인된 결정을 기억 확인 목적으로 다시 선택하게 하지 않는다.

---

## 5. 범위 보호

Vertical Slice 유지:

- 수업·시험·축제·현장실습
- 자유일정 3회
- 공통 Situation Challenge
- 필드 SD + 대화 반신
- 별도 고정 3/4 전술 전투장
- 메인 동반 초기 형상 1개
- 수호 또는 견제 보조 소환수 1체

Vertical Slice 후행:

- 메인 소환수 2~4단계 런타임 제작
- 형상 선택 UI 구현
- 탑승
- 전투 소환수 전체 역할군·성장·형상 선택

---

## 6. 다음 단계

`ART-STYLE-01`

다음 그림체 후보는 동일한 인게임 구성으로 이미지 비교한다.

- 학교 필드 SD
- 대화 반신
- 별도 3/4 전술 전투장
- 메인 원소 정령수 초기 형상
- 수호 또는 견제 전투 보조 소환수
- 마법 작성 오버레이
