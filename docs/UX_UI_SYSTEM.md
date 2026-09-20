<a id="fun-verification-binding"></a>

## 현행 재미·표현 검증 연결 — 2026-09-20

운영 채택: GM-LEAN-OPERATING-20260920 / Base #885.
공용 원본은 adapter의 adopted source에서 읽는다:
`skills/analyzing-and-refining-game-concepts/references/concept-evidence-and-gates.md#fun-verification-lifecycle`,
`docs/knowledge/game-development/EXPERIENCE_TO_PRESENTATION_GUIDE.md`,
`skills/auditing-and-refining-ui-art/references/project-adapter-contract.md` §10–11.
기존 v9.4.3 release lock과 승인된 게임 의미·수치·아트는 바꾸지 않는다.

### 적용 원본과 구현 경계

- 경험 원본: 현재 체크아웃의 Active Context가 지시하는 승인된 기능 Spec의 “경험과 경계” 절. 기존 게임 브랜치에서 확인한 원본은 `docs/superpowers/specs/2026-09-10-shared-spell-rules-design.md` §1·5·6·7이다. 이 파일/consumer는 운영 PR 기준 main에는 없으므로 **BRANCH_ONLY / NOT_MERGED_PRODUCT**다.
- 해당 설계의 “배운 글자의 작용을 다른 대상과 환경에 응용하는 학생” 경험을 검증 질문으로 연결한다. 카드가 선택 도구라는 의미를 유지하고 결투 밖 무작위 손패·필기·별형·체스를 되살리지 않는다.
- 아래 표는 기존 게임 브랜치에서 관찰한 경로와 다음 제품 작업의 검증 명세다. 본 운영 작업의 게임 실행 결과가 아니다. 현재 main의 구 Product Root/필기 consumer는 별도 레거시 회귀 대상이며 하단 구 UX 상세가 새 카드 요구로 승격되지 않는다.
- 상태/규칙 값은 기능 Spec·기존 데이터 owner에서 읽는다. 이 문서는 새 비용·시계 속도·효과 시간·재미 점수를 정하지 않는다.

| 연결 ID / 경험 가설 | 실제 owner·소비처(게임 브랜치) | 기계·실행 확인과 사람 질문 / 반증 |
|---|---|---|
| GM-FUN-SPELL / 같은 글자의 의미를 이해하고 조합을 선택한다 | `src/core/shared_spell/spell_semantics.gd` → `src/core/shared_spell/event_spell_cast.gd`; `tests/run_shared_spell_tests.gd` | 단독/조합·무효 대상·취소·명시 시전·중복 비용 경계. 사람에게 결과를 보고 왜 이 주문/대상을 골랐는지 묻는다. 조합을 무조건 상위호환으로 이해하거나 UI의 정답만 누르면 반증. |
| GM-FUN-EVENT / 위험의 원인과 해결의 인과를 이해한다 | `event_definitions.gd`·`event_session.gd` (위 shared_spell 폴더) → 사건 표시 consumer를 변경 직전 추적 | 시간 증가와 완화, 원인 차단, 목표·위험 동시 결과를 따로 검산. 온실은 첫 실습 예시일 뿐 메인 경험 전체가 아님. 기다린 실시간 때문에 위험이 올랐다고 오해하거나 같은 주문 반복밖에 선택이 없다면 반증. |
| GM-FUN-DUEL / 같은 주문 의미로 상대 행동에 대응한다 | `src/core/shared_spell/duel_spell_exchange.gd` → `src/ui/shared_duel/shared_duel_screen.gd`; `tests/run_duel_spell_exchange_tests.gd` | 공개 예고·허용 선택·실제 결과·저장 복구의 일치. 대응 이유와 다음 선택을 설명하는가? 숨은 정보를 UI가 누설하거나 연출이 판단 신호를 가리면 반증. |
| GM-FUN-STORY / 학교 학생으로 관계와 사건을 따라간다 | `src/core/shared_spell/story_flow.gd` → `src/ui/story/story_classroom_view.gd`; `tests/run_story_classroom_tests.gd` | 화자·대사·삽화·선택·대화 종료/복귀의 일치. 첫 노출에서 화자·목적·다음 행동을 이해하는가? 시스템 상태 보고처럼 느끼거나 반복 설명/효과가 읽기를 방해하면 반증. |

### 실제 기능 변경마다 최소 연결

기존 Spec/Decision/검증 기록에 **같은 requirement_id → 경험·승인 원본 → 입력/상태/선택 → 규칙 owner → 피드백·자산 → consumer → 확인 방법**을 남긴다.
화면/검증에서 역으로 같은 요구사항·승인 원본까지 따라가며 파일 존재만으로 연결 완료라 하지 않는다. 아직 없는 경로는 PLANNED다.
규칙 효과(마력·위험·결과)와 표현 효과(문자·카드 이동·빛·음향)는 분리한다. 표현 callback이 비용·보상을 재계산하거나 성공을 선행 표시하지 않는다.
정보 공개 시점, 선택/포커스/비활성 이유, 취소·연타·중단·복귀, 실제 표시 크기·긴 한국어·승인 자산 상태군, 반복/동시 효과의 우선순위를 필요한 부분만 명시한다.
장식이 위험·대상·대사 신호를 가리지 않아야 하며 모션 축소/음소거에서도 필수 정보와 판정은 유지한다. 특정 ms·보상 빈도·공통 합격 점수는 강제하지 않는다.

### 대표 검증과 교정

1. 가장 중요한 가설 하나와 짧은 대표 구간을 고른다. 기준/후보의 exact SHA, 동일 입력/seed·설정·언어·해상도, 관찰 질문·실패/중단 기준을 먼저 정한다.
2. 첫 플레이의 이해와 반복 플레이의 선택 변주·피로를 나눠 본다. 관찰 행동·자기보고·필요 로그와 반대 증거(counterevidence)를 함께 기록하고 설명/힌트 개입도 남긴다.
3. 못 봄 → 가림/시선, 오해 → 의미/원인, 이해했지만 지루함 → 규칙·선택/리듬, 반복 피로 → 빈도/콘텐츠, 복귀 파손 → 상태/수명으로 분류한다. 무조건 효과·보상을 키우지 않는다.
4. KEEP / CHANGE / DEFER / RETEST를 기존 Decision에 연결한다. 핵심 경험·경제·서사·주요 UX·아트·비용·보안·파괴적 변경만 새 판단을 받는다.
5. L1은 기존 작업 기록의 짧은 연결로 충분하다. L0 운영도구 변경은 이유 있는 NOT_APPLICABLE. 유효한 같은 조건의 근거는 REUSED_EVIDENCE. 새 문서·Skill·분석 서버·가상 플레이어를 만들지 않는다.

**DOC / MACHINE / RUNTIME / HUMAN / USER_APPROVAL / RELEASE를 분리한다.**
현재 결과: 검증 방법의 선택 채택만 수행. 이 표의 게임 MACHINE/RUNTIME 재실행, 사람 관찰·재미 판정, 접근성/기기/최종 아트/출시는 NOT_RUN.
자동 테스트·AI 평가만으로 FUN_PASS를 생성하지 않는다. HUMAN 미실행은 필요한 승격에 남기되 승인된 구현 자체를 막지 않는다.

---

## 아래 내용의 역할: 레거시 직접 필기 UX 기록

하단의 직접 작성·인식·구 회로 요구는 해당 레거시 consumer 회귀에서만 선택한다. 현재 카드 기능의 규칙/승인으로 해석하지 않는다.

# GRIMOIRE UX/UI 시스템

> Base 공용 기준: `alsdmlals4-eng/Base`의 `auditing-and-refining-ui-art`  
> Base content commit: `a728712cb776ec98f4875914a580fcf7d0156593`
> 프로젝트 상태: `DESIGN_CONTRACT_ADOPTED`  
> Mobile 방향: `GM-MOBILE-ORIENTATION-01 / LANDSCAPE_FIXED`  
> 런타임·실기기·사람 검증: `NOT_RUN`

## 1. 플레이어 경험 약속

플레이어는 마법 글자를 직접 쓰고 조합하면서 다음을 명확히 구분해야 한다.

```text
의도한 주문 선택
→ 마법 글자 작성
→ 입력 인식 결과 확인·수정
→ 주문 문법/설계 유효성 확인
→ 비용·위험·예상 효과 비교
→ 발동 결과와 실패 원인 복기
```

핵심 경험은 **내 손으로 주문을 만든다는 몰입**, **규칙을 배워 더 정교한 마법을 설계하는 성장**, **인식 실패와 설계 실패를 구분할 수 있는 공정성**이다.

## 2. 범위와 보호 대상

### 포함

- 직접 작성·인식·수정 흐름
- 인식 오류와 마법 문법/설계 오류의 분리
- 점진적 학습과 재열람
- 주문 후보·비용·위험·효과 비교
- Landscape Mobile 입력과 긴 한국어 설명
- 발동 결과의 인과·복기
- 중단·복귀·Resume Anchor의 UI 상태

### 제외

- 실제 인식 알고리즘·주문 문법·마나·피해 수치 변경
- 저장·전투·진행 규칙 재계산
- 제품 Scene·script·data·asset 수정
- Portrait Gameplay·자동 회전 지원
- HTML 기획 대시보드

UI는 입력 stroke와 권위 있는 인식/주문 판정 결과를 표시하며, 규칙을 자체 판정하지 않는다.

## 3. 화면별 중심 질문

| 화면/단계 | 중심 질문 | 핵심 피드백 | 복구 |
|---|---|---|---|
| 주문 선택 | 어떤 의도를 가진 마법을 만들 것인가 | 목적·비용·제약 비교 | 다른 의도 선택 |
| 글자 작성 | 시스템이 내 입력을 어떻게 읽었는가 | stroke·후보·신뢰도 | 되돌리기·다시 쓰기·후보 선택 |
| 주문 조립 | 조합이 문법적으로 유효한가 | 유효/충돌/누락 위치 | 문제 글자 강조·수정 |
| 실행 전 | 비용과 위험을 감수할 가치가 있는가 | 예상 효과·불확실성 | 취소·구성 변경 |
| 결과/복기 | 왜 이 결과가 발생했는가 | 인식→문법→비용→효과 순서 | 다시 설계·도감/규칙 재열람 |
| 이어하기 | 어디까지 안전하게 확정됐는가 | 마지막 Anchor·현재 Draft·폐기 이유 | Anchor 재개·Draft 복구/재작성 |

## 4. 공용 패턴 적용

| Pattern ID | 판정 | GRIMOIRE 적용 |
|---|---|---|
| `UXP-STATUS-VISIBILITY` | ADOPT | 작성·인식 중·후보 확인·문법 판정·발동 단계를 분리 |
| `UXP-ACTION-FEEDBACK` | ADOPT | stroke 접수와 최종 인식 결과를 별도 표시 |
| `UXP-PREDICT-BEFORE-COMMIT` | ADOPT | 마나·재료·위험·불확실성을 발동 전에 표시 |
| `UXP-PROGRESSIVE-DISCLOSURE` | ADAPT | 실제 사용 순간에 규칙을 한 층씩 공개하고 용어집 재열람 제공 |
| `UXP-COMPARABLE-CHOICES` | ADAPT | 인식 후보와 주문 후보를 같은 축으로 비교 |
| `UXP-SAFE-REVERSAL` | ADOPT | stroke·글자·조립 단계별 실행 취소와 초기화 구분 |
| `UXP-ERROR-RECOVERY` | ADOPT | 인식 실패, 문법 오류, 비용 부족, 대상 부적합을 서로 다른 원인으로 표시 |
| `UXP-MULTI-CHANNEL-CUES` | ADOPT | 색 외에 글자 위치·형태·문구·아이콘·로그 사용 |
| `UXP-RETURNING-PLAYER-MEMORY` | ADAPT | 최근 주문·현재 학습 단계·마지막 Resume Anchor 요약 |
| `UXP-CAUSAL-RECAP` | ADOPT | 입력→인식→문법→비용→효과의 인과 로그 |
| `UXP-EMPTY-LOCKED-FALLBACK` | ADOPT | 미해금 글자·빈 슬롯·누락 자산에서 조건과 다음 행동 표시 |

## 5. 핵심 오류 분류

| 오류 | 의미 | UI가 보여 줄 것 | UI가 하지 않을 것 |
|---|---|---|---|
| 입력 인식 실패 | 작성한 형태를 확정하지 못함 | 후보·신뢰도·문제 stroke·재작성 | 주문 문법 오류로 오인 |
| 인식 오선택 | 다른 글자로 읽음 | 선택 후보와 원본 stroke 비교 | 자동 확정 숨기기 |
| 문법 오류 | 글자 관계가 규칙에 맞지 않음 | 충돌 위치·필요 조건·수정 방향 | 인식기를 다시 실행 |
| 비용 부족 | 유효하지만 실행 자원 부족 | 부족량·확보 경로 | 주문 자체를 잘못됐다고 표시 |
| 효과 실패/저항 | 실행됐지만 결과가 제한됨 | 대상 상태·저항·소비 자원 | 입력 실패로 되돌림 |
| 중단된 획 | App 중단·system gesture로 stroke가 완결되지 않음 | 보존/폐기 상태와 다시 쓰기 | 임의로 글자 확정 |
| 오래된 요청 | 복귀 뒤 이전 recognition 결과가 도착 | 요청 무효화와 현재 Draft 상태 | 중복 Candidate·Commit 생성 |

## 6. 모바일 입력·접근성

- 작성 영역과 스크롤·이동 제스처를 분리한다.
- stroke 입력 중 화면 이동·버튼 오입력을 방지한다.
- undo는 마지막 stroke, 글자 삭제, 전체 초기화를 서로 다르게 표시한다.
- 인식 후보는 색만이 아니라 이름·형태·순위·확신 문구로 구분한다.
- 선택형 작성 감속을 제공하고 사용에 보상 불이익을 두지 않는다.
- App background·OS interruption·blocking tutorial 동안 시간은 정지한다.
- 음향·진동·모션을 꺼도 인식과 오류 상태가 유지된다.
- 긴 한국어 설명은 핵심 규칙과 상세 예시를 점진 공개한다.
- 같은 문제에서 확인한 글자는 Token 재선택을 허용해 반복 필기 피로를 줄인다.

## 6A. GM-MOBILE-ORIENTATION-01

Mobile Vertical Slice의 핵심 화면은 `Landscape 고정`이다.

```text
Landscape Main
→ Landscape Field / Dialogue / Schedule
→ Landscape Writing Overlay
→ Landscape Battle
→ Landscape Result
→ Landscape Field Return
→ Landscape Grimoire
```

적용 규칙:

- Portrait Gameplay와 자동 회전은 Vertical Slice 범위에서 제외한다.
- Portrait 상태 진입 시 Landscape 전환 안내를 제공한다.
- 회전·창 크기 변경은 시전·보상·저장 Event의 권위 시점이 아니다.
- 기존 16:9 화면은 Landscape 파생 기준이지만 Mobile 실기기 적합성 통과 증거가 아니다.
- 필수 목표·적 위험·자원·Timer·확정 버튼은 Safe Area 안에서 동시에 판독돼야 한다.
- 우측 Writing Panel은 적과 경고를 가리지 않아야 하며, 축소 Rail과 확장 Canvas의 상태 차이를 명시한다.
- 지원 Aspect Ratio·logical Canvas·Text scale·Touch target·letterbox/crop은 `TEST_VALUE`로 작성 후 기기 검증한다.
- Portrait Grimoire나 혼합 방향은 후속 별도 Decision 없이는 추가하지 않는다.

## 6B. Resume·Save UI 계약

```text
Draft → Recognizing → Candidate → Committed → Resolved → Recorded
```

- 마지막 완료 Resume Anchor와 현재 임시 상태를 구분해 표시한다.
- `Committed` 이후 시전·마나 소모는 한 번만 발생한다.
- `Resolved` 이후 보상·Result는 한 번만 발생한다.
- `Recorded` 이후 마도서 기록은 한 번만 저장한다.
- 중단된 stroke와 오래된 recognition은 안전하게 폐기하고 이유를 표시한다.
- 복구 불가능한 Draft는 마지막 Anchor로 되돌리되 이미 확정된 결과를 되감지 않는다.

## 7. Godot 구현 경계

```text
입력 stroke
→ 인식 시스템 결과
→ UI 후보 표시와 사용자 선택
→ 주문 규칙 시스템 판정
→ UI 유효성·비용·예상 결과 표시
→ 발동 요청 Signal
→ 전투/주문 도메인 처리
→ 결과 Event
→ 인과 복기 UI
```

금지:

- UI가 인식 점수나 주문 문법을 별도로 계산
- 애니메이션 종료 시점에 마나·피해를 지급
- 인식 실패와 주문 설계 실패를 같은 오류 상태로 합침
- 화면 회전 이벤트로 시전·보상·저장 확정
- 프로젝트의 기존 입력·Theme 구조 조사 없이 범용 필기 프레임워크 추가

## 7A. UI 모션·중단·반복 계약

```text
입력 접수 → 처리 중 → 도메인 결과 확정 → 결과 표현
```

- 글자 작성·후보 선택·주문 조립·발동·결과·마도서 기록 모션은 중단과 즉시 완료 경로를 가진다.
- 빠른 반복·재진입에서 stroke·후보·비용·불안정도·결과·기록이 중복되지 않아야 한다.
- `AnimationPlayer`·`Tween` 완료 signal은 인식·문법·비용·전투·저장·기록 결과의 권위 시점이 아니다.
- `Reduced Motion`, `mute`, `haptic-off`에서도 인식 상태·오류 종류·비용·위험·결과 원인·다음 행동을 보존한다.
- 실제 입력·인식·Mobile 성능·사람 이해는 `NOT_RUN` / `HUMAN_NOT_RUN`으로 유지한다.

## 8. 검증 매트릭스

| 증거 | 상태 | 통과 기준 |
|---|---|---|
| 문서·책임 경계 | PASS | 인식·문법·실행·중단 오류 분리 |
| 방향 Decision | USER_APPROVED | Landscape 고정과 Portrait 제외가 명시됨 |
| 제품 diff | PASS | 코드·Scene·data·asset 변경 없음 |
| Godot runtime | NOT_RUN | 실제 작성·후보·발동·Resume 흐름 실행 필요 |
| 모바일 실기기 | NOT_RUN | Safe Area·손가락 가림·오입력·지연 확인 필요 |
| Aspect·Text·Touch | NOT_RUN | 최소 기기군에서 목표·위험·작성 동시 판독 |
| 사람 이해 | HUMAN_NOT_RUN | 오류 종류와 수정·재개 행동을 도움 없이 설명 |
| 접근성 사용자 | HUMAN_NOT_RUN | 감속·대체 입력·시각·청각 폴백 검증 필요 |

## 9. 공용 승격과 프로젝트 전용

### Base 공용으로 유지

- 입력 인식과 도메인 유효성의 분리
- 점진 공개·오류 복구·결과 인과·다중 채널
- UI가 권위 규칙을 소유하지 않는 계약
- 중단·재개에서 Commit·Reward·Save 중복 금지

### GRIMOIRE 전용

- 마법 글자 형태·stroke·문법·주문 조합
- Landscape Writing/Battle 정보 위계
- 실제 인식 알고리즘·신뢰도·마나·효과 수치
- 모바일 필기 영역과 학습 단계

## 10. 다음 게이트

1. Landscape 지원 Aspect·Safe Area·Touch 정보 위계 후보 작성.
2. Resume Anchor·Draft 저장 소유권 명세.
3. 정상·애매한 입력·오인식·문법 오류·비용 부족·중단 fixture 작성.
4. 첫 글자→첫 유효 주문→첫 실패 복기의 Vertical Slice 검증.
5. 실제 플레이 전 점진 공개·Touch target·Canvas·감속 수치는 `TEST_VALUE` 유지.
