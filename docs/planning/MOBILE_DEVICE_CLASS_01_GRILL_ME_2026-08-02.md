# GM-MOBILE-DEVICE-CLASS-01 — Mobile 기기 범위 Grill Me 결과

```yaml
decision_id: GM-MOBILE-DEVICE-CLASS-01
status: RESOLVED_USER_APPROVED
resolved_date: 2026-08-02 KST
approved_option: A
parent_gate: MOBILE-FOUNDATION-01
authority: docs/planning/MOBILE_DEVICE_CLASS_01_APPROVAL_2026-08-02.md
```

## 질문

Vertical Slice에서 Smartphone과 Tablet을 어떤 지원 범위로 볼 것인가?

## 승인 결과

사용자가 `권장안대로 진행`으로 A안을 승인했다.

```text
Smartphone Landscape = 필수 지원·정식 품질 Gate
Tablet 4:3·3:2 = Best-effort Smoke Test
Tablet 전용 Layout·정식 지원 = Vertical Slice 이후 별도 Decision
```

Smartphone 필수 검증 후보:

- `16:9`.
- `18:9`.
- `19.5:9`.
- `20:9`.
- 좌·우 Cutout.
- 하단 System indicator·gesture 영역.

Tablet은 실행·Safe Area·핵심 정보 판독·기본 Touch·저장 중단복귀만 확인하며 Smartphone과 동일한 품질을 약속하지 않는다.

상세 계약과 승인 추적은 `docs/planning/MOBILE_DEVICE_CLASS_01_APPROVAL_2026-08-02.md`를 따른다.
