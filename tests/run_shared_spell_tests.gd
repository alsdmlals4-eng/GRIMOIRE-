extends SceneTree

func _init() -> void:
    var case = preload("res://tests/test_case.gd").new()
    var path := "res://src/core/shared_spell/spell_semantics.gd"
    case.assert_true(FileAccess.file_exists(path), "shared semantics must exist")
    if not FileAccess.file_exists(path):
        quit(1)
        return
    var script = load(path)
    if script == null or not script.can_instantiate():
        quit(1)
        return
    var rules = script.new()
    var rows := [
        [["EMBER"], "HEAT_POINT", {"heatable": true}],
        [["WIND"], "PUSH", {"light": true, "path_open": true, "destination": "B"}],
        [["WARD"], "BLOCK", {"blockable_boundary": true}],
        [["GATHER"], "GATHER_LOCAL", {"gatherable": true, "local_receiver_empty": true}],
        [["EMBER", "WIND"], "HEAT_FLOW", {"airflow_movable": true, "heatable": true}],
        [["EMBER", "WARD"], "RETAIN_HEAT", {"boundary": true, "temperature": "warm"}],
        [["EMBER", "GATHER"], "FOCUS_HEAT", {"small": true, "heatable": true}],
        [["WIND", "WARD"], "REDIRECT", {"redirectable_flow": true, "exit_open": true, "destination": "B"}],
        [["WIND", "GATHER"], "TRANSPORT", {"airborne_light": true, "capture_ready": true, "destination": "B"}],
        [["WARD", "GATHER"], "SEAL", {"small_leak": true, "boundary_intact": true}],
    ]
    var learned := ["EMBER", "WIND", "WARD", "GATHER"]
    for row in rows:
        var kinds: Array = row[0].duplicate()
        var spell: Dictionary = rules.compose(kinds, learned)
        case.assert_equal("OK", spell.status, "known recipe")
        case.assert_equal(row[1], spell.action, "shared action not duel damage")
        case.assert_equal(kinds.size(), spell.cost, "provisional cost")
        kinds.reverse()
        case.assert_equal(spell, rules.compose(kinds, learned), "order independent")
        var target: Dictionary = row[2].duplicate(true)
        target["id"] = "A"
        var before := target.duplicate(true)
        case.assert_equal("VALID_CHANGE", rules.assess(kinds, learned, target).status, "valid target")
        case.assert_equal(before, target, "assessment does not mutate target")
        case.assert_equal("INVALID", rules.assess(kinds, learned, {"id": "A"}).status, "missing traits rejected")
    for invalid in [[], ["EMBER", "EMBER"], ["MAGE"], ["EMBER", "WIND", "WARD"]]:
        case.assert_equal("INVALID", rules.compose(invalid, learned).status, "invalid recipe")
    case.assert_equal("UNLEARNED_GLYPH", rules.compose(["EMBER"], []).reason, "unlearned glyph")
    case.assert_equal("INVALID", rules.assess(["EMBER"], learned, {"heatable": true}).status, "missing target id")
    var closed: Dictionary = rules.assess(["WARD"], learned, {"id": "A", "blockable_boundary": true, "closed": true})
    case.assert_equal("VALID_NO_CHANGE", closed.status, "closed boundary unchanged")
    case.assert_equal(1, closed.cost, "valid no change still has quoted cost")
    case.assert_equal("VALID_NO_CHANGE", rules.assess(["WIND", "GATHER"], learned, {"id": "A", "airborne_light": true, "capture_ready": true, "destination": "B", "empty": true}).status, "empty source unchanged")
    case.assert_equal("INVALID", rules.assess(["WIND", "GATHER"], learned, {"id": "A", "airborne_light": true, "capture_ready": true, "destination": "B", "full": true}).status, "full destination rejected")
    case.assert_equal("INVALID", rules.assess(["WIND"], learned, {"id": "A", "light": true, "heavy": true, "path_open": true, "destination": "B"}).status, "heavy overrides light")
    case.assert_equal("INVALID", rules.assess(["EMBER", "WARD"], learned, {"id": "A", "boundary": true, "temperature": "cold"}).status, "retention cannot create heat")
    var warning: Dictionary = rules.assess(["EMBER"], learned, {"id": "A", "heatable": true, "heat_sensitive": true})
    case.assert_equal("VALID_CHANGE", warning.status, "harmful valid action not blocked")
    case.assert_true("DAMAGE_RISK" in warning.warnings, "damage warning")
    case.assert_equal("INVALID", rules.assess(["WARD", "GATHER"], learned, {"id": "A", "small_leak": true, "boundary_intact": false}).status, "cannot repair destroyed boundary")
    var detached: Dictionary = rules.compose(["EMBER"], learned)
    detached.action = "BROKEN"
    case.assert_equal("HEAT_POINT", rules.compose(["EMBER"], learned).action, "detached result")
    var edge_rows := [
        [["WIND"], {"id": "A", "light": true, "path_open": true}, "INVALID", ""],
        [["WIND"], {"id": "A", "light": true, "path_open": true, "destination": "A"}, "INVALID", ""],
        [["EMBER"], {"id": "A", "heatable": "true"}, "INVALID", ""],
        [["EMBER"], {"id": "A", "heatable": true, "temperature": "warm"}, "VALID_CHANGE", "OVERHEAT_RISK"],
        [["EMBER", "WIND"], {"id": "A", "heatable": true, "airflow_movable": true, "volatile": true}, "VALID_CHANGE", "DISPERSION_RISK"],
        [["EMBER", "WARD"], {"id": "A", "boundary": true, "temperature": "overheated"}, "VALID_CHANGE", "RETAINS_DANGEROUS_HEAT"],
        [["EMBER", "GATHER"], {"id": "A", "heatable": true, "small": true, "wide_area": true}, "INVALID", ""],
        [["GATHER"], {"id": "A", "gatherable": true, "local_receiver_empty": true, "remote": true}, "INVALID", ""],
        [["WIND", "WARD"], {"id": "A", "redirectable_flow": true, "exit_open": true, "destination": "B", "toward_audience": true}, "VALID_CHANGE", "AUDIENCE_RISK"],
        [["WIND", "GATHER"], {"id": "A", "airborne_light": true, "capture_ready": true, "destination": "B", "receiver_open": true}, "VALID_CHANGE", "REDISPERSION_RISK"],
    ]
    for row in edge_rows:
        var outcome: Dictionary = rules.assess(row[0], learned, row[1])
        case.assert_equal(row[2], outcome.status, "edge target validity")
        if row[2] == "INVALID":
            case.assert_equal(0, outcome.cost, "invalid quote costs zero")
            case.assert_equal(0, outcome.time, "invalid quote takes no time")
        if row[3] != "":
            case.assert_true(row[3] in outcome.warnings, "specific hazard warning")
    # Legacy duel rules remain a separate version, not new-meaning evidence.
    preload("res://tests/unit/test_card_duel_rules.gd").new().run(case)
    print(JSON.stringify({"assertions": case.assertion_count(), "failures": case.failure_count(), "messages": case.failures()}))
    quit(0 if case.failure_count() == 0 else 1)
