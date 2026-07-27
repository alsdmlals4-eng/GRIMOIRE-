# 스펠 시작 지점

> 새 사용자·GPT·Codex·작업자가 현재 상태와 다음 결정을 가장 먼저 확인하는 대시보드다.

## 한눈에 보기

| 항목 | 현재 기준 |
|---|---|
| 제품 단계 | `CONCEPT_APPROVAL` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| Work Mode | `PLAN` |
| 프로젝트 코어 | `CORE_CANDIDATE` |
| Gate 1 | `UNVERIFIED` |
| 구현 | `NOT_STARTED` |
| CORE_POC | `REMOVED_BY_USER_DECISION` |
| Vertical Slice 계약 | `CONFIRMED_BY_GM-SLICE-01_PENDING_P0_AMENDMENT` |
| 적대적 검토 | `AUTHORED_BY_GM-GATE1-REVIEW-01` |
| 현재 범위 제작성 | `CONDITIONAL_FAIL` |
| P0 감량 후 제작성 | `CONDITIONAL_PASS_CANDIDATE` |
| 다음 결정 | `GM-GATE1-RISK-01` |

## 먼저 읽을 문서

1. `docs/ACTIVE_CONTEXT.md`
2. `docs/planning/GATE_1_ADVERSARIAL_REVIEW.md`
3. `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`
4. `docs/planning/V6_CONCEPT_REBASE_BASELINE.md`
5. `docs/planning/DECISION_LOG.md`
6. `docs/DEVELOPMENT_GATES.md`
7. `docs/DESIGN_DOCUMENT_REGISTRY.json`

## 플레이어 약속

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.

## 승인된 Vertical Slice

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

보호:

- 중요 일정 사이 자유일정 1회씩
- 휴식은 유효한 선택
- 자유일정은 필수 진행을 차단하지 않음

## 적대적 검토 결론

현재 계약을 그대로 제작하면 다음 위험으로 `CONDITIONAL_FAIL`이다.

- 네 세션이 별도 게임으로 분열
- 자유일정이 다수 독립 이벤트로 폭증
- 첫 완주 시간 상한 부재
- 입력 검증 전 콘텐츠·아트 제작
- 저장 상태 과다

## 권장 P0 처리 패키지 — 사용자 결정 대기

1. 공통 `Situation Challenge` 계약
2. 세션별 역할 분리
3. 첫 완주 45~50분 목표, 60분 상한
4. 자유일정 `휴식 / 준비 / 교류` 세 원형
5. 입력→공통 문제→학교→현장→연출 구현 순서
6. 세션 경계 중심 최소 저장

## 현재 금지

- Gate 1 최종 승인
- `CORE_CONFIRMED`
- `VERTICAL_SLICE_FULL_PROFILE` 전환
- Codex 실행
- Godot 구현
- PR 병합

## 다음 작업

`GM-GATE1-RISK-01`

권장 P0 처리 패키지를 승인할지 결정한다.
