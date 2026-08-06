class_name StarCircuitBoard
extends Control

const GrimoireThemeFactory = preload("res://src/ui/theme/grimoire_theme_factory.gd")

const EDIT := &"EDIT"
const VALID := &"VALID"
const TARGET := &"TARGET"
const FINAL := &"FINAL"
const CONFIRM := &"CONFIRM"
const COMMITTED := &"COMMITTED"
const INVALID := &"INVALID"

const ALLOWED_STATES: Array[StringName] = [
    EDIT,
    VALID,
    TARGET,
    FINAL,
    CONFIRM,
    COMMITTED,
    INVALID,
]

var _visual_state: StringName = EDIT
var _active_vertices := 0
var _active_slots: Array[int] = []
var _cause_vertex := -1


func _ready() -> void:
    mouse_filter = Control.MOUSE_FILTER_IGNORE
    resized.connect(Callable(self, "queue_redraw"))
    queue_redraw()


func set_visual_state(
    state: StringName,
    active_vertices: int,
    cause_vertex: int = -1,
    active_slots: Array[int] = []
) -> void:
    _visual_state = state if state in ALLOWED_STATES else EDIT
    _active_vertices = clampi(active_vertices, 0, 5)
    _cause_vertex = clampi(cause_vertex, -1, 4)
    _active_slots = []
    for slot in active_slots:
        if slot >= 0 and slot <= 4 and slot not in _active_slots:
            _active_slots.append(slot)
    _active_slots.sort()
    queue_redraw()


func visual_snapshot() -> Dictionary:
    return {
        "state": _visual_state,
        "active_vertices": _active_vertices,
        "active_slots": _active_slots.duplicate(),
        "cause_vertex": _cause_vertex,
        "vertex_layout": &"MATCHES_HARNESS_SLOT_ANCHORS",
        "reduced_motion_ms": 0,
        "owns_gameplay_state": false,
    }


func _draw() -> void:
    var center := size * 0.5
    var guide_radius := maxf(92.0, minf(size.x, size.y) * 0.43)
    var vertices := _vertex_points(center)
    var state_color := _state_color()
    var dim_line := Color(GrimoireThemeFactory.LINE_BRASS, 0.22)
    var guide_line := Color(GrimoireThemeFactory.LINE_BRASS, 0.36)

    draw_circle(center, guide_radius, Color(GrimoireThemeFactory.SURFACE_INSET, 0.55), true)
    draw_arc(center, guide_radius, 0.0, TAU, 96, guide_line, 2.0, true)
    draw_arc(center, guide_radius * 0.64, 0.0, TAU, 72, dim_line, 1.0, true)
    draw_circle(center, 76.0, Color(GrimoireThemeFactory.SURFACE_PANEL_EMPHASIS, 0.55), true)
    draw_arc(center, 76.0, 0.0, TAU, 48, state_color, 3.0, true)

    for point in vertices:
        draw_line(center, point, dim_line, 1.0, true)

    var star_path := PackedVector2Array([
        vertices[0],
        vertices[2],
        vertices[4],
        vertices[1],
        vertices[3],
        vertices[0],
    ])
    draw_polyline(star_path, Color(state_color, 0.22), 8.0, true)
    draw_polyline(star_path, state_color, _state_line_width(), true)

    for index in range(vertices.size()):
        var point: Vector2 = vertices[index]
        var is_active := (
            index in _active_slots
            if not _active_slots.is_empty()
            else index < _active_vertices
        )
        var ring_color := state_color if is_active else Color(GrimoireThemeFactory.LINE_BRASS, 0.55)
        var fill_color := (
            Color(state_color, 0.22)
            if is_active
            else Color(GrimoireThemeFactory.SURFACE_INSET, 0.82)
        )
        draw_circle(point, 27.0, fill_color, true)
        draw_arc(point, 27.0, 0.0, TAU, 32, ring_color, 2.0 if is_active else 1.0, true)
        draw_circle(point, 4.0, ring_color, true)

    if _visual_state == INVALID and _cause_vertex >= 0:
        var cause_point: Vector2 = vertices[_cause_vertex]
        draw_arc(
            cause_point,
            36.0,
            0.0,
            TAU,
            32,
            GrimoireThemeFactory.DANGER_RED,
            4.0,
            true
        )
        draw_line(
            cause_point + Vector2(-12.0, -12.0),
            cause_point + Vector2(12.0, 12.0),
            GrimoireThemeFactory.DANGER_RED,
            3.0,
            true
        )
        draw_line(
            cause_point + Vector2(12.0, -12.0),
            cause_point + Vector2(-12.0, 12.0),
            GrimoireThemeFactory.DANGER_RED,
            3.0,
            true
        )


func _vertex_points(center: Vector2) -> PackedVector2Array:
    var half := size * 0.5
    return PackedVector2Array([
        center + Vector2(0.0, -half.y * 0.853),
        center + Vector2(half.x * 0.731, -half.y * 0.206),
        center + Vector2(half.x * 0.5, half.y * 0.765),
        center + Vector2(-half.x * 0.5, half.y * 0.765),
        center + Vector2(-half.x * 0.731, -half.y * 0.206),
    ])


func _state_color() -> Color:
    match _visual_state:
        VALID:
            return GrimoireThemeFactory.PLAYER_CYAN
        TARGET:
            return GrimoireThemeFactory.PLAYER_CYAN_BRIGHT
        FINAL:
            return GrimoireThemeFactory.LINE_GOLD_ACTIVE
        CONFIRM:
            return GrimoireThemeFactory.WARNING_AMBER
        COMMITTED:
            return GrimoireThemeFactory.SUCCESS_MINT
        INVALID:
            return GrimoireThemeFactory.DANGER_RED
        _:
            return GrimoireThemeFactory.LINE_BRASS


func _state_line_width() -> float:
    match _visual_state:
        FINAL, CONFIRM, COMMITTED:
            return 4.0
        INVALID:
            return 3.5
        VALID, TARGET:
            return 3.0
        _:
            return 2.0
