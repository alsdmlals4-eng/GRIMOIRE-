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
