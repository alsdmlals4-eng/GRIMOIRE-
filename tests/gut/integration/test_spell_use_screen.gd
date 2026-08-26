# Task8 주문 쓰기 화면이 기존 사용 권한을 중복하지 않는지 검증한다.
extends GutTest

const SpellUseScreen = preload("res://src/ui/spell_workflow/spell_use_screen.gd")

class FakeCoordinator:
    extends RefCounted
    var confirm_calls: Array[StringName] = []

    func prepare_target_preview(_target_keyword: StringName, _target: Dictionary, _payload: Dictionary) -> Dictionary:
        return {"status": &"FINAL_PREVIEW_READY", "preview": {"estimated_mana": 7}}

    func request_use_confirmation() -> bool:
        return true

    func confirm_use(use_transaction_id: StringName) -> Dictionary:
        confirm_calls.append(use_transaction_id)
        return {"status": &"USED"}

func test_explicit_two_step_confirmation_uses_caller_id_once() -> void:
    var screen = SpellUseScreen.new()
    var coordinator = FakeCoordinator.new()
    screen.configure(coordinator, &"opaque-use-id")
    screen.select_target(&"incident.root", {"target_valid": true}, {})
    assert_true(screen.request_confirmation())
    assert_eq(screen.confirm(&"opaque-use-id").get("status", &""), &"USED")
    assert_eq(screen.confirm(&"opaque-use-id").get("status", &""), &"USE_CONFIRMATION_REQUIRED")
    assert_eq(coordinator.confirm_calls, [&"opaque-use-id"])
    screen.free()
