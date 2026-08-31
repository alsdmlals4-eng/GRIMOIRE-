# GRIMOIRE Asset Rights and Provenance Record

> 자산별 복사본을 작성한다. 빈 Template은 실제 권리 증거가 아니다.

```yaml
asset_id:
category: MUSIC_SFX | FONT | CHARACTER_ILLUSTRATION | MODEL_3D_ANIMATION | PLUGIN_ASSET | OPEN_SOURCE_LIBRARY | AI_OUTPUT_MODEL_TERMS | OUTSOURCING_CONTRACT | VOICE_COMPOSER_TRANSLATOR_CONTRACT | OTHER
name:
project: GRIMOIRE
creation_route: OWNED_ORIGINAL | COMMISSIONED_ORIGINAL | LICENSED_THIRD_PARTY | OPEN_SOURCE | AI_GENERATED | REFERENCE_TO_ORIGINAL | MIXED_ROUTE
creator_or_vendor:
source_url_or_path:
source_checked_at:
acquired_or_created_at:
license_or_contract:
license_version_or_terms_date:
commercial_use: ALLOWED | CONDITIONAL | PROHIBITED | NOT_REQUIRED | UNKNOWN
distribution_in_game_build: ALLOWED | CONDITIONAL | PROHIBITED | NOT_REQUIRED | UNKNOWN
raw_source_redistribution: ALLOWED | CONDITIONAL | PROHIBITED | NOT_REQUIRED | UNKNOWN
modification: ALLOWED | CONDITIONAL | PROHIBITED | NOT_REQUIRED | UNKNOWN
attribution:
platform_or_territory_restrictions:
open_source_notice_or_source_obligation:
ai_model_service_version:
ai_terms_checked_at:
ai_input_rights:
ai_output_terms:
contract_scope:
voice_clone_or_ai_training_rights:
reference_sources:
reference_brief:
forbidden_expression:
final_asset_record:
reference_similarity_status: PASS | REVISION_REQUIRED | BLOCKED_UNVERIFIED | NOT_APPLICABLE
shipping_and_marketing_usage:
proof_reference:
proof_hash:
secure_original_location:
redacted_excerpt:
reviewed_by:
reviewed_at:
status: APPROVED | CONDITIONAL | REJECTED | RELEASE_BLOCKED_UNVERIFIED | SUPERSEDED
notes:
```

`commercial_use`, `distribution_in_game_build`, `raw_source_redistribution`, `modification`은 별개다. 필요한 값이 `UNKNOWN`이거나 조건 증거가 없으면 `RELEASE_BLOCKED_UNVERIFIED`다.

## Reference-to-original

```yaml
reference_only_input_excluded_from_build:
functional_or_general_principles_extracted:
identifiable_expression_removed:
project_specific_canon_applied:
independent_working_files:
comparison_set:
reviewer:
reviewed_at:
reference_similarity_status:
```

기능·회로 정보 위계·일반 형태·재질·주파수·타이밍·성능 원리만 분석한다. 마법진·Glyph·캐릭터·UI tracing, 음악 sample, mesh·texture·rig·font glyph 추출, 특정 작가·성우 모사, 원본 AI 변환은 독립 제작으로 인정하지 않는다.

공개 저장소에는 원계약서·신분증·서명·주소·계좌·결제·세금·개인정보를 넣지 않는다. `secure_original_location`, 최소 metadata, hash와 적법한 redacted excerpt만 기록한다.

## UI Kit v1 owned-original vector record

```yaml
asset_id: GR-UI-VECTOR-COMMON-01
category: OTHER
name: Star UI Kit v1 common vector elements
project: GRIMOIRE
creation_route: OWNED_ORIGINAL
creator_or_vendor: project-authored implementation
source_url_or_path:
  - assets/art/ui/common/icon_phase_diamond.svg
  - assets/art/ui/common/icon_warning_diamond.svg
  - assets/art/ui/common/icon_typed_stock.svg
  - assets/art/ui/common/icon_mana.svg
  - assets/art/ui/common/academy_corner_ornament.svg
source_checked_at: 2026-08-06
acquired_or_created_at: 2026-08-06
license_or_contract: project-owned source asset
license_version_or_terms_date: NOT_REQUIRED
commercial_use: ALLOWED
distribution_in_game_build: ALLOWED
raw_source_redistribution: ALLOWED
modification: ALLOWED
attribution: NOT_REQUIRED
platform_or_territory_restrictions: NONE
open_source_notice_or_source_obligation: NONE
ai_model_service_version: NOT_APPLICABLE
ai_terms_checked_at: NOT_APPLICABLE
ai_input_rights: NOT_APPLICABLE
ai_output_terms: NOT_APPLICABLE
contract_scope: NOT_APPLICABLE
voice_clone_or_ai_training_rights: NOT_APPLICABLE
reference_sources:
  - GRIMOIRE_INGAME_CHECKPOINT_BOARD_A_APPROVED_2026-08-03.png
  - GRIMOIRE_INGAME_CHECKPOINT_BOARD_B_APPROVED_2026-08-03.png
reference_brief: use only approved navy/gold/cyan hierarchy, geometric academy ornament principles, and functional state semantics
forbidden_expression: no tracing, no copied glyph silhouette, no copied character or environment illustration, no baked text, no third-party logo or font outline
final_asset_record: five independently authored simple SVG sources using polygon/path/circle/line primitives
reference_similarity_status: PASS
shipping_and_marketing_usage: in-game POC UI allowed; marketing use requires later final-art review
proof_reference:
  - PR #77 exact file history
  - tests/test_star_ui_kit_contract.py
proof_hash: TRACKED_BY_GIT_BLOB_SHA
secure_original_location: NOT_REQUIRED_PROJECT_REPOSITORY_IS_SOURCE
redacted_excerpt: NOT_APPLICABLE
reviewed_by: automated contract plus project adversarial review
reviewed_at: 2026-08-06
status: APPROVED
notes: approved Board A/B remain reference-only files and are not copied into Runtime assets
```

## Academy Hub Magic Writing Planning Reference — 2026-08-30

```yaml
asset_id: GR-REF-VIS-ACADEMY-HUB-MAGIC-WRITING-20260830-01
category: CHARACTER_ILLUSTRATION
name: Academy hub direct-air-writing planning reference
project: GRIMOIRE
creation_route: AI_GENERATED
creator_or_vendor: Codex built-in image generation
source_url_or_path: assets/reference/visual/GRIMOIRE_academy_hub_magic_writing_planning_reference_2026-08-30.png
source_checked_at: 2026-08-30
acquired_or_created_at: 2026-08-30
license_or_contract: OpenAI Terms of Use and applicable Service Terms; planning-reference scope only
license_version_or_terms_date: Terms of Use published 2026-01-01; Service Terms updated 2026-06-12; checked 2026-08-30
commercial_use: CONDITIONAL
distribution_in_game_build: CONDITIONAL
raw_source_redistribution: CONDITIONAL
modification: CONDITIONAL
attribution: NOT_CONFIRMED_FOR_RELEASE
platform_or_territory_restrictions: RELEASE_REVIEW_REQUIRED
open_source_notice_or_source_obligation: NOT_APPLICABLE
ai_model_service_version: Codex built-in image generation; exact underlying model/version not surfaced
ai_terms_checked_at: 2026-08-30
ai_input_rights: Final edit used only the project's preceding built-in generated candidate plus project-owned prompt/canon and user feedback; no third-party or user-provided image was supplied as a generation input.
ai_output_terms: As between the user and OpenAI, Terms of Use assign OpenAI's rights in Output to the user to the extent permitted by applicable law; output can be non-unique and the user remains responsible for input rights and output use.
contract_scope: Canonical planning reference for a future academy hub main-entry surface and human-blueprint visual anchor; excludes runtime import, shipping, store, marketing, character-identity, and functional-UI approval.
voice_clone_or_ai_training_rights: NOT_APPLICABLE
reference_sources:
  - docs/planning/visual/GRIMOIRE_WARM_ACADEMY_TONE_LOCK_2026-08-28.md
  - docs/planning/visual/GRIMOIRE_REPRESENTATIVE_SCREENS_2026-08-25.json
  - user direction in current Codex thread: warm academy hub; direct airborne glyph writing; remove empty UI frames
reference_brief: A learner-led warm academy hub that visibly holds class, practicum, training, and festival possibility. The researcher writes a small number of luminous glyph strokes into open air; the book is a quiet record/reference prop, not a magic emitter. Functional UI text and controls remain live UI.
forbidden_expression: No direct third-party image input, tracing, copied character identity/costume/silhouette, logo, watermark, baked functional text/numbers/buttons, empty ornamental UI frames, 3D exploration presentation, dark-mastermind framing, or greenhouse-as-the-entire-game framing.
final_asset_record: PNG 1672x941; repository reference file at assets/reference/visual/GRIMOIRE_academy_hub_magic_writing_planning_reference_2026-08-30.png; user approved 2026-08-30.
reference_similarity_status: PASS
shipping_and_marketing_usage: NOT_AUTHORIZED_BY_THIS_RECORD; complete release rights and similarity review before any shipping/store/marketing use.
proof_reference:
  - docs/planning/visual/GRIMOIRE_REPRESENTATIVE_SCREENS_2026-08-25.json
  - docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
  - https://openai.com/policies/row-terms-of-use/
  - https://openai.com/policies/service-terms/
proof_hash: 408183B4BDDBD73FAA603F76C03B7F086B91CD12366C9A78C6FA780825240E06
secure_original_location: PROJECT_REPOSITORY_REFERENCE_PATH_ABOVE; source-generation session remains outside the repository
redacted_excerpt: USER_APPROVED_2026-08-30; planning reference only; direct airborne glyph writing replaces book-emission magic.
reviewed_by: Codex visual QA plus user visual approval
reviewed_at: 2026-08-30
status: CONDITIONAL
notes: CANON_REGISTERED_PLANNING_REFERENCE_ONLY. This record does not promote the image to a Godot runtime asset, does not establish an asset batch, and does not change Human/Device/Performance/Accessibility/Export validation from NOT_RUN.
```

## Class Direct Glyph Learning Planning Reference — 2026-08-30

```yaml
asset_id: GR-REF-VIS-CLASS-DIRECT-GLYPH-LEARNING-20260830-01
category: CHARACTER_ILLUSTRATION
name: Class direct glyph learning planning reference
project: GRIMOIRE
creation_route: AI_GENERATED
creator_or_vendor: Codex built-in image generation
source_url_or_path: assets/reference/visual/GRIMOIRE_class_direct_glyph_learning_planning_reference_2026-08-30.png
source_checked_at: 2026-08-30
acquired_or_created_at: 2026-08-30
license_or_contract: OpenAI Terms of Use and applicable Service Terms; planning-reference scope only
license_version_or_terms_date: Terms of Use published 2026-01-01; Service Terms updated 2026-06-12; checked 2026-08-30
commercial_use: CONDITIONAL
distribution_in_game_build: CONDITIONAL
raw_source_redistribution: CONDITIONAL
modification: CONDITIONAL
attribution: NOT_CONFIRMED_FOR_RELEASE
platform_or_territory_restrictions: RELEASE_REVIEW_REQUIRED
open_source_notice_or_source_obligation: NOT_APPLICABLE
ai_model_service_version: Codex built-in image generation; exact underlying model/version not surfaced
ai_terms_checked_at: 2026-08-30
ai_input_rights: Generation used only project-owned prompt/canon and user-approved visual direction; no third-party or user-provided image was supplied as a generation input.
ai_output_terms: As between the user and OpenAI, Terms of Use assign OpenAI's rights in Output to the user to the extent permitted by applicable law; output can be non-unique and the user remains responsible for input rights and output use.
contract_scope: Canonical planning reference for a future direct-glyph learning class and human-blueprint key scene; excludes runtime import, shipping, store, marketing, character identity, professor identity, exact glyph semantics, and functional-UI approval.
voice_clone_or_ai_training_rights: NOT_APPLICABLE
reference_sources:
  - docs/planning/visual/GRIMOIRE_WARM_ACADEMY_TONE_LOCK_2026-08-28.md
  - docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
  - user batch approval in current Codex thread: approve the five-scene image batch
reference_brief: A safe magical academy class where a learner writes a few blue direct-air glyph strokes above a controlled water channel. The result is a small observable ripple and the professor invites observation rather than giving a correct answer. Functional UI text and controls remain live UI.
forbidden_expression: No direct third-party image input, tracing, copied character identity/costume/silhouette, logo, watermark, baked functional text/numbers/buttons, grade/exam framing, answer-giving gesture, book-emission magic, blank ornamental UI frame, monster, combat, 3D exploration presentation, or fixed spell mechanics.
final_asset_record: PNG 1672x941; repository reference file at assets/reference/visual/GRIMOIRE_class_direct_glyph_learning_planning_reference_2026-08-30.png; user batch-approved 2026-08-30.
reference_similarity_status: PASS
shipping_and_marketing_usage: NOT_AUTHORIZED_BY_THIS_RECORD; complete release rights and similarity review before any shipping/store/marketing use.
proof_reference:
  - docs/planning/visual/GRIMOIRE_REPRESENTATIVE_SCREENS_2026-08-25.json
  - docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
  - https://openai.com/policies/row-terms-of-use/
  - https://openai.com/policies/service-terms/
proof_hash: 3869EE8A7159E241A8FD7051850970BE7040A3176C90DAFA089A963FEE1E01A4
secure_original_location: PROJECT_REPOSITORY_REFERENCE_PATH_ABOVE; source-generation session remains outside the repository
redacted_excerpt: USER_BATCH_APPROVED_2026-08-30; safe direct glyph learning; professor guidance without a correct answer.
reviewed_by: Codex visual QA plus user batch approval
reviewed_at: 2026-08-30
status: CONDITIONAL
notes: CANON_REGISTERED_PLANNING_REFERENCE_ONLY. This record does not promote the image to a Godot runtime asset, does not establish an asset batch, and does not change Human/Device/Performance/Accessibility/Export validation from NOT_RUN.
```

## Festival Light-Thread Canopy Planning Reference — 2026-08-30

```yaml
asset_id: GR-REF-VIS-FESTIVAL-LIGHT-THREAD-CANOPY-20260830-01
category: CHARACTER_ILLUSTRATION
name: Festival light-thread canopy planning reference
project: GRIMOIRE
creation_route: AI_GENERATED
creator_or_vendor: Codex built-in image generation
source_url_or_path: assets/reference/visual/GRIMOIRE_festival_light_thread_canopy_planning_reference_2026-08-30.png
source_checked_at: 2026-08-30
acquired_or_created_at: 2026-08-30
license_or_contract: OpenAI Terms of Use and applicable Service Terms; planning-reference scope only
license_version_or_terms_date: Terms of Use published 2026-01-01; Service Terms updated 2026-06-12; checked 2026-08-30
commercial_use: CONDITIONAL
distribution_in_game_build: CONDITIONAL
raw_source_redistribution: CONDITIONAL
modification: CONDITIONAL
attribution: NOT_CONFIRMED_FOR_RELEASE
platform_or_territory_restrictions: RELEASE_REVIEW_REQUIRED
open_source_notice_or_source_obligation: NOT_APPLICABLE
ai_model_service_version: Codex built-in image generation; exact underlying model/version not surfaced
ai_terms_checked_at: 2026-08-30
ai_input_rights: Generation used only project-owned prompt/canon and user-approved visual direction; no third-party or user-provided image was supplied as a generation input.
ai_output_terms: As between the user and OpenAI, Terms of Use assign OpenAI's rights in Output to the user to the extent permitted by applicable law; output can be non-unique and the user remains responsible for input rights and output use.
contract_scope: Canonical planning reference for a future Chapter 4 light-thread canopy restoration and human-blueprint key scene; excludes runtime import, shipping, store, marketing, character identity, exact festival result, UI, and gameplay implementation approval.
voice_clone_or_ai_training_rights: NOT_APPLICABLE
reference_sources:
  - docs/planning/visual/GRIMOIRE_WARM_ACADEMY_TONE_LOCK_2026-08-28.md
  - docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
  - user batch approval in current Codex thread: approve the five-scene image batch
reference_brief: An academy courtyard festival where learners restore a light-thread canopy through harmonious practical, spectacular, and elegant expressions. The noncombat result, community, and direct blue-violet air-writing are primary; no one is visibly the winner. Functional UI text and controls remain live UI.
forbidden_expression: No direct third-party image input, tracing, copied character identity/costume/silhouette, logo, watermark, baked functional text/numbers/buttons, winner or score signal, combat, enemy, weapon, red-black horror framing, fixed festival result, blank ornamental UI frame, 3D exploration presentation, or explicit relationship canon.
final_asset_record: PNG 1672x941; repository reference file at assets/reference/visual/GRIMOIRE_festival_light_thread_canopy_planning_reference_2026-08-30.png; user batch-approved 2026-08-30.
reference_similarity_status: PASS
shipping_and_marketing_usage: NOT_AUTHORIZED_BY_THIS_RECORD; complete release rights and similarity review before any shipping/store/marketing use.
proof_reference:
  - docs/planning/visual/GRIMOIRE_REPRESENTATIVE_SCREENS_2026-08-25.json
  - docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
  - https://openai.com/policies/row-terms-of-use/
  - https://openai.com/policies/service-terms/
proof_hash: 2C7C2B29A94E695DDB429825D2FBFDD947F17C1A279341A6A393B7405E761A1B
secure_original_location: PROJECT_REPOSITORY_REFERENCE_PATH_ABOVE; source-generation session remains outside the repository
redacted_excerpt: USER_BATCH_APPROVED_2026-08-30; Chapter 4 noncombat canopy restoration; several valid forms of care coexist.
reviewed_by: Codex visual QA plus user batch approval
reviewed_at: 2026-08-30
status: CONDITIONAL
notes: CANON_REGISTERED_PLANNING_REFERENCE_ONLY. This record does not promote the image to a Godot runtime asset, does not establish an asset batch, and does not change Human/Device/Performance/Accessibility/Export validation from NOT_RUN.
```

## Protective Single-Entity Battle Practicum Planning Reference — 2026-08-30

```yaml
asset_id: GR-REF-VIS-PROTECTIVE-BATTLE-PRACTICUM-20260830-01
category: CHARACTER_ILLUSTRATION
name: Protective single-entity battle practicum planning reference
project: GRIMOIRE
creation_route: AI_GENERATED
creator_or_vendor: Codex built-in image generation
source_url_or_path: assets/reference/visual/GRIMOIRE_protective_battle_practicum_planning_reference_2026-08-30.png
source_checked_at: 2026-08-30
acquired_or_created_at: 2026-08-30
license_or_contract: OpenAI Terms of Use and applicable Service Terms; planning-reference scope only
license_version_or_terms_date: Terms of Use published 2026-01-01; Service Terms updated 2026-06-12; checked 2026-08-30
commercial_use: CONDITIONAL
distribution_in_game_build: CONDITIONAL
raw_source_redistribution: CONDITIONAL
modification: CONDITIONAL
attribution: NOT_CONFIRMED_FOR_RELEASE
platform_or_territory_restrictions: RELEASE_REVIEW_REQUIRED
open_source_notice_or_source_obligation: NOT_APPLICABLE
ai_model_service_version: Codex built-in image generation; exact underlying model/version not surfaced
ai_terms_checked_at: 2026-08-30
ai_input_rights: Generation used only project-owned prompt/canon and user-approved visual direction; no third-party or user-provided image was supplied as a generation input.
ai_output_terms: As between the user and OpenAI, Terms of Use assign OpenAI's rights in Output to the user to the extent permitted by applicable law; output can be non-unique and the user remains responsible for input rights and output use.
contract_scope: Canonical planning reference for a future single-entity protective battle practicum and human-blueprint key scene; excludes runtime import, shipping, store, marketing, character-identity, entity taxonomy, battle balance, guardian tuning, and functional-UI approval.
voice_clone_or_ai_training_rights: NOT_APPLICABLE
reference_sources:
  - docs/planning/visual/GRIMOIRE_WARM_ACADEMY_TONE_LOCK_2026-08-28.md
  - docs/planning/BATTLE_RULES_01_APPROVAL_2026-08-01.md
  - docs/planning/BATTLE_SINGLE_ENEMY_FOCUS_01_APPROVAL_2026-08-01.md
  - user approval in current Codex thread: continue the current visual direction and approve the protective battle practicum candidate
reference_brief: A warm academy greenhouse encounter with one unstable botanical phenomenon. A learner's direct blue-to-blue-violet handwritten glyphs form a nonfunctional partial five-point motif while a protectable plant and damaged structure remain visible. The scene communicates calming and environmental preservation, not killing, enemy waves, or automatic resolution. Functional UI text and controls remain live UI.
forbidden_expression: No direct third-party image input, tracing, copied character identity/costume/silhouette, logo, watermark, baked functional text/numbers/buttons, combat HUD, waves, minions, weapons, attack pose, kill framing, automatic guardian resolution, black void, horror-corruption dominance, 3D exploration presentation, or fixed tactical answer.
final_asset_record: PNG 1672x941; repository reference file at assets/reference/visual/GRIMOIRE_protective_battle_practicum_planning_reference_2026-08-30.png; user approved 2026-08-30.
reference_similarity_status: PASS
shipping_and_marketing_usage: NOT_AUTHORIZED_BY_THIS_RECORD; complete release rights and similarity review before any shipping/store/marketing use.
proof_reference:
  - docs/planning/visual/GRIMOIRE_REPRESENTATIVE_SCREENS_2026-08-25.json
  - docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
  - https://openai.com/policies/row-terms-of-use/
  - https://openai.com/policies/service-terms/
proof_hash: 01134FBD7D46A0ECCB0A3DF056E8C1FF10B485D3FC01E2C023E1430AEEC6870D
secure_original_location: PROJECT_REPOSITORY_REFERENCE_PATH_ABOVE; source-generation session remains outside the repository
redacted_excerpt: USER_APPROVED_2026-08-30; one unstable phenomenon; direct airborne glyph writing; environmental preservation; no killing or wave combat.
reviewed_by: Codex visual QA plus user visual approval
reviewed_at: 2026-08-30
status: CONDITIONAL
notes: CANON_REGISTERED_PLANNING_REFERENCE_ONLY. This record does not promote the image to a Godot runtime asset, does not establish an asset batch, and does not change Human/Device/Performance/Accessibility/Export validation from NOT_RUN.
```

## First Guided Greenhouse Practicum Planning Reference — 2026-08-30

```yaml
asset_id: GR-REF-VIS-FIRST-GUIDED-GREENHOUSE-PRACTICUM-20260830-01
category: CHARACTER_ILLUSTRATION
name: First guided greenhouse practicum planning reference
project: GRIMOIRE
creation_route: AI_GENERATED
creator_or_vendor: Codex built-in image generation
source_url_or_path: assets/reference/visual/GRIMOIRE_first_guided_greenhouse_practicum_planning_reference_2026-08-30.png
source_checked_at: 2026-08-30
acquired_or_created_at: 2026-08-30
license_or_contract: OpenAI Terms of Use and applicable Service Terms; planning-reference scope only
license_version_or_terms_date: Terms of Use published 2026-01-01; Service Terms updated 2026-06-12; checked 2026-08-30
commercial_use: CONDITIONAL
distribution_in_game_build: CONDITIONAL
raw_source_redistribution: CONDITIONAL
modification: CONDITIONAL
attribution: NOT_CONFIRMED_FOR_RELEASE
platform_or_territory_restrictions: RELEASE_REVIEW_REQUIRED
open_source_notice_or_source_obligation: NOT_APPLICABLE
ai_model_service_version: Codex built-in image generation; exact underlying model/version not surfaced
ai_terms_checked_at: 2026-08-30
ai_input_rights: Generation used only project-owned prompt/canon and user-approved visual direction; no third-party or user-provided image was supplied as a generation input.
ai_output_terms: As between the user and OpenAI, Terms of Use assign OpenAI's rights in Output to the user to the extent permitted by applicable law; output can be non-unique and the user remains responsible for input rights and output use.
contract_scope: Canonical planning reference for the first guided greenhouse practicum and human-blueprint key scene; excludes runtime import, shipping, store, marketing, character-identity, fixed-choice-outcome, and functional-UI approval.
voice_clone_or_ai_training_rights: NOT_APPLICABLE
reference_sources:
  - docs/planning/visual/GRIMOIRE_WARM_ACADEMY_TONE_LOCK_2026-08-28.md
  - docs/planning/visual/FROSTBLOOM_W6_WARM_ACADEMY_CORE_SCENE_BOARD_BRIEF_2026-08-28.md
  - docs/planning/FROSTBLOOM_W6_DECISION_LOOP_VERTICAL_SLICE_01_FEATURE_DESIGN_SPEC_2026-08-28.md
  - user direction in current Codex thread: greenhouse and seedlings are the first practicum incident, not the main game; continue the current visual direction
reference_brief: A dusk greenhouse first guided practicum. A learner writes a limited number of luminous glyph strokes directly in the air while pale frost seedlings and a damaged, repairable greenhouse support share the frame as equal preservation concerns. The book is a quiet reference prop, not a magic emitter. Functional UI text and controls remain live UI.
forbidden_expression: No direct third-party image input, tracing, copied character identity/costume/silhouette, logo, watermark, baked functional text/numbers/buttons, automatic target or correct-route signal, fixed choice outcome, hostile monster framing, 3D exploration presentation, or greenhouse-as-the-entire-game framing.
final_asset_record: PNG 1672x941; repository reference file at assets/reference/visual/GRIMOIRE_first_guided_greenhouse_practicum_planning_reference_2026-08-30.png; user approved as a continuation of the current visual direction on 2026-08-30.
reference_similarity_status: PASS
shipping_and_marketing_usage: NOT_AUTHORIZED_BY_THIS_RECORD; complete release rights and similarity review before any shipping/store/marketing use.
proof_reference:
  - docs/planning/visual/GRIMOIRE_REPRESENTATIVE_SCREENS_2026-08-25.json
  - docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
  - https://openai.com/policies/row-terms-of-use/
  - https://openai.com/policies/service-terms/
proof_hash: 5FF68A74400DAC5017B7B7593CBE56C83A8B27389BD4C551B75B575D432C63F1
secure_original_location: PROJECT_REPOSITORY_REFERENCE_PATH_ABOVE; source-generation session remains outside the repository
redacted_excerpt: USER_APPROVED_2026-08-30_CONTINUE_CURRENT_VISUAL_DIRECTION; first guided practicum only; direct airborne glyph writing; seedlings and greenhouse support have equal preservation value.
reviewed_by: Codex visual QA plus user visual approval
reviewed_at: 2026-08-30
status: CONDITIONAL
notes: CANON_REGISTERED_PLANNING_REFERENCE_ONLY. This record does not promote the image to a Godot runtime asset, does not establish an asset batch, and does not change Human/Device/Performance/Accessibility/Export validation from NOT_RUN.
```
