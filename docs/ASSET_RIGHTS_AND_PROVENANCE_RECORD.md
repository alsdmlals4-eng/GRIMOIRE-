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
