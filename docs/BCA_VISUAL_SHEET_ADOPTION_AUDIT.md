
# Spell BCA v8 적용 적대적 검토

```yaml
base_commit: 7072b9e2742a60d7548fd39df3328ad76a8dbad1
project_sheet_status: NOT_CONFIGURED
product_paths_changed: false
final_status: CONFLICT_FIXED
```

- `MUST_FIX`: `PROTOTYPE_AND_VERTICAL_SLICE` 활성 단계 → `DEMO_FIRST_VERTICAL_SLICE`로 변경.
- `MUST_FIX`: v6 짧은 실행문·Master Manifest 활성 우선순위 → `LEGACY_COMPATIBILITY`로 격리.
- `MUST_FIX`: 오래된 Base pin과 CORE_POC 선행 표현 → v8·내부 `TECHNICAL_SPIKE` 호환으로 갱신.
- `MUST_FIX`: Sheet 의미 구조·이미지 검수 lifecycle·승인 원장 부재 → adapter 설치.
- `ALLOWED_LEGACY`: v6 파일과 과거 승인 시각 Decision은 이력·비교 근거로 보존.
- `BLOCKED_UNVERIFIED`: 실제 Sheet·생성 이미지·Godot 런타임·스토어 규격 검수.
