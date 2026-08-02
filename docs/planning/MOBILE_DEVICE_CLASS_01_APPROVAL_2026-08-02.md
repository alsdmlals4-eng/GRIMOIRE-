# GM-MOBILE-DEVICE-CLASS-01 — Mobile 기기 범위 승인

```yaml
decision_id: GM-MOBILE-DEVICE-CLASS-01
status: USER_APPROVED_ACTIVE
date: 2026-08-02 KST
approved_option: A
parent_gate: MOBILE-FOUNDATION-01
primary_quality_gate: SMARTPHONE_LANDSCAPE
tablet_scope: BEST_EFFORT_SMOKE_TEST_ONLY
tablet_official_support: NOT_PROMISED_IN_VERTICAL_SLICE
foldable_multi_window: OUT_OF_VERTICAL_SLICE
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
human_playtest: NOT_RUN
```

## 1. 승인 결론

Vertical Slice의 필수 지원·품질 Gate는 **Smartphone Landscape**로 한정한다.

Tablet은 앱 실행, Safe Area, 핵심 정보 판독, 기본 Touch 접근성을 확인하는 Best-effort Smoke Test 대상으로 남기되, Smartphone과 동일한 완성도·레이아웃·정식 지원을 약속하지 않는다.

## 2. Smartphone 필수 Aspect Matrix

다음 항목은 Layout·Safe Area·Touch 검증의 필수 후보로 사용한다.

```text
16:9
18:9
19.5:9
20:9
좌측 Cutout
우측 Cutout
하단 System indicator / gesture 영역
```

필수 검증:

1. 목표·치명 위험·Timer·HP·마나·불안정도 가림 0.
2. 작성 획·후보·오류 원인·Undo·취소·`[구현]` 접근 가능.
3. 핵심 Touch target 하한 위반 0.
4. Writing Rail→Full Panel 전환 중 핵심 위험 가림 0.
5. UI/Text Scale `130%` 후보에서도 핵심 행동 접근 가능.
6. 좌·우 Cutout과 System gesture 영역에 핵심 Control 겹침 0.

`16:9 / 18:9 / 19.5:9 / 20:9`는 기획 검증 Matrix이며, 특정 해상도·최소 기기·성능 합격을 자동 의미하지 않는다.

## 3. Tablet Best-effort Smoke Test

Tablet 후보:

```text
4:3
3:2
```

확인 범위:

- 앱 실행과 Landscape 고정.
- Safe Area와 Cutout 처리.
- 목표·위험·상태·작성·확정 정보가 화면 밖으로 사라지지 않음.
- 기본 Touch 조작이 불가능하지 않음.
- 저장·중단복귀 상태가 Smartphone 계약과 충돌하지 않음.

이번 Vertical Slice에서 약속하지 않는 것:

- Tablet 전용 4:3·3:2 재배치.
- Tablet 전용 정보 밀도·Canvas 확대 규칙.
- Smartphone과 동일한 시각 품질·Touch 도달성·성능 합격.
- Store·홍보 문구의 Tablet 정식 지원 표기.

Tablet Smoke Test 실패는 기록하고 후속 Tablet Decision의 근거로 사용한다. 단, 공통 저장 손상·중복 Commit·핵심 입력 불능처럼 Smartphone에도 영향을 주는 구조 결함은 Smartphone Gate 문제로 승격한다.

## 4. 제외 범위

- Foldable 전용 상태 변화.
- Multi-window·분할 화면.
- Portrait Tablet Gameplay.
- Tablet 전용 Stylus 최적화.
- Desktop-class Tablet UI.
- Tablet 정식 출시 약속.

이 항목은 별도 Decision과 제작·QA 근거 없이 활성 범위에 추가하지 않는다.

## 5. 기존 계약에 미치는 영향

### GM-MOBILE-LANDSCAPE-UX-FOUNDATION-01

- 상태를 `PARTIAL_CONTRACT_ACTIVE_DEVICE_CLASS_DECIDED`로 진행할 수 있다.
- Smartphone 필수 Aspect Matrix가 확정됐다.
- Writing Rail/Panel 비율, 48/56 UI unit, UI/Text Scale은 계속 `TEST_VALUE`다.
- Tablet 4:3·3:2는 필수 품질 Gate가 아니라 Smoke 기록이다.

### GM-MOBILE-SESSION-RESUME-SAVE-01

- 기기군과 무관한 공통 상태·Transaction 계약을 유지한다.
- Tablet Smoke에서도 저장 손상·중복 반영 여부를 확인한다.

## 6. 다음 작업

```text
Smartphone Landscape Writing/Battle Wireframe 계약
→ Android/iOS·Store·최소 기기·성능 Decision Packet
→ MOBILE-FOUNDATION-01 통합 승인
→ 구현 계획
```

제품 구현·Godot Scene·Script·Resource·Asset 제작은 계속 금지한다.

## 7. 승인 추적

```yaml
user_response: 권장안대로 진행
approved_option: A
resolved_document: docs/planning/MOBILE_DEVICE_CLASS_01_GRILL_ME_2026-08-02.md
authority_document: docs/planning/MOBILE_DEVICE_CLASS_01_APPROVAL_2026-08-02.md
```
