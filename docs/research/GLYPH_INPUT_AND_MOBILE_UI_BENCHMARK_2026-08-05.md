# Glyph Input and Mobile Spell UI Benchmark — 2026-08-05

## Status

```yaml
status: CURRENT_RESEARCH_INPUT
created_at: 2026-08-05T00:31+09:00
related_decisions:
  - GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
  - GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
product_validation: NOT_RUN
human_validation: NOT_RUN
```

## Method

각 사례를 표면적으로 복제하지 않고 다음 항목으로 비교한다.

```yaml
required_fields:
  - source_name
  - source_type
  - source_date_or_version
  - observed_mechanism
  - transferable_principle
  - project_mismatch_or_limit
  - recommendation
```

## 1. Apple Human Interface Guidelines — Accessibility and Game Controls

```yaml
source_name: Apple Human Interface Guidelines
source_type: OFFICIAL
source_date_or_version: accessed_2026-08-05_change_log_2025
observed_mechanism:
  - iOS_iPadOS_recommended_control_size_44x44_pt
  - spacing_and_visible_press_states
  - simple_gestures_and_alternative_controls
  - safe_area_and_multiple_aspect_ratio_support
transferable_principle:
  - glyph_and_resource_buttons_need_large_touch_targets
  - drawing_gesture_requires_button_or_assisted_alternative
  - node_role_must_not_depend_only_on_color
project_mismatch_or_limit:
  - platform_guidance_does_not_prove_gameplay_fun_or_glyph_recognition_quality
recommendation: ADOPT_FOR_MOBILE_UI_AND_ACCESSIBILITY
source:
  - https://developer.apple.com/design/human-interface-guidelines/accessibility
  - https://developer.apple.com/design/human-interface-guidelines/game-controls
  - https://developer.apple.com/design/human-interface-guidelines/designing-for-games
```

## 2. Android Developers — Accessibility

```yaml
source_name: Android Developers
source_type: OFFICIAL
source_date_or_version: accessed_2026-08-05_updated_2026
observed_mechanism:
  - recommended_touch_target_48x48_dp
  - visual_icon_can_be_smaller_if_focusable_area_is_large
  - interactive_elements_require_descriptions
transferable_principle:
  - glyph_icons_may_remain_visually_compact_but_need_48dp_interaction_bounds
  - icon_only_glyphs_require_name_and_role_descriptions
  - universal_stock_and_exact_vault_need_non_color_labels
project_mismatch_or_limit:
  - Android_accessibility_guidance_does_not_define_spell_design_or_combat_timing
recommendation: ADOPT_FOR_ANDROID_DEVICE_GATE
source:
  - https://developer.android.com/guide/topics/ui/accessibility/apps.html
```

## 3. $1 Unistroke Recognizer

```yaml
source_name: $1 Unistroke Recognizer
source_type: PRIMARY_RESEARCH
source_date_or_version: UIST_2007
observed_mechanism:
  - template_based_unistroke_recognition
  - rapid_prototyping_with_small_training_sets
  - normalization_of_scale_translation_and_rotation
transferable_principle:
  - begin_vertical_slice_with_simple_1_to_3_stroke_glyphs
  - use_multiple_examples_per_glyph_and_confusion_testing
  - recognition_prototype_can_be_lightweight_before_ml
project_mismatch_or_limit:
  - unistroke_only
  - rotation_invariance_can_erase_directional_semantics_if_used_without_constraints
  - laboratory_accuracy_does_not_equal_combat_usability
recommendation: ADAPT_AS_FIRST_RECOGNITION_BASELINE
source:
  - https://depts.washington.edu/acelab/proj/dollar/index.html
  - https://uist.acm.org/archive/html/proceedings/2007.html
```

## 4. $N Multistroke Recognizer

```yaml
source_name: $N Multistroke Recognizer
source_type: PRIMARY_RESEARCH
source_date_or_version: GI_2010_and_N-Protractor_2012
observed_mechanism:
  - recognizes_multistroke_gestures
  - generalizes_stroke_order_and_direction
  - Protractor_variant_improves_matching_speed
transferable_principle:
  - reserve_multistroke_for_advanced_glyphs
  - prototype_order_tolerant_accessibility_mode_separately
  - record_confusable_glyph_pairs_not_only_overall_accuracy
project_mismatch_or_limit:
  - permutation_cost_grows_with_stroke_count
  - full_order_invariance_can_remove_learning_identity
  - production_mobile_performance_requires_measurement
recommendation: HOLD_FOR_ADVANCED_GLYPHS_AFTER_UNISTROKE_POC
source:
  - https://depts.washington.edu/acelab/proj/dollar/ndollar.html
  - https://faculty.washington.edu/wobbrock/pubs/gi-10.02.pdf
  - https://faculty.washington.edu/wobbrock/pubs/gi-12.03.pdf
```

## 5. LOSTMAGIC

```yaml
source_name: LOSTMAGIC
source_type: OFFICIAL_GAME_DESCRIPTION
source_date_or_version: Nintendo_DS_2006
observed_mechanism:
  - draw_symbols_with_stylus_to_cast
  - combine_up_to_three_spells
  - real_time_combat_pressure
transferable_principle:
  - physical_drawing_can_create_fantasy_authorship
  - small_combinatorial_set_is_more_readable_than_unbounded_symbol_chains
  - drawing_under_pressure_needs_a_fast_fallback
project_mismatch_or_limit:
  - stylus_precision_is_higher_than_finger_input
  - LOSTMAGIC_casts_drawn_spells_directly_while_GRIMOIRE_uses_drawing_as_vault_preparation
  - historical_platform_and_user_expectations_differ
recommendation: ADAPT_FANTASY_FEEL_REJECT_DIRECT_CAST_DEPENDENCY
source:
  - https://www.nintendo.com/en-gb/Games/Nintendo-DS/LOSTMAGIC-271441.html
```

## 6. Mages of Mystralia

```yaml
source_name: Mages of Mystralia
source_type: OFFICIAL_GAME_DESCRIPTION
source_date_or_version: Nintendo_Switch_2019
observed_mechanism:
  - magical_runes_have_properties
  - runes_combine_into_many_spells
transferable_principle:
  - glyph_meaning_and_spatial_grammar_should_create_emergent_spell_identity
  - known_spell_name_can_be_separate_from_component_names
project_mismatch_or_limit:
  - large_combination_claim_does_not_guarantee_mobile_legibility
  - GRIMOIRE_has_3x3_target_and_situation_reasoning_constraints
recommendation: ADOPT_COMPONENT_TO_SPELL_IDENTITY_REJECT_UNBOUNDED_COMPLEXITY
source:
  - https://www.nintendo.com/en-za/Games/Nintendo-Switch-download-software/Mages-of-Mystralia-1496934.html
```

## 7. GDC playtesting practice

```yaml
source_name: GDC_Vault_Playtesting_Process_for_Ultra_Small_Teams
source_type: PROFESSIONAL_CASE
source_date_or_version: GDC_2026
observed_mechanism:
  - lightweight_repeatable_playtest_process
  - focused_sessions_and_actionable_questions
  - iterative_use_across_multiple_projects
transferable_principle:
  - test_one_glyph_question_at_a_time
  - separate_symbol_recognition_from_combat_decision_quality
  - convert_observed_behavior_into_specific_revision_decisions
project_mismatch_or_limit:
  - session_summary_is_not_GRIMOIRE_specific_evidence
  - actual_target_player_and_device_tests_remain_required
recommendation: ADOPT_PROCESS_NOT_RESULTS
source:
  - https://gdcvault.com/play/1035679/Playtesting-Process-for-Ultra-Small
```

## 8. Synthesis

### Adopt

- Input glyphs use simple, distinct silhouettes and few strokes.
- Ornamented display glyphs preserve the same base silhouette.
- Every glyph has a text name and role icon.
- Touch targets follow 44pt/48dp platform recommendations.
- Core drawing has guided and non-gesture alternatives.
- Recognition tests track confusion pairs, completion time, retries, and abandonment.

### Adapt

- $1 recognizer as POC baseline; $N only after advanced multistroke need is proven.
- LOSTMAGIC’s authorship feeling, but not direct-drawing dependency.
- Rune-combination inspiration, constrained by GRIMOIRE’s 3×3 grammar.

### Reject

- Intricate decorative shape as the actual recognition input.
- Drawing quality as power or economy bonus.
- Color-only distinction between main/support/target or vault/Stock.
- Unlimited glyph chain complexity in the vertical slice.

## 9. Test plan derived from benchmark

```yaml
recognition_metrics:
  - first_attempt_match_rate
  - confusion_matrix
  - median_draw_time
  - retry_count
  - cancellation_rate
  - accessibility_assist_usage

comprehension_metrics:
  - identify_glyph_meaning_without_label
  - distinguish_main_from_support
  - distinguish_exact_vault_from_universal_stock
  - select_intended_resource_source

mobile_metrics:
  - mis_tap_rate
  - one_hand_reach
  - safe_area_collision
  - readability_at_supported_aspect_ratios
```

No benchmark above proves the final glyph set, combat balance, fun, or accessibility for target players. Those remain `HUMAN_NOT_RUN` and `DEVICE_NOT_RUN` until tested in GRIMOIRE.
