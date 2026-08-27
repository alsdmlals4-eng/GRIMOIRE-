# Task11 · Product Root Visual Surface

```yaml
issue: 204
status: APPROVED_IMPLEMENTATION_SCOPE
goal: Reuse the persisted IMG-02 greenhouse background and existing Academy theme in the current Product Root.
player_experience: The first writing screen reads as a magical greenhouse practicum rather than a generic gray debug form.
consumer:
  scene: res://src/ui/spell_workflow/spell_workflow_product_root.tscn
  asset: res://assets/art/backgrounds/greenhouse/bg_greenhouse_field_base.webp
  asset_status: PERSISTED_CANDIDATE_TO_CURRENT_RUNTIME_CONSUMER
keep:
  - 글자 → 주문 → 대상 → 시전 → 결과
  - live Korean labels and all transaction authority
  - existing 512px glyph resolver and display-only state policy
exclude:
  - new image generation
  - IMG-03 overlays, portraits, enemies, and scene-flow expansion
  - recognition, Stock, circuit, target, Mana, or cast behavior changes
evidence_limit:
  - HUMAN_DEVICE_PERFORMANCE_EXPORT_NOT_RUN
```

## 검수 근거

2026-08-27 Hera 1280×720 Product Root 첫 화면은 기능·입력 크기·클리핑 면에서는 오류가 없었지만, 회색 기본 Panel/Button 표면이 승인된 Navy/Gold Magic Academy UI 언어를 전달하지 못했다. `bg_greenhouse_field_base.webp`는 이미 프로젝트 로컬에 존재하지만 Product Root 소비처가 없었다.

## 최소 구현 계약

1. Product Root의 가장 뒤에 background TextureRect와 비상호작용 readability veil을 둔다.
2. `GrimoireThemeFactory`를 Product Root theme로 적용한다.
3. Theme factory의 기본 PanelContainer/Button surface를 navy/gold family로 정의해 현재 세 workflow 화면이 동일한 live theme를 받게 한다.
4. background는 글자 단계의 온실 실습 맥락을 주는 장식이며, 상태·수치·정답·target/cast 결과를 표현하지 않는다.

## Acceptance

- `bg_greenhouse_field_base.webp`가 Product Root scene의 실제 Texture2D consumer다.
- 배경은 UI 위계와 터치 입력을 가리지 않는다.
- legacy gray default Panel/Button surface가 Academy navy/gold surface로 교체된다.
- 흐름과 authority를 검증하는 integration test가 계속 통과한다.
- Hera 1280×720 screenshot과 diagnostics를 다시 확인한다.
