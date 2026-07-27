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

검토 흐름:

```text
review-scope-map
→ 1차 요구·정체성·정본 공격
→ 2차 논리·Core Loop·판정 공격
→ 3차 데이터·저장·자산 추적 공격
→ 4차 플레이어 경험·모바일 UX·접근성·제작성 공격
→ 5차 아트·사운드·시장·GitHub 통합 회귀 공격
→ 비판 재검증
→ 최소 문서 교정
→ regression-recheck
→ decision-report
```

---

## 2. 검토 입력과 보호 범위

### 승인된 입력

- `docs/planning/GATE_1_FINAL_APPROVAL.md`
- `docs/planning/GATE_1_VERTICAL_SLICE_CONTRACT.md`
- `docs/planning/GATE_1_ADVERSARIAL_REVIEW.md`
- `docs/planning/GATE_1_GAMEPLAY_LOOP_SYSTEM.md`
- `docs/planning/GATE_1_SUMMON_COMPANION_SYSTEM.md`
- `docs/ACTIVE_CONTEXT.md`
- `docs/DEVELOPMENT_GATES.md`
- `docs/DESIGN_DOCUMENT_REGISTRY.json`
- `docs/ASSET_LICENSE_LEDGER.md`
- `skills/SKILL_REGISTRY.json`
- Draft PR #1

### 보호 대상

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

---

## 3. 1차 — 요구·결정·정체성·정본 공격

### 실패 가정

- Gate 1이 승인됐지만 일부 시작 문서가 승인 전 상태를 계속 안내한다.
- 후속 AI나 Codex가 오래된 다음 결정과 잘못된 제품 단계를 읽는다.
- 메인 동반 소환수가 승인됐지만 Asset Ledger는 아직 마스코트가 설계되지 않았다고 주장한다.
- 사용자 최신 지시인 `적대적 검토 → 시각 방향 → 캐릭터·배경·사운드·효과`가 다음 라우팅에 반영되지 않는다.

### Findings

| ID | 문제 | 심각도 | 검증 판정 | 처리 |
|---|---|---:|---|---|
| R1-01 | README가 `CONCEPT_APPROVAL`, `GM-STOCK-01`, CORE 미확정 상태를 안내 | HIGH | `MUST_FIX` | 최신 Gate 1 승인·다음 시각 결정으로 교정 |
| R1-02 | Vertical Slice 계약 메타데이터가 승인 전 상태를 유지 | MEDIUM | `MUST_FIX` | 계약 본문은 유지하고 상태만 최종 승인과 정렬 |
| R1-03 | Skill Registry가 Gate 1 진행 중·Gate 2 미진입·CORE_POC 선행을 기록 | HIGH | `MUST_FIX` | 사용자 override와 Gate 1 승인 반영 |
| R1-04 | Asset Ledger가 제품 단계와 메인 동반자 상태를 오래되게 기록 | HIGH | `MUST_FIX` | 역할 승인·비주얼 미정 상태로 분리 |
| R1-05 | 승인된 코어를 다시 열어야 한다는 비판 | HIGH | `REJECT` | 실제 새 충돌 증거가 없으며 사용자 최종 승인과 상충 |

### 결론

Gate 1 코어 재검토가 아니라 **정본 상태 회귀 교정**이 필요하다.

---

## 4. 2차 — 논리·Core Loop·판정 가능성 공격

### 실패 가정

- 메인 글자 1개와 보조 글자 2개만으로 네 핵심 세션을 구성하면 모두 같은 답을 반복한다.
- 공통 `Situation Challenge`가 재사용성이 아니라 외형만 바꾼 동일 퍼즐을 양산한다.
- 방향성 미리보기가 정답을 사실상 공개해 발견의 재미를 없앤다.
- 자유일정은 결국 다음 일정에서 가장 큰 수치 보너스를 주는 선택만 반복된다.

### Findings

| ID | 문제 | 심각도 | 검증 판정 | 처리 |
|---|---|---:|---|---|
| R2-01 | 세션 차이는 정의됐지만 문제별 판단 차이를 검수하는 제작표가 없음 | HIGH | `SHOULD_FIX` | 다음 콘텐츠 명세에 `Problem Differentiation Matrix` 필수화 |
| R2-02 | 한 메인·두 보조가 네 세션에서 동일한 정답으로 고착될 가능성 | HIGH | `UNVERIFIED` | 콘텐츠 설계와 플레이테스트로 검증; 글자 수 선제 확대 금지 |
| R2-03 | 방향성 미리보기가 발견을 침해할 가능성 | MEDIUM | `UNVERIFIED` | 현재의 대상·범위·위험·소모 경향 제한 유지, M0~M1 검증 |
| R2-04 | 휴식·준비·교류 중 절대 우위 발생 가능성 | MEDIUM | `UNVERIFIED` | 수치 확정 금지, 결과 태그와 안전 보정으로 비교 테스트 |
| R2-05 | 세션별 완전히 다른 미니게임이 필요하다는 비판 | HIGH | `REJECT` | 공통 Situation Challenge와 승인된 P0 계약에 위배 |

### Problem Differentiation Matrix 필수 열

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

이 표가 작성되기 전에는 시험·축제·현장용 대량 아트 제작을 시작하지 않는다.

---

## 5. 3차 — 데이터·저장·자산 추적·호환성 공격

### 실패 가정

- `exam_result_band`, `festival_result_tag`, `field_result_tag`가 문자열 임의값으로 퍼진다.
- 저장 Schema가 정해지지 않아 세션 구조 수정 시 세이브가 깨진다.
- 생성 이미지·사운드의 도구·프롬프트·참조·라이선스·수정 이력이 남지 않는다.
- 캐릭터와 배경 파일을 먼저 생성한 뒤 실제 용도·해상도·적용 Scene이 없어 다시 제작한다.

### Findings

| ID | 문제 | 심각도 | 검증 판정 | 처리 |
|---|---|---:|---|---|
| R3-01 | 최소 저장 필드는 있으나 enum·schema_version·기본값·마이그레이션 규칙 없음 | HIGH | `TECHNICAL_REVIEW_PROPOSAL` | Codex Plan 전 Save Schema v1 작성 |
| R3-02 | Situation Challenge 데이터 필드·ID 규칙이 개념 수준 | HIGH | `TECHNICAL_REVIEW_PROPOSAL` | 구현 준비 문서에서 Resource/JSON 소유권 확정 |
| R3-03 | 생성 자산의 제작 이력과 승인 증거 열이 부족 | HIGH | `MUST_FIX_BEFORE_ASSET_GENERATION` | Asset Ledger에 생성·편집·출처·승인·런타임 검증 필드 추가 |
| R3-04 | 캐릭터·배경·효과·사운드 기술 규격 미정 | HIGH | `USER_DECISION_REQUIRED_SEQUENCE` | 시각 표현 구조 확정 후 Asset Specification 작성 |
| R3-05 | 지금 저장 세부 구현을 확정해야 한다는 비판 | MEDIUM | `DEFER` | 아트 방향 선정 전 코드 Schema를 고정할 필요 없음 |

### Save Schema v1 최소 요구

- `schema_version`
- 안정적인 ID와 enum
- 누락 필드 기본값
- 알 수 없는 태그 처리
- 세션 완료 직전·직후 롤백 경계
- 저장 실패 시 복구
- 향후 필드 추가 시 이전 버전 로드 정책

---

## 6. 4차 — 플레이어 경험·모바일 UX·접근성·제작성 공격

### 실패 가정

- 그림체를 먼저 고른 뒤 화면 방향과 카메라를 정해 배경과 캐릭터를 다시 만든다.
- 주인공이 필드에서 보이는지, 대화 초상만 필요한지, 1인칭인지 정해지지 않은 채 캐릭터 이미지를 제작한다.
- 실시간 작성인지 감속·정지인지 정해지지 않아 애니메이션과 효과 타이밍이 호환되지 않는다.
- 화려한 마법 효과가 글자 궤적·위험·대상을 가린다.
- 색상과 사운드만으로 성공·실패를 구분해 접근성을 해친다.

### Findings

| ID | 문제 | 심각도 | 검증 판정 | 처리 |
|---|---|---:|---|---|
| R4-01 | 화면 방향·카메라·월드 표현 방식이 미정 | CRITICAL | `USER_DECISION_REQUIRED` | 그림체 선정 전 가장 먼저 결정 |
| R4-02 | 주인공의 게임 화면·대화 화면 표현 수준이 미정 | HIGH | `USER_DECISION_REQUIRED_AFTER_R4-01` | 캐릭터 자산 목록 전 확정 |
| R4-03 | 정지·감속·실시간 작성 방식 미정 | HIGH | `BLOCKED_UNVERIFIED` | M0에서 비교; 최종 전투 FX·애니메이션 타이밍은 이후 확정 |
| R4-04 | 아트 자산 수량·상태·변형 예산 없음 | HIGH | `MUST_FIX_BEFORE_ASSET_GENERATION` | Visual Asset Budget 작성 |
| R4-05 | 글자·효과·경고의 접근성 계약이 부족 | HIGH | `SHOULD_FIX_BEFORE_ART_BIBLE` | 색+형태+움직임 중복, 플래시·감속·무음 대체 규칙 포함 |
| R4-06 | 사운드 정체성·우선순위·무음 대체 정보 미정 | HIGH | `SHOULD_FIX_BEFORE_AUDIO_PRODUCTION` | Audio Direction Card 작성 |

### 아트 제작 전 필수 순서

```text
GM-VISUAL-PRESENTATION-01
화면 방향·카메라·게임 표현 구조
→ GM-CHARACTER-PRESENTATION-01
주인공·NPC·소환수의 화면별 표현 수준
→ ART-STYLE-01
2~3개 그림체 방향 비교·선정
→ ART-BIBLE-01
색·선·명암·재질·실루엣·배경 밀도·FX 규칙
→ ASSET-SPEC-01
캐릭터·배경·UI·효과·사운드 수량과 기술 규격
→ 자산 후보 조사·라이선스 검토
→ 사용자 승인 후 생성·편집
```

`ART-STYLE-01` 전에 그림을 대량 생성하지 않는다. 스타일 비교용 소수의 기준 샷만 별도 승인 후 제작할 수 있다.

---

## 7. 5차 — 아트·사운드·시장·GitHub·통합 회귀 공격

### 실패 가정

- 메인 동반자는 서사 역할만 있고 스토어 아이콘·실루엣·UI 피드백 역할이 연결되지 않는다.
- 캐릭터·배경은 아름답지만 직접 작성 화면과 실제 모바일 해상도에서 읽히지 않는다.
- 사운드가 BGM 중심으로 제작되어 글자 입력·인식·설계 실패·위험 피드백이 묻힌다.
- 84개 파일과 장기간 누적된 Draft PR이 구현 기준선과 기획 이력을 섞는다.
- 승인 전 참조 문서가 검색 결과에서 최신 문서처럼 소비된다.

### Findings

| ID | 문제 | 심각도 | 검증 판정 | 처리 |
|---|---|---:|---|---|
| R5-01 | 메인 동반자의 시각·스토어·UI 역할이 미정 | HIGH | `DEFER_TO_ART_DIRECTION` | 역할은 승인됐으며 시각 계약 단계에서 확정 |
| R5-02 | 모바일 실제 화면에서 아트·FX 가독성 검증 계획 없음 | HIGH | `SHOULD_FIX` | Art Bible에 16:9·20:9·저사양 기기 기준 샷 포함 |
| R5-03 | 사운드 이벤트 우선순위표 없음 | MEDIUM | `SHOULD_FIX` | 입력→판정→위험→성공/실패→BGM 우선순위 정의 |
| R5-04 | Draft PR #1이 기획 이력과 운영체계 설치를 광범위하게 포함 | MEDIUM | `SHOULD_FIX_BEFORE_IMPLEMENTATION` | 구현은 별도 Branch·PR로 분리; PR #1 자동 병합 금지 유지 |
| R5-05 | 외부 자산·폰트·사운드 라이선스 조사가 미실행 | HIGH | `UNVERIFIED` | 스타일·규격 확정 후 후보 조사 시작 |
| R5-06 | 런타임 증거 없이 아트·사운드 완성도를 주장할 위험 | HIGH | `NO_CHANGE` | 실제 적용 전 `NOT_RUN` 유지 |

---

## 8. 검증된 Finding 분류

### MUST_FIX — 이번 REVIEW에서 문서 교정

- R1-01 README 최신화
- R1-02 Vertical Slice 계약 상태 최신화
- R1-03 Skill Registry 라우팅 최신화
- R1-04 Asset Ledger 상태·생성 이력 필드 최신화
- Active Context·Development Gates·Registry의 다음 단계를 시각 표현 결정으로 변경

### SHOULD_FIX — 다음 기획 산출물

- Problem Differentiation Matrix
- Visual Asset Budget
- 접근성 포함 Art Bible
- Audio Direction Card
- 모바일 기준 샷·FX 가독성 기준
- 구현 전 별도 Branch·PR 계약

### USER_DECISION_REQUIRED

1. `GM-VISUAL-PRESENTATION-01`: 화면 방향·카메라·게임 표현 구조
2. 이후 `GM-CHARACTER-PRESENTATION-01`: 주인공과 캐릭터 표현 수준
3. 이후 `ART-STYLE-01`: 그림체 선택

한 번에 한 결정만 묻는다.

### BLOCKED_UNVERIFIED

- 직접 작성의 정지·감속·실시간 최종안
- 터치 입력 피로와 인식 허용 범위
- 공통 Situation Challenge 런타임 재사용성
- 자유일정 선택 가치
- 실제 Android 성능·가독성
- 외부 자산 라이선스·기술 적합성
- 사운드·FX 실제 믹스와 무음 대체 정보

### REJECT

- 승인된 프로젝트 코어를 증거 없이 다시 개방
- 세션별 별도 미니게임·전용 프레임워크 추가
- 아트 품질로 입력·설계 문제를 덮기
- 별도 CORE_POC 재도입
- 런타임 증거 없는 완료 선언

---

## 9. 보호된 장점

- 직접 작성이 첫 시각적 훅이라는 우선순위
- 의미 기반 조합과 상황 재설계가 장기 핵심이라는 구분
- 수업·시험·축제·현장의 역할 차이
- 중요 일정 사이 자유일정의 완충
- 메인 동반자와 전투 보조 소환수의 책임 분리
- 45~50분 목표·60분 상한
- 한 학교 장면 세트의 재사용
- 공통 Situation Challenge와 최소 저장
- M0~M4 구현 순서

검토 과정에서 새 기능, 글자 수, 캐릭터 수, 지역 수를 추가하지 않았다.

---

## 10. Regression Recheck

| 검사 | 결과 |
|---|---|
| Gate 1 승인과 CORE_CONFIRMED 유지 | `PASS` |
| 사용자 요구한 수업·시험·축제·현장 유지 | `PASS` |
| 자유일정 3회 유지 | `PASS` |
| 별도 CORE_POC 재도입 없음 | `PASS` |
| 기능·콘텐츠 범위 팽창 없음 | `PASS` |
| 구현·Codex 실행 없음 | `PASS` |
| 런타임·접근성·성능 미검증을 사실대로 유지 | `PASS` |
| 아트·사운드 제작 전 차단 결정 식별 | `PASS_WITH_FOLLOWUP` |
| 오래된 정본 상태 | `REQUIRES_DOCUMENT_FIXES` |

최종 회귀 판정: `PASS_WITH_FOLLOWUP`

---

## 11. 최종 판정

### 제품·코어

`NO_CHANGE`

Gate 1 승인과 프로젝트 코어를 유지한다.

### Vertical Slice 범위

`NO_CHANGE_WITH_PRODUCTION_GUARDRAILS`

수업·시험·축제·현장실습과 자유일정 3회를 유지한다. 문제 차별화 표와 자산 예산을 추가하되 콘텐츠 수를 늘리지 않는다.

### 구현 프로필

`DEFERRED`

사용자가 지정한 순서에 따라 적대적 검토 이후 시각 방향·아트·사운드 준비를 먼저 진행한다. `GM-VS-PROFILE-01`은 폐기하지 않고 후순위로 이동한다.

### 아트·사운드

`HOLD_BEFORE_VISUAL_PRESENTATION_DECISION`

그림체·캐릭터·배경·효과·사운드 대량 제작 전에 화면 방향·카메라·게임 표현 구조를 먼저 확정한다.

### 다음 차단 결정

`GM-VISUAL-PRESENTATION-01`

> Vertical Slice를 어떤 화면 방향과 카메라·게임 표현 구조로 보여줄 것인가?
