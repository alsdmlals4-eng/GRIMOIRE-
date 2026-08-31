extends RefCounted

const CARD_DEFINITION_PATH := "res://src/core/cards/card_definition.gd"
const CARD_ARCHIVE_PATH := "res://src/ui/cards/card_archive_screen.gd"
const CARD_ARCHIVE_SCENE_PATH := "res://src/ui/cards/card_archive_screen.tscn"
const CIRCLE_COMPOSITION_PATH := "res://src/core/circle/circle_composition.gd"
const STORY_PROGRESS_PATH := "res://src/core/story/story_progress.gd"


func run(case) -> void:
    # Breaks if a free-standing duel entry is introduced instead of a story-gated archive.
    case.assert_true(FileAccess.file_exists(CARD_DEFINITION_PATH), "Card definition implementation must exist")
    case.assert_true(FileAccess.file_exists(CARD_ARCHIVE_PATH), "Card archive screen implementation must exist")
    case.assert_true(ResourceLoader.exists(CARD_ARCHIVE_SCENE_PATH), "Card archive scene must exist")
    if not FileAccess.file_exists(CARD_DEFINITION_PATH) or not FileAccess.file_exists(CARD_ARCHIVE_PATH) or not ResourceLoader.exists(CARD_ARCHIVE_SCENE_PATH):
        return

    var card_definition_script = load(CARD_DEFINITION_PATH)
    var archive_scene = load(CARD_ARCHIVE_SCENE_PATH)
    var circle_composition_script = load(CIRCLE_COMPOSITION_PATH)
    var story_progress_script = load(STORY_PROGRESS_PATH)
    case.assert_true(card_definition_script != null and card_definition_script.can_instantiate(), "Card definition script loads for the archive")
    case.assert_true(archive_scene is PackedScene, "Card archive scene loads")
    case.assert_true(circle_composition_script != null, "Circle composition script loads for the archive")
    case.assert_true(story_progress_script != null, "Story progress script loads for narrative card authority")
    if card_definition_script == null or not archive_scene is PackedScene or circle_composition_script == null or story_progress_script == null:
        return

    var archive = archive_scene.instantiate()
    case.assert_true(archive is Control, "Card archive root is a live Control")
    # Breaks if a parser error drops the scene script and leaves only a bare Control tree.
    case.assert_true(archive.has_method("configure_story_cards"), "Card archive requires story-owned unlock authority")
    case.assert_true(archive.has_method("request_start_duel"), "Card archive scene keeps its pending-duel boundary")
    case.assert_true(archive.has_node("Content/RulesetStatus"), "Card archive presents the ruleset status")
    case.assert_true(archive.has_node("Content/UnlockedCards"), "Card archive presents narrative-unlocked cards")
    case.assert_false(archive.has_node("DuelButton"), "Card archive has no independent duel button")
    if not archive is Control or not archive.has_method("configure_story_cards") or not archive.has_method("request_start_duel"):
        archive.free()
        return

    var wizard_glyphs: Array[StringName] = [&"HEAT", &"FLOW"]
    var mismatched_unlock_glyphs: Array[StringName] = [&"HEAT"]
    var mismatched_card_glyphs: Array[StringName] = [&"PROTECT"]
    var wizard = _make_card(card_definition_script, circle_composition_script, &"ARCHIVE_FROSTBLOOM_WIZARD", &"WIZARD", &"FIRST_EVENT", wizard_glyphs)
    var mismatched_unlock = _make_card(card_definition_script, circle_composition_script, &"ARCHIVE_FROSTBLOOM_WIZARD", &"WIZARD", &"UNRELATED_EVENT", mismatched_unlock_glyphs)
    var mismatched_card_id = _make_card(card_definition_script, circle_composition_script, &"ARCHIVE_UNAUTHORIZED_CARD", &"DEFENSE_SPELL", &"FIRST_EVENT", mismatched_card_glyphs)

    # Breaks if any caller can bypass narrative ownership by handing the archive an arbitrary card array.
    archive.configure_story_cards(null, [wizard])
    case.assert_equal([], archive.visible_card_ids(), "Archive rejects cards without a story-owned progress authority")
    archive.configure_story_cards(RefCounted.new(), [wizard])
    case.assert_equal([], archive.visible_card_ids(), "Archive rejects a non-StoryProgress authority")

    var early_progress = story_progress_script.create_new()
    archive.configure_story_cards(early_progress, [wizard])
    case.assert_equal([], archive.visible_card_ids(), "Admission progress cannot expose later narrative card records")

    var first_event_progress = story_progress_script.create_new()
    first_event_progress.advance_from_admission()
    var compound_role_cards: Array = []
    for compound_id in [&"MAIN_HEAT", &"AUX_PROTECT", &"CENTER_FLOW", &"STAR_SUMMON"]:
        compound_role_cards.append(_make_compound_role_card(card_definition_script, circle_composition_script, compound_id))
    archive.configure_story_cards(first_event_progress, compound_role_cards)
    case.assert_equal([], archive.visible_card_ids(), "Compound Main/Aux/Center/Star glyph IDs cannot reach archive presentation")

    archive.configure_story_cards(first_event_progress, [mismatched_unlock, mismatched_card_id, wizard])
    case.assert_equal([&"ARCHIVE_FROSTBLOOM_WIZARD"], archive.visible_card_ids(), "Archive shows only a card ID and story unlock actually authorized by progress")
    var wizard_label := archive.get_node_or_null(NodePath("Content/UnlockedCards/ARCHIVE_FROSTBLOOM_WIZARD")) as Label
    case.assert_true(wizard_label != null, "Narrative-unlocked card has a live archive label")
    if wizard_label != null:
        case.assert_true(wizard_label.text.contains("글자 조합"), "Archive visibly identifies a shared-circle card composition")
        case.assert_true(wizard_label.text.contains("FLOW+HEAT"), "Archive shows the actual role-free circle signature")
    case.assert_true(archive.ruleset_status_text().contains("RULESET_PENDING"), "Archive visibly explains that detailed duel rules remain pending")
    var narrative_gate := archive.get_node_or_null(NodePath("Content/NarrativeGate")) as Label
    case.assert_true(narrative_gate != null and narrative_gate.text.contains("이야기에서 해금한 카드") and narrative_gate.text.contains("결투를 시작할 수 없습니다"), "Archive gives a natural Korean explanation for record-only pending duel state")

    var duel_request: Dictionary = archive.request_start_duel()
    case.assert_equal(&"RULESET_PENDING", duel_request.get("status", &""), "Archive cannot start a duel before detailed rules exist")
    case.assert_equal(&"DETAILED_DUEL_RULES_PENDING", duel_request.get("reason", &""), "Pending duel result names the real missing authority")
    case.assert_false(duel_request.has("route_path"), "Pending duel result supplies no independent route")
    archive.free()


func _make_card(card_definition_script, circle_composition_script, card_id: StringName, card_type: StringName, story_unlock: StringName, glyph_ids: Array[StringName]):
    var card = card_definition_script.new()
    card.card_id = card_id
    card.type = card_type
    card.story_unlock = story_unlock
    var composition = circle_composition_script.create(glyph_ids, glyph_ids)
    card.set_composition(composition)
    return card


func _make_compound_role_card(card_definition_script, circle_composition_script, compound_id: StringName):
    var glyph_ids: Array[StringName] = [compound_id]
    return _make_card(card_definition_script, circle_composition_script, &"ARCHIVE_FROSTBLOOM_WIZARD", &"WIZARD", &"FIRST_EVENT", glyph_ids)
