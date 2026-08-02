# GRIMOIRE 적대적 총기획 감사 — 2026-08-02

```yaml
audit_id: GR-TOTAL-PLANNING-AUDIT-20260802-01
status: AUDIT_IN_PROGRESS_FIRST_GRILL_ME_RESOLVED
mode: TOTAL_PLANNING
baseline_main: 92c77e7fdeafb92a15efc868f962a0a12f78861e
primary_platform: Mobile
follow_up_platform: PC
mobile_orientation_decision: GM-MOBILE-ORIENTATION-01
mobile_orientation: LANDSCAPE_FIXED
current_gate: MOBILE-FOUNDATION-01
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
human_playtest: NOT_RUN
```

## 1. 감사 목적

승인된 프로젝트 코어·Vertical Slice·전투·아트·Asset Spec을 보호하면서 Mobile-first 전환 이후 생긴 기획 충돌, 빠진 상태 계약, 제작·접근성 위험을 찾는다.

분류:

- `AUTO_FIX_ELIGIBLE`: 사용자 방향을 바꾸지 않는 누락·명확화.
- `USER_DECISION_REQUIRED`: 화면·경험·범위를 다르게 만드는 핵심 선택.
- `RESEARCH_OR_TEST_REQUIRED`: 수치·피로·성능·재미처럼 실행 증거가 필요한 항목.

## 2. 보호할 강점

- 플레이어 약속: 글자의 의미를 배우고 직접 설계한 주문으로 세계를 바꾸는 마법학교 RPG.
- `흐름 / 집중 / 분산`과 복수 해법·설명 가능한 결과.
- 수업→시험→축제→현장→귀환의 성장·응용 구조.
- 적 HP 처치보다 불안정도 0 진정·상황 해결을 우선하는 전투.
- 입력 실패·문법 실패·상황 설계 실패·비용 부족의 분리.
- Soft Storybook 배경·Anime Cel 캐릭터·Navy/Gold UI·Blue Glyph.
- 목표 45~50분, 콘텐츠 상한 53분, 하드 상한 60분.
- 제품 구현 `NOT_STARTED`; 미실행 검증을 완료로 올리지 않는 경계.

## 3. Finding Ledger

| ID | 유형 | 확인된 문제 | 분류 | 심각도 | 처리 | 상태 |
|---|---|---|---|---|---|---|
| GR-TPA-01 | PLANNING_CONFLICT | Mobile 방향 미확정과 `가로형 3/4·16:9` 활성 소비자 충돌 | USER_DECISION_REQUIRED | P0 | `GM-MOBILE-ORIENTATION-01 / LANDSCAPE_FIXED` 승인 | RESOLVED_BY_USER_APPROVAL |
| GR-TPA-02 | UNDERDESIGN | 46분 흐름에 Mobile 중단·재개용 세션 구획·자동 저장 지점·이어하기 계약 없음 | AUTO_FIX_ELIGIBLE | P1 | 주요 콘텐츠 경계 Resume Anchor와 원자적 자동 저장 | RECOMMENDED_DEFAULT |
| GR-TPA-03 | DATA_COMPATIBILITY_RISK | Draft·후보·시전·보상·마도서 기록의 중단 시 저장 단위·폐기 기준 부족 | AUTO_FIX_ELIGIBLE | P1 | `Draft / Recognizing / Candidate / Committed / Resolved / Recorded` 상태 계약 | RECOMMENDED_DEFAULT |
| GR-TPA-04 | ACCESSIBILITY_RISK | Active Timer와 직접 필기가 운동·인지 부하를 전투 난이도로 전이할 위험 | RESEARCH_OR_TEST_REQUIRED | P1 | 선택형 감속·중단 정지·무패널티 접근성 옵션 검증 | TEST_REQUIRED |
| GR-TPA-05 | PLAYER_EXPERIENCE_RISK | 성공 7회·복구 포함 10회가 Mobile 손 피로와 반복감으로 변할 가능성 | RESEARCH_OR_TEST_REQUIRED | P1 | 확인 Token 재선택과 실제 피로 측정 | TEST_REQUIRED |
| GR-TPA-06 | UNDERDESIGN | `CALM / PREPARED / CONNECTED`의 적용·소멸·중복 규칙 없음 | AUTO_FIX_ELIGIBLE | P2 | 다음 Challenge 1회 한정 동등 가치 효과 | RECOMMENDED_DEFAULT |
| GR-TPA-07 | PRODUCTION_RISK | 방향 결정 전 Grimoire/Main 상세 레이아웃 잠금 시 재작업 가능성 | AUTO_FIX_ELIGIBLE | P1 | Landscape 기준 파생 재개, 세부 비율은 Mobile Foundation에서 검증 | UNBLOCKED_WITH_BOUNDARY |
| GR-TPA-08 | UNDERDESIGN | Android/iOS·Store·최소 기기·성능 목표 미확정 | RESEARCH_OR_TEST_REQUIRED | P2 | Build·성능 Gate 전 사용자 패킷과 기기 Matrix | DEFERRED_WITH_BOUNDARY |
| GR-TPA-09 | STALE_REFERENCE | 과거 PC 입력 정본이 신규 기획에서 기본값으로 복사될 위험 | AUTO_FIX_ELIGIBLE | P2 | 활성 입력은 Touch·Stylus, PC는 후속 호환 부록 | SHOULD_FIX |

## 4. 승인된 첫 Grill Me

### GM-MOBILE-ORIENTATION-01

- Mobile Vertical Slice 핵심 화면: `Landscape 고정`.
- Portrait Gameplay: Vertical Slice 제외.
- Runtime 자동 회전: Vertical Slice 제외.
- Main·Field·Dialogue·Schedule·Writing·Battle·Result·Grimoire·Settings를 같은 방향으로 통일.
- 기존 16:9 자료는 Landscape 파생의 기준으로 보존하지만 Mobile 품질 통과 증거로 자동 승격하지 않음.
- 지원 Aspect Ratio·Safe Area·Touch target·Canvas·Text scale은 `MOBILE-FOUNDATION-01`에서 시험값과 검증 계획으로 작성.

책임 원본: `docs/planning/MOBILE_ORIENTATION_01_APPROVAL_2026-08-02.md`.

## 5. 자동 적용할 권장 기본안

다음은 프로젝트 방향을 바꾸지 않으므로 이후 기획 문서에 `RECOMMENDED_DEFAULT` 또는 `TEST_VALUE`로 작성한다.

### 5.1 Mobile 세션·Resume Anchor

전체 46분 목표와 콘텐츠 순서는 유지한다.

```text
첫 수업·교내 연습
→ Resume Anchor A
→ 자유일정 A·실기시험
→ Resume Anchor B
→ 자유일정 B·학교축제
→ Resume Anchor C
→ 자유일정 C·현장 전투
→ Resume Anchor D
→ 현장 환경 해결·귀환·마도서 기록
```

- 핵심 장면 경계에서 자동 저장.
- 진행 중 작성 Draft는 복구 가능한 임시 상태로 저장하거나 안전하게 폐기하고 이유를 표시.
- Commit·Reward·Result·Record는 각각 한 번만 확정되는 idempotent 처리 계약.
- 이어하기는 마지막 완료 Anchor 또는 복구 가능한 현재 단계에서 시작.
- 전투 중단 시 적 공격과 입력 인식의 선후 관계를 복원 가능한 Event 순서로 기록.

### 5.2 자유일정

- `CALM`: 다음 Challenge에서 입력 복구·감속 보조 접근성을 강화.
- `PREPARED`: 다음 Challenge의 조건·위험 미리보기 정보를 강화.
- `CONNECTED`: 다음 Challenge 전후 인물 반응·대안 관점을 강화.
- 효과는 다음 핵심 Challenge 1회 후 소멸.
- 유일 해법, 필수 정보, 영구 능력, 장기 최적 루트를 독점하지 않음.
- 세 선택의 제작량과 효용 규모를 동등하게 유지.

### 5.3 직접 작성·전투 시험값

- 승인된 `판단·작성 중 진행 / 시스템 해결 중 정지` 유지.
- 일반 작성 `1.0×`, 선택형 감속 초기 후보 `0.5×`는 `TEST_VALUE`.
- App background·OS interruption·blocking tutorial에서는 `0×`.
- 감속 사용에 보상 불이익을 두지 않음.
- 같은 문제에서 확인한 글자는 Token 재선택 허용.
- 신규·미숙·중요 결정만 직접 작성 우선.

## 6. 분야 간 충돌 판정

| 대조 | 판정 | 이유 |
|---|---|---|
| 플레이어 약속 ↔ Core Loop | NO_CONFLICT | 직접 작성→의미 조합→세계 변화→기록이 일치 |
| Core Loop ↔ 전투 | NO_CONFLICT_WITH_TEST_RISK | 상황 해결형 전투는 코어와 일치하나 Mobile 필기 피로 검증 필요 |
| Mobile 우선 ↔ 승인 16:9 화면 | RESOLVED_WITH_REVALIDATION | Landscape 고정 승인; 16:9 자료는 기준으로 보존하되 실기기 재검증 |
| 46분 Slice ↔ Mobile 사용 맥락 | SHOULD_FIX | 콘텐츠 축소보다 Resume Anchor로 중단 가능 구조 보완 |
| 자유일정 ↔ Challenge | NEEDS_IMPROVEMENT | 태그 의도는 있으나 정확한 적용 계약 필요 |
| Grimoire/Main ↔ Mobile 방향 | UNBLOCKED | Landscape 기준 정보 구조·레이아웃 기획 가능 |
| Active Timer ↔ 접근성 | TEST_IN_VERTICAL_SLICE | 감속·중단·피로를 실기기로 검증 |
| 기획 ↔ 구현 | NO_IMPLEMENTATION_YET | 구현 전 계약 단계 |

## 7. 다음 Grill Me 원칙

- 한 번에 하나의 독립적인 중요 결정만 묻는다.
- OS·Store 우선순위는 관련 벤치마킹·기기 범위와 함께 별도 질문한다.
- 핵심 경험을 바꾸지 않는 Touch target·Canvas·감속·저장 지점·성능 수치는 권장 시험값으로 작성하고 플레이테스트로 조정한다.
- 새로운 질문은 실제 기획 충돌이나 제품 범위 분기가 확인될 때만 사용한다.

## 8. 현재 판정

```text
RESOLVED_USER_DECISION = GR-TPA-01 / GM-MOBILE-ORIENTATION-01
AUTO_FIX_ELIGIBLE = GR-TPA-02 / 03 / 06 / 07 / 09
RESEARCH_OR_TEST_REQUIRED = GR-TPA-04 / 05 / 08
NEXT_PLANNING_WORK = MOBILE RESUME·SAVE OWNERSHIP·LANDSCAPE INFORMATION ARCHITECTURE
CODEX = BLOCKED
PRODUCT_IMPLEMENTATION = NOT_STARTED
```

Landscape 기준 상세 기획은 진행할 수 있다. Runtime·Mobile device·Performance·Accessibility·Human 검증은 계속 `NOT_RUN`이다.
