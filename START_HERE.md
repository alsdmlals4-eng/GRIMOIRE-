# 스펠 시작 지점

> 새 사용자·GPT·Codex·작업자가 현재 상태, 책임 원본, 보호 결정과 다음 작업을 가장 먼저 확인하는 대시보드다.

## 한눈에 보기

| 항목 | 현재 기준 |
|---|---|
| 제품 단계 | `CONCEPT_APPROVAL` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| Work Mode | `PLAN` |
| 프로젝트 코어 | `CORE_CANDIDATE` |
| Gate 1 | `FINAL_USER_APPROVAL_PENDING` |
| 구현 | `NOT_STARTED` |
| Codex | `NOT_RUN` |
| CORE_POC | `REMOVED_BY_USER_DECISION` |
| Vertical Slice 계약 | `CONFIRMED_WITH_P0_AMENDMENT_FOR_GATE_1` |
| 제작성 | `CONDITIONAL_PASS_CANDIDATE` |
| 다음 차단 결정 | `GM-GATE1-APPROVAL-01` |
| 기준 브랜치 | `gpt/planning-spell-20260725` |

## 먼저 읽을 문서

1. `docs/ACTIVE_CONTEXT.md`
2. `docs/planning/V6_CONCEPT_REBASE_BASELINE.md`
3. `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`
4. `docs/planning/GATE_1_ADVERSARIAL_REVIEW.md`
5. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27O.md`
6. `docs/planning/DECISION_LOG.md`
7. `docs/DEVELOPMENT_GATES.md`
8. `docs/DESIGN_DOCUMENT_REGISTRY.json`

## 플레이어 약속

> **마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.**

## 비타협 코어

- 의미를 가진 마법 글자
- `메인 글자 1개 + 보조 글자 0개 이상`
- 신규·미숙·중요 글자의 직접 작성
- 상황에 따른 주문 변형 판단
- 즉각적이고 설명 가능한 세계 변화
- 학습→응용→발견·기록 순환

## Vertical Slice

```text
첫 수업·교내 연습
→ 자유일정 A
→ 첫 실기시험
→ 자유일정 B
→ 학교축제
→ 자유일정 C
→ 첫 현장실습
→ 귀환·마도서 기록
```

역할:

```text
수업 = 배움
시험 = 증명
축제 = 표현·관계
현장 = 응용·발견
자유일정 = 휴식·준비·교류
```

## 승인된 P0 계약

### 공통 Situation Challenge

```text
상황 목표
→ 관찰 가능한 상태
→ 사용 가능한 메인·보조 글자
→ 제한 조건
→ 방향성 결과 미리보기
→ 주문 작성
→ 세계 상태 변화
→ 성공·부분 성공·실패 원인
→ 기록·후속 반응
```

### 범위 상한

- 첫 완주 목표: `45~50분`
- 허용 상한: `60분`
- 자유일정: `휴식 / 준비 / 교류`
- 저장: 세션 경계 중심 최소 상태
- 구현 순서: `M0 입력 → M1 공통 문제 → M2 학교 → M3 현장 → M4 연출·저장`

M0~M4는 Vertical Slice 내부 체크포인트이며 CORE_POC가 아니다.

## 현재 금지

- 별도 CORE_POC 재도입
- 사용자 최종 승인 전 `CORE_CONFIRMED`
- `VERTICAL_SLICE_FULL_PROFILE` 전환
- Godot 구현·Scene·Resource·게임 데이터 작성
- Codex 실행
- PR 병합

## 다음 작업

`GM-GATE1-APPROVAL-01`

P0 보완 계약을 포함한 Gate 1 콘셉트와 Vertical Slice 범위를 최종 승인할지 결정한다.
