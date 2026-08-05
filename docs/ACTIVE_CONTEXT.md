# GRIMOIRE Active Context

## 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/star-circuit-runtime-godot-poc
working_pull_request: 69
platform: MOBILE_LANDSCAPE_FIXED
current_working_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION
latest_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
canon_status: SYNCED_TO_WORKING_BRANCH_MERGE_AUTHORIZED
product_project: CREATED
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_validation: NOT_RUN
full_vertical_slice_representativeness: NOT_RUN
numeric_status: PLAYTEST_TUNING_REQUIRED
```

## 구현된 핵심 루프

```text
조사 → 의도 → FIVE_POINT_STAR 회로 → 회로 Preview → 대상 키워드 → 최종 성공률·마나·위험 Preview → 명시 Commit → 결과 설명 → 복기
```

- `FIVE_POINT_STAR`: 중앙 메인 1개, 동등 외곽 보조 0~5개, Target node 금지.
- 숙련도·복잡도·PRECISION·REDUCTION과 성공률 5~98 Clamp.
- 같은 glyph_id Typed Stock, Vault, Mana, 결과 Exactly-once Commit.
- Commit 전 Cancel·검증 실패·중복 Commit 추가 소비 0.
- Low-fi Landscape Harness: 숙련도·Breakdown·Warning·Mana 부족·불안정·접근성 입력 상태.
- 결과 Policy: `FULL_SUCCESS`, `PARTIAL_SUCCESS`, `IMPERFECT_EXECUTION`, `FAILURE`, `BACKLASH`; 원인 글자·새 정보·다음 기회 필수.
- 집중 필사: 0.25 Active Pressure, 실제 시간 Mana, 같은 glyph_id Stock +1, 취소·중단 무환불·무생성.
- Frostbloom: 시설 복구·생명 구조·정령 안정화·봉쇄 철수·제압 시간 확보·합리적 미등록 해결.

## 자동 검증

```yaml
implementation_green_head: f3187672bc18c989052d9e3f84a5306a272d9083
star_runtime_run: 31053300711
planning_base_adversarial_run: 31053301043
godot_toolchain_run: 31053300879
platform_rights_run: 31053300688
godot_suites: 31
assertions: 1137
failures: 0
godot_version: 4.7.1.stable.official.a13da4feb
export_templates: PASS
sheet_readback: PASS
```

## 적대 검토 결과

기존 별형 Commit이 범용 Stock을 사용해 다른 glyph_id를 대체할 수 있던 정본 불일치를 발견했다. 활성 별형 경로를 `TypedGlyphStockPool`로 마이그레이션하고 다른 글자 재고 대체를 회귀 테스트로 차단했다. 또한 Wireframe·부분 성공/실패/역류·집중 필사·Frostbloom UX가 계획에만 남아 있던 누락을 승인 문서·Runtime·Fixture·Suite로 닫았다.

## 남은 경계

실제 Android/iOS 기기, Narrow/Tall Landscape, Touch·Stylus, 손가락 가림, Text130%, Screen Reader, 프레임 성능, 사람 핵심 재미·실패 공정성·Frostbloom 이해도와 Full Vertical Slice 대표성은 `NOT_RUN`이다. 자동 테스트를 사람·출시 PASS로 승격하지 않는다.
