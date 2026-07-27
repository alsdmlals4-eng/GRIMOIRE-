# 스펠 시작 지점

> 새 사용자·GPT·Codex·작업자가 프로젝트의 현재 상태, 책임 원본, 보호 결정과 다음 작업을 가장 먼저 확인하는 대시보드다.

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
| 직접 Slice 경로 | `DIRECT_VERTICAL_SLICE_ROUTE_CONFIRMED_FOR_GATE_1` |
| Vertical Slice 계약 | `VERTICAL_SLICE_CONTRACT_CONFIRMED_FOR_GATE_1` |
| 다음 차단 결정 | `GM-GATE1-REVIEW-01` |
| 기준 브랜치 | `gpt/planning-spell-20260725` |

## 먼저 읽을 문서

1. `docs/ACTIVE_CONTEXT.md`
2. `docs/planning/V6_CONCEPT_REBASE_BASELINE.md`
3. `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`
4. `docs/planning/GATE_1_VERTICAL_SLICE_DIRECT_ROUTE.md`
5. `docs/planning/DECISION_LOG.md`
6. `docs/DEVELOPMENT_GATES.md`
7. `docs/DESIGN_DOCUMENT_REGISTRY.json`
8. `docs/DOCUMENTATION_MAP.md`

## 플레이어 약속

> **마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.**

## 비타협 코어

- 의미를 가진 마법 글자
- `메인 글자 1개 + 보조 글자 0개 이상`
- 신규·미숙·중요 글자의 직접 작성
- 상황에 따른 주문 변형 판단
- 즉각적이고 설명 가능한 세계 변화
- 학습→응용→발견·기록 순환

## 세일즈포인트

1. 손으로 직접 쓰는 마법
2. 상황에 맞게 만드는 주문
3. 수업에서 배우고 실전에서 발견하는 마법학교

## 소환수 구조

```text
메인 동반 소환수
= 항상 같은 개체가 동행
= 학습·관계·기록

전투 보조 소환수
= 전투에서 호출
= 공격·견제·수호·충전 지원
```

소환수는 글자 작성·조합 판단·정답 제시를 대행하지 않는다.

## 확정된 Vertical Slice

```text
프롤로그·학교 도착
→ 첫 수업·교내 연습
→ 자유일정 A 1회
→ 첫 실기시험
→ 자유일정 B 1회
→ 학교축제 준비·학교축제
→ 자유일정 C 1회
→ 첫 현장실습
→ 귀환·마도서 기록·다음 학기 예고
```

핵심 역할:

```text
수업·연습 = 배움
시험 = 이해의 증명
학교축제 = 표현·관계·비전투 활용
현장실습 = 실제 위험 속 응용·발견
자유일정 = 휴식·준비·관계·연구의 완충
```

자유일정 보호 결정:

- 중요 일정 사이 총 3회
- 한 슬롯에서 행동 1개 선택
- `휴식`은 유효한 정식 선택
- 필수 일정·정보·정답을 차단하지 않음

## 현재 금지

- 별도 CORE_POC 재도입
- Godot 구현·Scene·Resource·게임 데이터 작성
- Codex 실행
- `CORE_CONFIRMED` 선언
- 실행 프로필 전환
- PR 병합

## 다음 작업

`GM-GATE1-REVIEW-01`

축약 학기형 Vertical Slice가 다음을 만족하는지 적대적으로 검토한다.

- 1인 개발 범위
- 수업·시험·축제·현장실습의 역할 차이
- 자유일정의 휴식·준비 가치
- 모바일 터치 UX
- 저장·복귀
- 두 번째 콘텐츠 제작성
- P0·P1 감량 우선순위
