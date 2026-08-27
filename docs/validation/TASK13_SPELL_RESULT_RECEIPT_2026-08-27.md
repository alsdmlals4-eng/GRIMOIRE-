# Task13 Spell Result Receipt Correction — 2026-08-27

```yaml
issue: 209
scope: RESULT_PANEL_PRESENTATION_ONLY
player_promise: "명시적으로 시전한 뒤, 실제 대상·사용 마력·결과를 영수증으로 확인한다."
excluded:
  - glyph_recognition
  - inventory_and_mana_calculation
  - target_selection
  - transaction_semantics
  - new_assets
evidence_ceiling: AUTOMATED_AND_RUNTIME_MACHINE_OBSERVATION_ONLY
```

## Incident → Solution → Lesson

1. **Incident:** `USED` 결과가 실제로는 `result.result.receipt`, `result.result.target_keyword`, top-level `mana_spent`를 반환했지만, Product Root는 존재하지 않는 `payload`를 읽었다. 따라서 결과 화면이 일반 문구만 표시하고 대상·비용 영수증을 숨겼다.
2. **Solution:** Result Panel은 도메인 결과를 다시 계산하지 않고 실제 반환 구조만 표시한다. `target_keyword`는 기존 target choice의 플레이어 표시명으로 변환하며, 영수증은 결과 문장·대상·사용 마력을 함께 표시한다.
3. **Lesson:** Slice의 최종 화면은 상태 코드만이 아니라 실제 display payload를 runtime에서 확인해야 한다. 결과 모델과 UI 소비 경로를 하나의 scene-flow 회귀 검사로 묶어 future fallback copy를 방지한다.

## Verification

- RED: 실제 완료 시전 scene-flow 검사에서 결과 문장·대상명·사용 마력 assertion 3건이 모두 실패했다.
- GREEN: Godot custom runner `47 suites / 2,000 assertions / 0 failures`.
- Runtime: Product Root의 정식 인식 → 저장 → 회로 → 대상 → 두 단계 시전 흐름이 `RESULT`로 전환됐고, receipt는 `보호막의 흔들림이 가라앉았습니다. / 대상: 흔들리는 보호막 / 사용 마력: 11`을 표시했다.

Human/device/performance/export validation remains `NOT_RUN`.
