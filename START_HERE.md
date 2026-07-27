# 스펠 시작 지점

> 새 사용자·GPT·Codex·작업자가 현재 상태, 책임 원본, 보호 결정과 다음 작업을 가장 먼저 확인하는 대시보드다.

## 한눈에 보기

| 항목 | 현재 기준 |
|---|---|
| 제품 단계 | `PROTOTYPE_AND_VERTICAL_SLICE` |
| Gate 1 | `APPROVED` |
| 프로젝트 코어 | `CORE_CONFIRMED` |
| 실행 프로필 | `PLANNING_ONLY_PROFILE` |
| Work Mode | `PLAN` |
| Vertical Slice 계약 | `APPROVED_AT_GATE_1_WITH_P0_AMENDMENT` |
| 적대적 검토 루프 | `PASS_WITH_FOLLOWUP` |
| 구현 | `NOT_STARTED` |
| Codex | `NOT_RUN` |
| 이미지·사운드 제작 | `NOT_STARTED` |
| 다음 차단 결정 | `GM-VISUAL-PRESENTATION-01` |
| 기준 브랜치 | `gpt/planning-spell-20260725` |

## 먼저 읽을 문서

1. `docs/ACTIVE_CONTEXT.md`
2. `docs/planning/GATE_1_FINAL_APPROVAL.md`
3. `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`
4. `docs/planning/GATE_2_ADVERSARIAL_REVIEW_LOOP_2026-07-27.md`
5. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27Q.md`
6. `docs/DEVELOPMENT_GATES.md`
7. `docs/DESIGN_DOCUMENT_REGISTRY.json`
8. `docs/ASSET_LICENSE_LEDGER.md`
9. `skills/SKILL_REGISTRY.json`
10. `docs/DOCUMENTATION_MAP.md`

## 승인된 플레이어 약속

> **마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 모바일 마법 RPG.**

## 승인된 코어

- 의미를 가진 마법 글자
- `메인 글자 1개 + 보조 글자 0개 이상`
- 신규·미숙·중요 글자의 직접 작성
- 상황에 따른 주문 변형 판단
- 즉각적이고 설명 가능한 세계 변화
- 학습→평가·표현→응용→발견·기록 순환

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

역할:

```text
수업 = 배움
시험 = 증명
축제 = 표현·관계
현장 = 응용·발견
자유일정 = 휴식·준비·교류
```

범위 상한:

- 첫 완주 목표: `45~50분`
- 허용 상한: `60분`
- 공통 `Situation Challenge`
- 자유일정 3회
- 세션 경계 중심 최소 저장
- M0~M4 Validation-First 구현 순서

## 적대적 검토 결과

- 코어와 Slice 범위: 유지
- 세션·글자·지역·캐릭터 수: 확대하지 않음
- README·계약 상태·Skill Registry·Asset Ledger: 최신화
- 아트·사운드 대량 제작: 화면 구조 결정 전 차단
- 런타임·Android·접근성·성능: `NOT_RUN`

## 현재 작업 순서

```text
GM-VISUAL-PRESENTATION-01
화면 방향·카메라·게임 표현 구조
→ GM-CHARACTER-PRESENTATION-01
캐릭터 표현 수준
→ ART-STYLE-01
그림체 후보 비교·선정
→ ART-BIBLE-01
시각 규칙·접근성·FX 규칙
→ ASSET-SPEC-01
캐릭터·배경·UI·효과·사운드 수량·규격
→ 사용자 승인 후 자산 작업
→ GM-VS-PROFILE-01 재검토
```

## 현재 금지

- 화면 구조 결정 전 대량 이미지·사운드 제작
- 별도 CORE_POC 재도입
- `VERTICAL_SLICE_FULL_PROFILE` 자동 전환
- Godot 구현·Scene·Resource·게임 데이터 작성
- Codex 실행
- PR 병합

## 다음 결정

`GM-VISUAL-PRESENTATION-01`

Vertical Slice를 어떤 화면 방향과 카메라·게임 표현 구조로 보여줄지 결정한다.
