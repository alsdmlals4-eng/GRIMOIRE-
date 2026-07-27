# 스펠 Gate 2 진입 전 적대적 검토 루프 — 2026-07-27

## 1. 문서 상태

- 검토 ID: `GM-VS-REVIEW-LOOP-01`
- 기준 승인: `GM-GATE1-APPROVAL-01`
- 제품 단계: `PROTOTYPE_AND_VERTICAL_SLICE`
- 실행 프로필: `PLANNING_ONLY_PROFILE`
- 검토 Work Mode: `REVIEW`
- 구현: `NOT_STARTED`
- Codex: `NOT_RUN`
- 런타임 검증: `NOT_RUN`
- 최종 판정: `PASS_WITH_FOLLOWUP`
- 아트·사운드 대량 제작: `BLOCKED_BY_VISUAL_PRESENTATION_DECISIONS`
- 다음 차단 결정: `GM-VISUAL-PRESENTATION-01`

이 검토는 승인된 Gate 1 코어를 다시 해체하기 위한 절차가 아니다. 승인된 제품 약속과 비타협 코어를 고정한 상태에서, Vertical Slice 계약이 실제 아트·사운드·구현 준비로 넘어갈 수 있는지 다섯 개의 서로 다른 렌즈로 공격하고 비판을 재검증한다.

## 2. 검토 흐름

```text
review-scope-map
→ 요구·정체성·정본 공격
→ 논리·Core Loop·판정 공격
→ 데이터·저장·자산 추적 공격
→ 모바일 UX·접근성·제작성 공격
→ 아트·사운드·시장·GitHub 회귀 공격
→ 비판 재검증
→ 최소 문서 교정
→ regression-recheck
→ decision-report
```

## 3. 보호 대상

- `CORE_CONFIRMED`
- 의미 기반 마법 글자
- `메인 글자 1개 + 보조 글자 0개 이상`
- 신규·미숙·중요 글자의 직접 작성
- 상황에 따른 주문 설계·재설계
- 수업·시험·학교축제·현장실습
- 중요 일정 사이 자유일정 3회
- 메인 동반 소환수 + 전투 보조 소환수
- 첫 완주 목표 45~50분, 상한 60분
- 공통 `Situation Challenge`
- 별도 CORE_POC 재도입 금지
- M0~M4 Validation-First 순서

## 4. 1차 — 요구·결정·정체성·정본

| ID | 문제 | 심각도 | 판정 | 처리 |
|---|---|---:|---|---|
| R1-01 | README가 승인 전 제품 단계와 다음 결정을 안내 | HIGH | `MUST_FIX` | 최신 Gate 1 승인·시각 결정으로 교정 |
| R1-02 | Vertical Slice 계약 메타데이터가 승인 전 상태 | MEDIUM | `MUST_FIX` | 승인본으로 재정리 |
| R1-03 | Skill Registry가 Gate 1 진행 중·Gate 2 미진입·CORE_POC 선행을 기록 | HIGH | `MUST_FIX` | 사용자 override와 Gate 1 승인 반영 |
| R1-04 | Asset Ledger가 제품 단계와 메인 동반자 상태를 오래되게 기록 | HIGH | `MUST_FIX` | 역할 승인·비주얼 미정으로 분리 |
| R1-05 | 승인된 코어를 다시 열어야 한다는 비판 | HIGH | `REJECT` | 새 충돌 증거가 없고 사용자 승인과 상충 |

결론: Gate 1 코어 재검토가 아니라 정본 상태 회귀 교정이 필요하다.

## 5. 2차 — 논리·Core Loop·판정 가능성

| ID | 문제 | 심각도 | 판정 | 처리 |
|---|---|---:|---|---|
| R2-01 | 세션별 판단 차이를 검수하는 제작표 없음 | HIGH | `SHOULD_FIX` | `Problem Differentiation Matrix` 필수화 |
| R2-02 | 한 메인·두 보조가 동일한 정답으로 고착될 가능성 | HIGH | `UNVERIFIED` | 플레이테스트; 글자 수 선제 확대 금지 |
| R2-03 | 방향성 미리보기가 발견을 침해할 가능성 | MEDIUM | `UNVERIFIED` | 대상·범위·위험·소모 경향 제한 유지 |
| R2-04 | 휴식·준비·교류 중 절대 우위 가능성 | MEDIUM | `UNVERIFIED` | 수치 확정 금지, 비교 테스트 |
| R2-05 | 세션별 완전히 다른 미니게임 필요 주장 | HIGH | `REJECT` | 공통 Situation Challenge에 위배 |

Problem Differentiation Matrix:

```text
세션
→ 플레이어가 읽어야 할 정보
→ 핵심 판단
→ 허용 해법 2개 이상
→ 금지되는 단순 반복 해법
→ 실패 원인
→ 결과 피드백
→ 다음 세션으로 전달되는 학습
```

이 표가 작성되기 전 시험·축제·현장용 대량 아트 제작을 시작하지 않는다.

## 6. 3차 — 데이터·저장·자산 추적·호환성

| ID | 문제 | 심각도 | 판정 | 처리 |
|---|---|---:|---|---|
| R3-01 | 저장 enum·schema_version·기본값·마이그레이션 규칙 없음 | HIGH | `TECHNICAL_REVIEW_PROPOSAL` | Codex Plan 전 Save Schema v1 |
| R3-02 | Situation Challenge 데이터 필드·ID 규칙이 개념 수준 | HIGH | `TECHNICAL_REVIEW_PROPOSAL` | 구현 준비에서 소유권 확정 |
| R3-03 | 생성 자산의 제작 이력·승인 증거 열 부족 | HIGH | `MUST_FIX_BEFORE_ASSET_GENERATION` | Asset Ledger 확장 완료 |
| R3-04 | 캐릭터·배경·효과·사운드 기술 규격 미정 | HIGH | `USER_DECISION_REQUIRED_SEQUENCE` | 시각 표현 구조 후 Asset Specification |
| R3-05 | 지금 저장 구현을 확정해야 한다는 비판 | MEDIUM | `DEFER` | 아트 방향 전 코드 Schema 고정 불필요 |

Save Schema v1 최소 요구:

- `schema_version`
- 안정적인 ID와 enum
- 누락 필드 기본값
- 알 수 없는 태그 처리
- 롤백 경계와 저장 실패 복구
- 이전 버전 로드 정책

## 7. 4차 — 모바일 UX·접근성·제작성

| ID | 문제 | 심각도 | 판정 | 처리 |
|---|---|---:|---|---|
| R4-01 | 화면 방향·카메라·월드 표현 방식 미정 | CRITICAL | `USER_DECISION_REQUIRED` | 그림체 전 가장 먼저 결정 |
| R4-02 | 주인공의 게임·대화 화면 표현 수준 미정 | HIGH | `USER_DECISION_REQUIRED_AFTER_R4-01` | 캐릭터 자산 목록 전 확정 |
| R4-03 | 정지·감속·실시간 작성 방식 미정 | HIGH | `BLOCKED_UNVERIFIED` | M0에서 비교; 최종 FX 타이밍 후행 |
| R4-04 | 아트 자산 수량·상태·변형 예산 없음 | HIGH | `MUST_FIX_BEFORE_ASSET_GENERATION` | Visual Asset Budget |
| R4-05 | 글자·효과·경고 접근성 계약 부족 | HIGH | `SHOULD_FIX_BEFORE_ART_BIBLE` | 색+형태+움직임 중복 규칙 |
| R4-06 | 사운드 정체성·우선순위·무음 대체 미정 | HIGH | `SHOULD_FIX_BEFORE_AUDIO_PRODUCTION` | Audio Direction Card |

필수 순서:

```text
GM-VISUAL-PRESENTATION-01
→ GM-CHARACTER-PRESENTATION-01
→ ART-STYLE-01
→ ART-BIBLE-01
→ ASSET-SPEC-01
→ 자산 후보·라이선스 검토
→ 사용자 승인 후 생성·편집
```

스타일 비교용 소수 기준 샷은 별도 승인 후 제작할 수 있다.

## 8. 5차 — 아트·사운드·시장·GitHub 회귀

| ID | 문제 | 심각도 | 판정 | 처리 |
|---|---|---:|---|---|
| R5-01 | 메인 동반자의 시각·스토어·UI 역할 미정 | HIGH | `DEFER_TO_ART_DIRECTION` | 시각 계약에서 확정 |
| R5-02 | 모바일 실제 화면 아트·FX 가독성 계획 없음 | HIGH | `SHOULD_FIX` | 16:9·20:9 기준 샷 포함 |
| R5-03 | 사운드 이벤트 우선순위표 없음 | MEDIUM | `SHOULD_FIX` | 입력→판정→위험→결과→BGM 우선순위 |
| R5-04 | Draft PR #1이 광범위한 기획·운영 이력을 포함 | MEDIUM | `SHOULD_FIX_BEFORE_IMPLEMENTATION` | 구현은 별도 Branch·PR |
| R5-05 | 외부 자산·폰트·사운드 라이선스 미조사 | HIGH | `UNVERIFIED` | 스타일·규격 확정 후 조사 |
| R5-06 | 런타임 증거 없이 완성도 주장 위험 | HIGH | `NO_CHANGE` | 실제 적용 전 `NOT_RUN` 유지 |

## 9. 실제 반영

### MUST_FIX — 완료

- README 최신화
- Vertical Slice 계약 승인 상태 정렬
- Skill Registry 라우팅 최신화
- Asset Ledger 상태·생성 이력 필드 최신화
- Active Context·Development Gates·Registry를 시각 표현 결정으로 변경

### SHOULD_FIX — 다음 산출물

- Problem Differentiation Matrix
- Visual Asset Budget
- 접근성 포함 Art Bible
- Audio Direction Card
- 모바일 기준 샷·FX 가독성 기준
- 구현 전 별도 Branch·PR 계약

### USER_DECISION_REQUIRED

1. `GM-VISUAL-PRESENTATION-01`
2. `GM-CHARACTER-PRESENTATION-01`
3. `ART-STYLE-01`

한 번에 한 결정만 묻는다.

### BLOCKED_UNVERIFIED

- 직접 작성의 정지·감속·실시간 최종안
- 터치 입력 피로와 인식 허용 범위
- 공통 Situation Challenge 런타임 재사용성
- 자유일정 선택 가치
- Android 성능·가독성
- 외부 자산 라이선스·기술 적합성
- 사운드·FX 실제 믹스와 무음 대체

## 10. Regression Recheck

| 검사 | 결과 |
|---|---|
| Gate 1 승인과 CORE_CONFIRMED 유지 | `PASS` |
| 수업·시험·축제·현장 유지 | `PASS` |
| 자유일정 3회 유지 | `PASS` |
| 별도 CORE_POC 없음 | `PASS` |
| 기능·콘텐츠 범위 팽창 없음 | `PASS` |
| 구현·Codex 실행 없음 | `PASS` |
| 런타임 미검증을 사실대로 유지 | `PASS` |
| 아트·사운드 제작 전 차단 결정 식별 | `PASS_WITH_FOLLOWUP` |
| 오래된 정본 상태 | `FIXED` |

## 11. 최종 판정

- 제품·코어: `NO_CHANGE`
- Vertical Slice 범위: `NO_CHANGE_WITH_PRODUCTION_GUARDRAILS`
- 구현 프로필: `DEFERRED_UNTIL_VISUAL_AUDIO_PREPRODUCTION`
- 아트·사운드: `HOLD_BEFORE_VISUAL_PRESENTATION_DECISION`
- 최종 회귀: `PASS_WITH_FOLLOWUP`
- 다음 차단 결정: `GM-VISUAL-PRESENTATION-01`

> Vertical Slice를 어떤 화면 방향과 카메라·게임 표현 구조로 보여줄 것인가?
