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
| 시각 표현 구조 | `LANDSCAPE_HYBRID_2D_CONFIRMED` |
| 구현 | `NOT_STARTED` |
| Codex | `NOT_RUN` |
| 이미지·사운드 제작 | `NOT_STARTED` |
| 다음 차단 결정 | `GM-CHARACTER-PRESENTATION-01` |
| 기준 브랜치 | `gpt/planning-spell-20260725` |

## 먼저 읽을 문서

1. `docs/ACTIVE_CONTEXT.md`
2. `docs/planning/GATE_1_FINAL_APPROVAL.md`
3. `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`
4. `docs/planning/GATE_2_ADVERSARIAL_REVIEW_LOOP_2026-07-27.md`
5. `docs/planning/GATE_2_VISUAL_PRESENTATION_SYSTEM.md`
6. `docs/planning/DECISION_LOG_ADDENDUM_2026-07-27R.md`
7. `docs/DEVELOPMENT_GATES.md`
8. `docs/DESIGN_DOCUMENT_REGISTRY.json`
9. `docs/ASSET_LICENSE_LEDGER.md`
10. `skills/SKILL_REGISTRY.json`
11. `docs/DOCUMENTATION_MAP.md`

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

## 승인된 시각 표현 구조

```text
가로형
+ 고정·장면 기반 3/4 월드
+ 동일 배경 위 대화 초상
+ 월드 감속·암전형 마법 작성 오버레이
+ 같은 장면에서 적·환경·보조 소환수 확인
```

화면비:

- 기준 구도: `16:9`
- 확장 대응: `18:9~20:9`
- 넓은 화면은 좌우 월드 영역을 확장
- 핵심 UI와 작성 영역은 안전 구도를 유지

제작 경계:

- 자유 이동형 대형 학교 제외
- 학교 장면은 수업·시험·자유일정·축제 상태로 재사용
- 현장 장면은 전투·환경·복구 상태로 재사용
- 작성 중 월드·대상·위험을 완전히 숨기지 않음
- 정확한 감속 비율·내부 해상도는 후속 검증·Asset Specification에서 확정

## 적대적 검토 결과

- 코어와 Slice 범위: 유지
- 세션·글자·지역·캐릭터 수: 확대하지 않음
- README·계약 상태·Skill Registry·Asset Ledger: 최신화
- 시각 표현 구조: 확정
- 캐릭터·배경·효과·사운드 대량 제작: 캐릭터 표현·Art Bible·Asset Specification 전 차단
- 런타임·Android·접근성·성능: `NOT_RUN`

## 현재 작업 순서

```text
GM-CHARACTER-PRESENTATION-01
캐릭터 표현 수준
→ ART-STYLE-01
그림체 후보 비교·선정
→ ART-BIBLE-01
시각 규칙·접근성·FX 규칙
→ ASSET-SPEC-01
캐릭터·배경·UI·효과·사운드 수량·규격
→ AUDIO-DIRECTION-01
사운드 정체성·무음 대체
→ 사용자 승인 후 자산 작업
→ GM-VS-PROFILE-01 재검토
```

## 현재 금지

- 캐릭터 표현·Art Bible·Asset Specification 전 대량 이미지·사운드 제작
- 별도 CORE_POC 재도입
- `VERTICAL_SLICE_FULL_PROFILE` 자동 전환
- Godot 구현·Scene·Resource·게임 데이터 작성
- Codex 실행
- PR 병합

## 다음 결정

`GM-CHARACTER-PRESENTATION-01`

가로형 3/4 장면에서 주인공·NPC·메인 동반 소환수·전투 보조 소환수를 어떤 비율과 자산 조합으로 표현할지 결정한다.
