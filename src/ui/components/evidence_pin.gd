class_name EvidencePin
extends PanelContainer

var _known_count := 0
var _unknown_count := 0
var _lens_label := ""
var _compact := false


func configure(known_count: int, unknown_count: int, lens_label: String, compact: bool = false) -> void:
    _known_count = maxi(0, known_count)
    _unknown_count = maxi(0, unknown_count)
    _lens_label = lens_label
    _compact = compact

    get_node("Margin/Rows/Title").visible = not _compact
    get_node("Margin/Rows/Badges/Known/Label").text = "KNOWN  %d" % _known_count
    get_node("Margin/Rows/Badges/Unknown/Label").text = "UNKNOWN  %d" % _unknown_count
    get_node("Margin/Rows/Lens").text = "LENS  %s" % _lens_label
    custom_minimum_size.y = 88.0 if _compact else 118.0


func visual_snapshot() -> Dictionary:
    return {
        "known": _known_count,
        "unknown": _unknown_count,
        "lens": _lens_label,
    }
