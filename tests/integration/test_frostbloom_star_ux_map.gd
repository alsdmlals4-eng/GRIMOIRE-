extends RefCounted

const MAP_PATH := "res://data/testing/frostbloom_star_ux_map.json"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(MAP_PATH), "Frostbloom UX map exists")
    if not FileAccess.file_exists(MAP_PATH):
        return
    var file := FileAccess.open(MAP_PATH, FileAccess.READ)
    case.assert_true(file != null, "Frostbloom UX map opens")
    if file == null:
        return
    var parsed: Variant = JSON.parse_string(file.get_as_text())
    case.assert_true(typeof(parsed) == TYPE_DICTIONARY, "Frostbloom UX map parses")
    if typeof(parsed) != TYPE_DICTIONARY:
        return
    var payload: Dictionary = parsed
    case.assert_equal("AFTER_CIRCUIT_PREVIEW", payload.get("target_keyword_step", ""), "Target keyword follows circuit preview")
    case.assert_false(bool(payload.get("recommend_best_route", true)), "UI never recommends a best route")
    case.assert_false(bool(payload.get("professor_example_is_answer", true)), "Professor example is not the answer")
    case.assert_false(bool(payload.get("preview_reveals_ending", true)), "Preview does not reveal ending")
    case.assert_false(bool(payload.get("auto_target", true)), "Target is never automatic")
    case.assert_false(bool(payload.get("auto_commit", true)), "Commit is never automatic")
    var intents: Array = payload.get("solution_intents", [])
    case.assert_equal(6, intents.size(), "Frostbloom exposes five named intents plus unregistered solution")
    var ids: Array[String] = []
    for intent_variant in intents:
        var intent: Dictionary = intent_variant
        ids.append(String(intent.get("id", "")))
        case.assert_true(Array(intent.get("target_keywords", [])).size() > 0, "Every intent opens target keywords")
    for expected in ["FACILITY_REPAIR", "LIFE_RESCUE", "SPIRIT_STABILIZATION", "CONTAIN_AND_EVACUATE", "SUPPRESS_AND_BUY_TIME", "REASONABLE_UNREGISTERED_SOLUTION"]:
        case.assert_true(ids.has(expected), "Frostbloom intent exists: %s" % expected)
