# GRIMOIRE 첫 12분 런타임 이미지 후보 묶음 R2 — 레이어 분리 — 2026-08-30

> 상태: `GENERATED_CANDIDATE_IN_REVIEW`
>
> 승인 요청: `USER_BATCH_REVIEW_AND_FINAL_RUNTIME_ASSET_APPROVAL_REQUIRED`
>
> 대상 흐름: 입학식 → 첫 수업 → 첫 지도 실습

## 1. 이번 사용자 결정

사용자는 배경에 남아 있는 글자와 마법 흔적을 원하지 않았다. 이에 따라 이 묶음은 다음의 **엄격한 레이어 분리**를 채택한다.

```text
EnvironmentBackground (글자·마법 흔적 없음)
  → SituationLayer (마법 상태가 없는 대상 오브젝트)
    → MagicWritingOverlay (투명, 필요할 때만)
      → live Godot UI / 실제 인식된 글자 / Preview / 시전 / 결과
```

따라서 입학 홀·교실 온실·묘목·지지대는 어느 상태에서도 글자나 주문 효과를 품은 원화가 아니다. 실제 `FLOW` 등의 의미, 판정 결과, 대상·성공률·Mana·시전은 정적 이미지가 아닌 게임의 입력/상태/UI가 소유한다. 오버레이 후보는 분위기를 돕는 비의미적 잉크 질감일 뿐, 어떤 글자나 정답도 미리 보여 주지 않는다. 첫 광량 큰 오버레이 변형은 실제 alpha는 유효했지만 "글자가 퍼지는 느낌"을 피하기에 과도하여 manifest에 `SUPERSEDED_BY_RESTRAINED_OVERLAY_CANDIDATE_02`로 남겼다.

기존 R1의 네 후보는 삭제하지 않았다. 사용자 방향과 달리 글자 또는 마법 흔적이 원화에 포함되어 있었으므로 [R1 manifest](../../../assets/manifests/first_session_02_runtime_candidate_batch.json)에 `SUPERSEDED_BY_USER_DIRECTION__GLYPH_OVERLAY_SEPARATION`으로 남겼다.

## 2. R2 후보와 실제 소비처

| ID | 파일 | 실제 consumer | 시각 역할 | 상태 |
| --- | --- | --- | --- | --- |
| `FS-IMG-ADMISSION-002` | `assets/art/source_candidates/first_session_02/backgrounds/admission/bg_admission_hall_ceremony_candidate_02_environment_only.png` | `FirstSessionRoot/AdmissionCeremonyScreen/EnvironmentBackground` | 따뜻한 입학 홀만 제공한다. idle 시 글자 오버레이는 숨김이다. | `IN_REVIEW` |
| `FS-IMG-CLASS-002` | `assets/art/source_candidates/first_session_02/backgrounds/classroom/bg_classroom_water_channel_candidate_02_environment_only.png` | `FirstSessionRoot/FirstClassScreen/EnvironmentBackground` | 수로·식물·관찰 여백만 제공한다. 글자는 직접 입력 이후 별도 레이어에만 보인다. | `IN_REVIEW` |
| `FS-IMG-TARGET-001-R2` | `assets/art/source_candidates/first_session_02/targets/greenhouse/target_frost_seedlings_unstable_candidate_02_environment_only.png` | `FirstSessionRoot/FirstPracticumSituationLayer/SeedlingTarget` | 자연 서리만 남긴 투명 묘목 대상이다. 선택/마법 상태는 포함하지 않는다. | `IN_REVIEW` |
| `FS-IMG-TARGET-002-R2` | `assets/art/source_candidates/first_session_02/targets/greenhouse/target_greenhouse_support_unstable_candidate_02_environment_only.png` | `FirstSessionRoot/FirstPracticumSituationLayer/SupportTarget` | 물리적 마모만 남긴 투명 지지대·등불 대상이다. 선택/마법 상태는 포함하지 않는다. | `IN_REVIEW` |
| `FS-IMG-GLYPH-OVERLAY-001` | `assets/art/source_candidates/first_session_02/vfx/glyphs/fx_direct_air_glyph_overlay_candidate_02_restrained.png` | `FirstSessionRoot/MagicWritingOverlay/DirectAirGlyphAccent` | 실제 필기/Preview에 겹치는 투명 비의미적 잉크 accent. 기본은 숨김이며 두 개의 짧은 붓획만 사용한다. | `IN_REVIEW` |

정확한 해시, 해상도, alpha, generation locator, 사용 전제는 [R2 candidate manifest](../../../assets/manifests/first_session_02_runtime_candidate_layer_separation_02.json)가 소유한다.

## 3. 실행 중 합성 규칙

| 상태 | 배경 | 대상 | 글자 오버레이 | 의미/조작의 소유자 |
| --- | --- | --- | --- | --- |
| 입학식 idle | 표시 | 없음 | `HIDDEN` | live 안내 UI |
| 첫 수업 관찰 | 표시 | 환경 안 자연물 | `HIDDEN` | live 관찰 UI |
| 직접 필기 중 | 표시 | 환경 안 자연물 | `STROKE_RECEIVED` — 실제 입력 궤적에 짧게 | `GlyphInputScreen` |
| 글자 판정/회로 Preview | 표시 | 선택 가능 상태 | `CANDIDATE_RECOGNIZED` 또는 `PREVIEW` — 낮은 opacity | live 주문/Preview UI |
| 대상 선택/시전 결과 | 표시 | 두 대상 중 명시적으로 선택된 하나 | `RESULT` — fade 또는 low-motion 정지 | live target/Commit/result UI |

- `MagicWritingOverlay`와 배경은 `MOUSE_FILTER_IGNORE`로 두며, 장면 내 대상과 버튼만 명시적인 hit area를 갖는다.
- `FLOW`, `FOCUS`, `DISPERSE`, 성공률, Mana, 위험, 대상명, 시전 여부를 그림에 굽지 않는다.
- 투명 overlay는 플레이어 입력을 대신하거나, 독립된 주문 이름·표식·정답처럼 읽혀서는 안 된다.
- 저감 모션에서는 overlay 이동을 짧은 fade 또는 정지 상태로 낮춘다.

## 4. 정적 QA와 적대적 재검토

| 점검 루프 | 공격 질문 | R2 결과 |
| --- | --- | --- |
| 1. 배경 경계 | 배경만 캡처해도 글자/주문 상태가 남는가? | 입학식·수업 배경에는 글자·마법 궤적을 넣지 않음. |
| 2. 대상 경계 | 묘목/지지대가 발광 글자 때문에 정답처럼 읽히는가? | 자연 서리·물리 마모만 남김. 선택 표식은 live 상태가 소유. |
| 3. 의미 경계 | 오버레이가 실제 글자나 최종 주문을 미리 주장하는가? | 비의미적 추상 획만 사용; 실제 판정은 live UI가 소유. |
| 4. 기술 경계 | 투명 오브젝트와 overlay가 실제 alpha를 갖는가? | 대상 2개와 overlay의 모서리 alpha `0` 확인. 배경은 의도적으로 불투명. |
| 5. 입력 경계 | 장식 레이어가 대상/시전 입력을 가로막는가? | 계획상 모든 장식 레이어는 `MOUSE_FILTER_IGNORE`; scene/runtime 검증은 아직 미실행. |

위 결과는 생성 파일과 정적 레이어 검토만 뜻한다. Godot import, runtime 합성, 대상 hit area, UI contrast, 모바일 가독성, 성능, 사람 플레이는 모두 `NOT_RUN`이다.

## 5. 검토 및 승격 경계

사용자가 R2 다섯 후보를 최종 runtime 사용으로 승인한 뒤에만 아래 순서가 허용된다.

```text
USER_APPROVED
→ PROJECT_ASSET_APPROVED manifest/provenance promotion
→ canonical asset path에 non-destructive copy
→ FirstSession scenes의 explicit consumer binding
→ Godot import, source-candidate exclusion, overlay visibility/hit-area checks
→ automated and runtime validation
```

그 전까지 어떤 Godot scene도 이 source candidate 경로를 참조하지 않는다. R2는 배경·대상·오버레이의 분리를 검토하기 위한 **후보 묶음**이며, runtime 적용이나 W6 검증 완료를 뜻하지 않는다.
