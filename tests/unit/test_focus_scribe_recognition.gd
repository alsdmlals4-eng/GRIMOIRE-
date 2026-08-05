extends RefCounted

const COORDINATOR_PATH := "res://src/input/focus_scribe_recognition_coordinator.gd"
const CANDIDATE_PATH := "res://src/input/recognition_candidate.gd"
const SERVICE_PATH := "res://src/input/glyph_recognition_service.gd"
const REPOSITORY_PATH := "res://src/input/glyph_template_repository.gd"
const VAULT_PATH := "res://src/core/resources/vault_inventory.gd"
const STOCK_PATH := "res://src/core/resources/universal_stock_pool.gd"
const VOCABULARY_PATH := "res://data/glyphs/v1/glyph_vocabulary_v1.json"
const TEMPLATE_DIRECTORY := "res://data/glyphs/v1/slice_templates"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(COORDINATOR_PATH), "focus_scribe_recognition_coordinator.gd must exist")
    if not FileAccess.file_exists(COORDINATOR_PATH):
        return

    var coordinator_script = load(COORDINATOR_PATH)
    var candidate_script = load(CANDIDATE_PATH)
    var vault_script = load(VAULT_PATH)
    var stock_script = load(STOCK_PATH)
    case.assert_true(coordinator_script != null and coordinator_script.can_instantiate(), "FocusScribeRecognitionCoordinator compiles")
    if coordinator_script == null or candidate_script == null or vault_script == null or stock_script == null:
        return

    var service = _service()
    case.assert_true(service != null, "recognition service fixture builds")
    if service == null:
        return

    var vault = vault_script.create(3)
    var stock = stock_script.create(3)
    var reservation: Dictionary = vault.reserve_for_scribe(&"HEAT", &"scribe-success")
    case.assert_equal(&"OK", reservation.get("status", &""), "HEAT scribe slot is reserved")
    var coordinator = coordinator_script.new(
        service,
        vault,
        stock,
        &"HEAT",
        reservation.get("reservation_id", &"")
    )
    var heat_candidate = _candidate(candidate_script, &"HEAT", 0.93, 3)
    var success: Dictionary = coordinator.accept_candidate(heat_candidate, 3)
    case.assert_equal(&"VAULT_GLYPH_CREATED", success.get("status", &""), "matching candidate completes scribe")
    case.assert_equal(&"HEAT", success.get("glyph_id", &""), "success names exact glyph")
    case.assert_equal(1, vault.matching_available_count(&"HEAT"), "exact HEAT is stored")
    case.assert_equal(0, stock.current_total(), "Focus Scribe does not create Universal Stock")

    var success_again: Dictionary = coordinator.accept_candidate(heat_candidate, 3)
    case.assert_equal(success, success_again, "duplicate success returns first immutable result")
    case.assert_equal(1, vault.matching_available_count(&"HEAT"), "duplicate success does not create another glyph")

    var wrong_vault = vault_script.create(2)
    var wrong_stock = stock_script.create(2)
    var wrong_reservation: Dictionary = wrong_vault.reserve_for_scribe(&"HEAT", &"scribe-mismatch")
    var wrong_coordinator = coordinator_script.new(
        service,
        wrong_vault,
        wrong_stock,
        &"HEAT",
        wrong_reservation.get("reservation_id", &"")
    )
    var flow_candidate = _candidate(candidate_script, &"FLOW", 0.95, 4)
    var mismatch: Dictionary = wrong_coordinator.accept_candidate(flow_candidate, 4)
    case.assert_equal(&"RECOGNIZED_GLYPH_DOES_NOT_MATCH_SELECTED", mismatch.get("status", &""), "wrong glyph cannot fill selected slot")
    case.assert_equal(0, wrong_vault.matching_available_count(&"FLOW"), "wrong glyph is not stored")
    case.assert_equal(0, wrong_vault.matching_available_count(&"HEAT"), "mismatch does not complete selected slot")
    case.assert_true(wrong_vault.has_reservation(wrong_reservation.get("reservation_id", &"")), "mismatch keeps active reservation for retry")

    var stale_vault = vault_script.create(2)
    var stale_stock = stock_script.create(2)
    var stale_reservation: Dictionary = stale_vault.reserve_for_scribe(&"HEAT", &"scribe-stale")
    var stale_coordinator = coordinator_script.new(
        service,
        stale_vault,
        stale_stock,
        &"HEAT",
        stale_reservation.get("reservation_id", &"")
    )
    var stale: Dictionary = stale_coordinator.accept_candidate(_candidate(candidate_script, &"HEAT", 0.94, 5), 6)
    case.assert_equal(&"STALE_RECOGNITION_RESULT", stale.get("status", &""), "stale candidate cannot create Vault glyph")
    case.assert_equal(0, stale_vault.matching_available_count(&"HEAT"), "stale result creates no glyph")

    var low_vault = vault_script.create(2)
    var low_stock = stock_script.create(2)
    var low_reservation: Dictionary = low_vault.reserve_for_scribe(&"HEAT", &"scribe-low")
    var low_coordinator = coordinator_script.new(
        service,
        low_vault,
        low_stock,
        &"HEAT",
        low_reservation.get("reservation_id", &"")
    )
    var low: Dictionary = low_coordinator.accept_candidate(_candidate(candidate_script, &"HEAT", 0.50, 7), 7)
    case.assert_equal(&"LOW_CONFIDENCE_REQUIRES_RETRY", low.get("status", &""), "low-confidence candidate cannot create glyph")
    case.assert_equal(0, low_vault.matching_available_count(&"HEAT"), "low confidence creates no glyph")

    for reason in [&"DIRECT_HP_LOSS", &"FOCUS_LOSS", &"BACKGROUND_TRANSITION", &"MANA_ZERO"]:
        var interrupted_vault = vault_script.create(2)
        var interrupted_stock = stock_script.create(2)
        var interrupted_reservation: Dictionary = interrupted_vault.reserve_for_scribe(&"HEAT", StringName("scribe-%s" % String(reason)))
        var interrupted_coordinator = coordinator_script.new(
            service,
            interrupted_vault,
            interrupted_stock,
            &"HEAT",
            interrupted_reservation.get("reservation_id", &"")
        )
        var interrupted: Dictionary = interrupted_coordinator.interrupt(reason)
        case.assert_equal(&"SCRIBE_INTERRUPTED", interrupted.get("status", &""), "interruption returns stable status: %s" % reason)
        case.assert_equal(reason, interrupted.get("reason", &""), "interruption reason is preserved")
        case.assert_equal(2, interrupted_vault.empty_slot_count(), "interruption releases reserved Vault slot: %s" % reason)
        case.assert_equal(0, interrupted_stock.current_total(), "interruption creates no Stock: %s" % reason)
        var after_interrupt: Dictionary = interrupted_coordinator.accept_candidate(_candidate(candidate_script, &"HEAT", 0.95, 8), 8)
        case.assert_equal(interrupted, after_interrupt, "accept after interruption returns terminal result")

    var invalid = coordinator_script.new(service, vault_script.create(1), stock_script.create(1), &"HEAT", &"missing")
    var invalid_result: Dictionary = invalid.accept_candidate(_candidate(candidate_script, &"HEAT", 0.95, 9), 9)
    case.assert_equal(&"INVALID_SCRIBE_RESERVATION", invalid_result.get("status", &""), "missing reservation is rejected")


func _service():
    var repository_script = load(REPOSITORY_PATH)
    var service_script = load(SERVICE_PATH)
    if repository_script == null or service_script == null:
        return null
    var repository_result: Dictionary = repository_script.load_from_paths(VOCABULARY_PATH, TEMPLATE_DIRECTORY)
    if repository_result.get("status", &"") != &"OK":
        return null
    return service_script.new(repository_result.get("value"), 0.80, 0.10)


func _candidate(candidate_script, glyph_id: StringName, score: float, revision: int):
    var created: Dictionary = candidate_script.create(glyph_id, score, 0.1, StringName("%s-01" % String(glyph_id).to_lower()), revision)
    return created.get("value")
