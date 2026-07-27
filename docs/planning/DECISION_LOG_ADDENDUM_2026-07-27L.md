# 스펠 기획 결정 추가 기록 — 2026-07-27L

## 문서 상태

- 결정 ID: `GM-VS-ROUTE-01`
- 상태: `DIRECT_VERTICAL_SLICE_ROUTE_CONFIRMED_FOR_GATE_1`
- 사용자 원문: `COREPOC 없이 우리는 버티칼슬라이스로 갈거야`
- 기준 브랜치: `gpt/planning-spell-20260725`
- 제품 단계: `CONCEPT_APPROVAL`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- Work Mode: `PLAN`

## 결정

스펠은 독립적인 CORE_POC 계약·구현·통과 단계를 사용하지 않는다.

```text
기존
Gate 1
→ CORE_POC 계약·구현·검증
→ Vertical Slice

최신
Gate 1 콘셉트 정리
→ Vertical Slice 계약
→ 적대적 범위 검토
→ 사용자 Gate 1 승인
→ Validation-First Vertical Slice
```

## 상태 변경

- `CORE_POC: NOT_AUTHORED` → `REMOVED_BY_USER_DECISION`
- `core-poc-contract-and-playtest` → `SUPERSEDED_BY_GM-VS-ROUTE-01`
- CORE_POC가 담당하던 핵심 가설 검증 → `ABSORBED_INTO_VERTICAL_SLICE`
- 다음 차단 결정 `GM-POC-01` → `GM-SLICE-01`
- Vertical Slice `BLOCKED_BY_GATE_1_AND_CORE_POC` → `BLOCKED_BY_GATE_1_AND_SLICE_CONTRACT`

## 설계 영향

Vertical Slice는 단순 콘텐츠 데모가 아니라 다음 가설을 직접 검증하는 `Validation-First Vertical Slice`로 정의한다.

- 터치 직접 작성의 손맛과 허용 판정
- 입력 실패와 설계 실패 분리
- 완전 정지·감속·실시간 비교
- 의미 기반 메인·보조 조합
- 전투와 환경에서 같은 문법 재사용
- 복수 유효 해법과 실패 원인 재설계
- 메인 동반 소환수의 학습·기록 연결
- 전투 보조 소환수의 작성 시간 확보
- Android 실제 기기·저장·복귀·성능
- 두 번째 유사 콘텐츠 제작성

## 보호 경계

- 별도 CORE_POC를 다른 이름으로 다시 만들지 않는다.
- Vertical Slice 내부의 초기 검증 빌드는 독립 제품 단계가 아니라 Slice 구현 체크포인트다.
- 검증을 생략하지 않고 Vertical Slice의 통과 조건으로 흡수한다.
- 사용자 승인 전 `CORE_CONFIRMED`, 구현 완료, Gate 통과를 주장하지 않는다.
- `VERTICAL_SLICE_FULL_PROFILE` 전환과 Godot 구현은 Gate 1 및 Slice 계약 승인 이후다.

## 책임 원본

- `docs/planning/GATE_1_VERTICAL_SLICE_DIRECT_ROUTE.md`

## 다음 결정

`GM-SLICE-01`: 첫 Vertical Slice의 대표 구간과 포함·제외 범위, 통과·실패 기준을 확정한다.

권장 후보:

```text
짧은 수업
→ 교내 연습
→ 메인 동반자와 짧은 일상·준비
→ 첫 현장실습의 전투 문제
→ 환경·구조 문제
→ 복귀·마도서 기록
```
