# 사건 설명을 잠시 열고 기존 작업 맥락을 손대지 않은 채 돌려주는 오버레이다.
class_name IncidentExplanationOverlay
extends PanelContainer

signal closed(return_context: Dictionary)

var _return_context: Dictionary = {}


func _ready() -> void:
    var close_button = get_node_or_null(NodePath("Content/CloseButton"))
    if close_button != null:
        close_button.pressed.connect(close)


func present(incident: Dictionary, workflow_context: Dictionary) -> void:
    _return_context = workflow_context.duplicate(true)
    var problem_label = get_node_or_null(NodePath("Content/Problem"))
    if problem_label != null:
        problem_label.text = String(incident.get("problem", "사건 정보를 준비 중입니다."))
    var danger_label = get_node_or_null(NodePath("Content/Danger"))
    if danger_label != null:
        danger_label.text = "위험: %s" % String(incident.get("danger", "미확인"))
    var direction_label = get_node_or_null(NodePath("Content/Direction"))
    if direction_label != null:
        direction_label.text = "필요한 방향: %s" % String(incident.get("required_direction", "관찰 필요"))
    var keywords_label = get_node_or_null(NodePath("Content/Keywords"))
    if keywords_label != null:
        var keywords: Array = Array(incident.get("observed_keywords", []))
        keywords_label.text = "관찰 키워드: %s" % ", ".join(keywords)
    visible = true


func close() -> void:
    visible = false
    closed.emit(_return_context.duplicate(true))


func return_context() -> Dictionary:
    return _return_context.duplicate(true)
