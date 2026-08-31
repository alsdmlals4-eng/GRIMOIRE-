extends RefCounted

const CARD_DEFINITION_PATH := "res://src/core/cards/card_definition.gd"
const CARD_ARCHIVE_PATH := "res://src/ui/cards/card_archive_screen.gd"
const CARD_ARCHIVE_SCENE_PATH := "res://src/ui/cards/card_archive_screen.tscn"


func run(case) -> void:
    # Breaks if a free-standing duel entry is introduced instead of a story-gated archive.
    case.assert_true(FileAccess.file_exists(CARD_DEFINITION_PATH), "Card definition implementation must exist")
    case.assert_true(FileAccess.file_exists(CARD_ARCHIVE_PATH), "Card archive screen implementation must exist")
    case.assert_true(ResourceLoader.exists(CARD_ARCHIVE_SCENE_PATH), "Card archive scene must exist")
    if not FileAccess.file_exists(CARD_DEFINITION_PATH) or not FileAccess.file_exists(CARD_ARCHIVE_PATH) or not ResourceLoader.exists(CARD_ARCHIVE_SCENE_PATH):
        return

    var card_definition_script = load(CARD_DEFINITION_PATH)
    var archive_scene = load(CARD_ARCHIVE_SCENE_PATH)
    case.assert_true(card_definition_script != null and card_definition_script.can_instantiate(), "Card definition script loads for the archive")
    case.assert_true(archive_scene is PackedScene, "Card archive scene loads")
    if card_definition_script == null or not archive_scene is PackedScene:
        return

    var archive = archive_scene.instantiate()
    case.assert_true(archive is Control, "Card archive root is a live Control")
    # Breaks if a parser error drops the scene script and leaves only a bare Control tree.
    case.assert_true(archive.has_method("configure"), "Card archive scene keeps its configure behavior")
    case.assert_true(archive.has_method("request_start_duel"), "Card archive scene keeps its pending-duel boundary")
    case.assert_true(archive.has_node("Content/RulesetStatus"), "Card archive presents the ruleset status")
    case.assert_true(archive.has_node("Content/UnlockedCards"), "Card archive presents narrative-unlocked cards")
    case.assert_false(archive.has_node("DuelButton"), "Card archive has no independent duel button")
    if not archive is Control or not archive.has_method("configure") or not archive.has_method("request_start_duel"):
        archive.free()
        return

    archive.configure([])
    case.assert_equal([], archive.visible_card_ids(), "Archive exposes no cards before story unlocks one")
    var wizard = _make_card(card_definition_script, &"ARCHIVE_WIZARD", &"WIZARD")
    var shield = _make_card(card_definition_script, &"ARCHIVE_SHIELD", &"DEFENSE_SPELL")
    archive.configure([wizard, shield])
    case.assert_equal([&"ARCHIVE_WIZARD", &"ARCHIVE_SHIELD"], archive.visible_card_ids(), "Archive lists only cards supplied by the narrative context")
    case.assert_true(archive.ruleset_status_text().contains("RULESET_PENDING"), "Archive visibly explains that detailed duel rules remain pending")

    var duel_request: Dictionary = archive.request_start_duel()
    case.assert_equal(&"RULESET_PENDING", duel_request.get("status", &""), "Archive cannot start a duel before detailed rules exist")
    case.assert_equal(&"DETAILED_DUEL_RULES_PENDING", duel_request.get("reason", &""), "Pending duel result names the real missing authority")
    case.assert_false(duel_request.has("route_path"), "Pending duel result supplies no independent route")
    archive.free()


func _make_card(card_definition_script, card_id: StringName, card_type: StringName):
    var card = card_definition_script.new()
    card.card_id = card_id
    card.type = card_type
    card.story_unlock = &"FIRST_DUEL_CLASS"
    return card
