extends RefCounted

const COMPONENTS := {
    "composer": "res://src/ui/components/five_point_star_composer.tscn",
    "header": "res://src/ui/components/context_header.tscn",
    "targets": "res://src/ui/components/context_target_selector.tscn",
    "commit": "res://src/ui/components/commit_bar.tscn",
    "evidence": "res://src/ui/components/evidence_pin.tscn",
    "forecast": "res://src/ui/components/forecast_card.tscn",
    "delta": "res://src/ui/components/context_delta_card.tscn",
    "result": "res://src/ui/components/result_axis_card.tscn",
    "causal": "res://src/ui/components/causal_thread.tscn",
}


func run(case) -> void:
    for key in COMPONENTS:
        case.assert_true(FileAccess.file_exists(COMPONENTS[key]), "%s component scene exists" % key)
    case.assert_true(FileAccess.file_exists("res://src/ui/components/star_circuit_board.tscn"), "Existing StarCircuitBoard is preserved")
