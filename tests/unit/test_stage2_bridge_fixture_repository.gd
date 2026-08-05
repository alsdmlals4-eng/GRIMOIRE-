extends RefCounted

const REPOSITORY_PATH := "res://src/core/stage2/stage2_bridge_fixture_repository.gd"
const FIXTURE_PATH := "res://data/testing/stage2_bridge_scenarios.json"
const EXPECTED_GLYPHS := [&"HEAT", &"PROTECT", &"FLOW", &"FOCUS", &"DISPERSE", &"BURST"]


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(REPOSITORY_PATH), "Stage2 fixture repository must exist")
    case.assert_true(FileAccess.file_exists(FIXTURE_PATH), "Stage2 scenario fixtures must exist")
    if not FileAccess.file_exists(REPOSITORY_PATH) or not FileAccess.file_exists(FIXTURE_PATH):
        return

    var script = load(REPOSITORY_PATH)
    case.assert_true(script != null and script.can_instantiate(), "Fixture repository must load")
    if script == null or not script.can_instantiate():
        return
    var repository = script.create(FIXTURE_PATH)
    case.assert_true(repository != null, "Fixture repository creates from deterministic JSON")
    if repository == null:
        return

    case.assert_equal(
        [&"SCENARIO_A_NONCOMBAT_PROTECT_CONTROL", &"SCENARIO_B_PRESSURED_FIELD_RESPONSE"],
        repository.fixture_ids(),
        "Exactly two ordered Stage2 fixtures are exposed"
    )
    case.assert_equal(EXPECTED_GLYPHS, repository.runtime_glyph_ids(), "Runtime remains exactly six glyphs")
    for fixture_id in repository.fixture_ids():
        var fixture: Dictionary = repository.fixture(fixture_id)
        case.assert_true(not fixture.is_empty(), "Fixture exists: %s" % fixture_id)
        case.assert_true(fixture.targets.size() >= 1 and fixture.targets.size() <= 4, "Target count remains 1..4")
        case.assert_true(fixture.solution_frames.size() >= 2, "Fixture permits multiple legal solution frames")
        case.assert_false(fixture.has("best_glyph"), "Fixture never provides a best glyph")
        case.assert_false(fixture.has("single_correct_solution"), "Fixture never enforces a single solution")
