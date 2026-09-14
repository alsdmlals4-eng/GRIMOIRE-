extends Control
## Functional gauge only. The reducer owns time, hazards and terminal outcomes.
var current := 0
var capacity := 6
var summary: Label

func _init() -> void:
    name = "EventClock"
    custom_minimum_size = Vector2(270,140)
    mouse_filter = Control.MOUSE_FILTER_IGNORE
    summary = Label.new()
    summary.position = Vector2(100,4)
    summary.anchor_right = 1
    summary.offset_right = 0
    summary.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    summary.add_theme_font_size_override("font_size",18)
    add_child(summary)

func present(value: int, total: int, effect_delta: int, time_delta: int, projected: int = -1) -> void:
    capacity = maxi(1,total)
    current = clampi(value,0,capacity)
    summary.text = "현재 위험 %d / %d" % [current,capacity]
    if projected >= 0:
        summary.text += "\n예고 %d → %d\n작용 %+d · 시간 %+d" % [current,projected,effect_delta,time_delta]
        var adjustment := projected - current - effect_delta - time_delta
        if adjustment != 0:
            summary.text += "\n상하한 보정 %+d" % adjustment
    summary.text += "\n목표는 별도 확인"
    queue_redraw()

func _draw() -> void:
    for segment in range(capacity):
        var start := -PI / 2 + TAU * segment / capacity + 0.055
        var finish := -PI / 2 + TAU * (segment + 1) / capacity - 0.055
        var color := Color("df9263") if segment < current else Color("364754")
        draw_arc(Vector2(46,49),34,start,finish,16,color,11,true)
