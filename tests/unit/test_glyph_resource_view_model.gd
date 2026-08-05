extends RefCounted

const VIEW_MODEL_PATH := "res://src/ui/glyph_resource_view_model.gd"
const STOCK_PATH := "res://src/core/resources/universal_stock_pool.gd"
const VAULT_PATH := "res://src/core/resources/vault_inventory.gd"
const CHARGE_PATH := "res://src/core/resources/universal_stock_charge.gd"

func run(case) -> void:
    case.assert_true(FileAccess.file_exists(VIEW_MODEL_PATH), "glyph_resource_view_model.gd must exist")
    if not FileAccess.file_exists(VIEW_MODEL_PATH):
        return

    var ViewModel = load(VIEW_MODEL_PATH)
    var Stock = load(STOCK_PATH)
    var Vault = load(VAULT_PATH)
    var Charge = load(CHARGE_PATH)
    case.assert_true(ViewModel != null and ViewModel.can_instantiate(), "GlyphResourceViewModel compiles")
    if ViewModel == null or not ViewModel.can_instantiate():
        return

    var stock = Stock.create(2)
    stock.add_one()
    var vault = Vault.create(1)
    var scribe = vault.reserve_for_scribe(&"HEAT", &"view-seed")
    vault.complete_scribe(scribe.reservation_id)
    var charge = Charge.create(10.0)
    charge.advance_active_pressure(4.0, stock)

    var model = ViewModel.build(&"HEAT", true, stock, vault, charge)
    case.assert_equal(&"HEAT", model.glyph_id, "selected glyph is named")
    case.assert_equal("Stock 1/2", model.stock.label, "Stock label is textual")
    case.assert_equal("보관함: 열 1", model.vault.label, "Vault label identifies exact glyph")
    case.assert_true(model.stock.enabled, "Stock source is enabled")
    case.assert_true(model.vault.enabled, "Vault source is enabled")
    case.assert_equal(&"SOURCE_SELECTION_REQUIRED", model.selection_state, "UI cannot auto-pick source")
    case.assert_equal(&"UNIVERSAL_STOCK", model.stock.shape_key, "Stock shape is explicit")
    case.assert_equal(&"EXACT_GLYPH_VAULT", model.vault.role_icon_key, "Vault role icon is explicit")
    case.assert_false(model.has("selected_source"), "model exposes no default selected source")
    case.assert_near(0.4, float(model.charge.progress_ratio), 0.001, "charge progress is normalized")

    var labels := [model.stock.label, model.vault.label, model.charge.label]
    var budgets := [24, 32, 32]
    for index in range(labels.size()):
        var label := String(labels[index])
        case.assert_true(not label.is_empty(), "visible label is never empty")
        case.assert_true(label.length() <= budgets[index], "label stays inside text-scale budget")
        case.assert_false(label in ["빨강", "파랑", "초록", "보라"], "state is not color-only")

    stock.add_one()
    case.assert_equal(1, model.stock.current, "plain model does not retain mutable domain reference")

    var unavailable = ViewModel.build(&"PURIFY", false, stock, vault, charge)
    case.assert_false(unavailable.stock.enabled, "unlearned glyph disables Stock")
    case.assert_false(unavailable.vault.enabled, "unlearned glyph disables Vault")
    case.assert_equal(&"NO_SOURCE_AVAILABLE", unavailable.selection_state, "unavailable state is explicit")
