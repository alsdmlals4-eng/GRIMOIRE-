# GM-MOBILE-LANDSCAPE-UX-FOUNDATION-01 — Device Class Addendum

```yaml
parent_decision: GM-MOBILE-LANDSCAPE-UX-FOUNDATION-01
resolved_by: GM-MOBILE-DEVICE-CLASS-01
status: ACTIVE_WITH_SMARTPHONE_REQUIRED_MATRIX
date: 2026-08-02 KST
```

## 1. 기기 범위 반영

`GM-MOBILE-DEVICE-CLASS-01` 승인에 따라 Landscape UX 계약의 정식 품질 Gate는 Smartphone Landscape다.

필수 Aspect·환경 Matrix:

- `16:9`.
- `18:9`.
- `19.5:9`.
- `20:9`.
- 좌측 Cutout.
- 우측 Cutout.
- 하단 System indicator·gesture 영역.

Tablet `4:3 / 3:2`는 Best-effort Smoke Test이며 Tablet 전용 Layout이나 정식 지원을 의미하지 않는다.

## 2. Smartphone 축소·확장 규칙

Aspect가 좁아질수록 다음 순서로 대응한다.

1. 장식·비상호작용 VFX 축소.
2. 장문 설명·상세 로그 지연 공개.
3. 동반 정령·수호의 비핵심 세부 정보 축소.
4. 초상 장식 면적 축소.
5. 비핵심 Navigation Label 축약.

끝까지 보존:

- 목표와 치명 위험·Timer.
- HP·마나·불안정도.
- 작성 획·후보·오류 원인.
- Undo·취소·확정·`[구현]`.
- 저장·복구 상태.

넓은 Smartphone Aspect에서 여백이 생겨도 새로운 상시 정보 Panel을 추가하지 않는다. 중심 장면·작성 Canvas·호흡 공간에 우선 배분한다.

## 3. Tablet Smoke 판정

Tablet에서는 다음만 확인한다.

- 핵심 정보가 화면 밖으로 사라지지 않음.
- 핵심 Control이 Cutout·System 영역과 겹치지 않음.
- Touch 입력과 저장·중단복귀가 불가능하지 않음.
- Smartphone 계약과 충돌하는 공통 구조 결함이 없음.

Tablet 전용 정보 밀도·Canvas 확대·Touch 도달성 최적화는 후속 Decision이다.

## 4. 계속 시험값인 항목

다음은 기기 범위 승인 후에도 확정 수치가 아니다.

- 일반 Control `48 UI unit`.
- 핵심 Control `56 UI unit`.
- Rail `12~16%`.
- Compact Candidate `24~32%`.
- Full Writing `36~44%`.
- UI/Text Scale `100 / 115 / 130%`.
- 작성 감속 `1.0× / 0.5×`.
- 실제 Canvas 최소 크기.

이 값은 Smartphone Wireframe·Prototype·실기기·사람 검증으로 조정한다.

## 5. Gate 판정

```text
DEVICE_CLASS = USER_APPROVED_ACTIVE
REQUIRED_ASPECT_MATRIX = DEFINED_FOR_SMARTPHONE
TABLET = BEST_EFFORT_SMOKE_ONLY
SMARTPHONE_WRITING_BATTLE_WIREFRAME = NEXT
MOBILE-FOUNDATION-01 = IN_PROGRESS
CODEX = BLOCKED
PRODUCT_IMPLEMENTATION = NOT_STARTED
```
