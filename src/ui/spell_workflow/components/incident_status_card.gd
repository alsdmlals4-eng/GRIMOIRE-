# 사건의 즉시 위험과 필요한 방향을 읽기 쉽게 표시하는 카드다.
class_name IncidentStatusCard
extends PanelContainer

var _incident: Dictionary = {}


func bind_incident(incident_data: Dictionary) -> void:
    _incident = incident_data.duplicate(true)
    _refresh()


func incident() -> Dictionary:
    return _incident.duplicate(true)


func _ready() -> void:
    _refresh()


func _refresh() -> void:
    var problem_label = get_node_or_null(NodePath("Content/Problem"))
    if problem_label != null:
        problem_label.text = String(_incident.get("problem", "사건 정보를 준비 중입니다."))
    var danger_label = get_node_or_null(NodePath("Content/Danger"))
    if danger_label != null:
        danger_label.text = "위험: %s" % String(_incident.get("danger", "미확인"))
    var direction_label = get_node_or_null(NodePath("Content/Direction"))
    if direction_label != null:
        direction_label.text = "필요한 방향: %s" % String(_incident.get("required_direction", "관찰 필요"))
    var urgency_label = get_node_or_null(NodePath("Content/Urgency"))
    if urgency_label != null:
        urgency_label.text = "긴급도: %s" % String(_incident.get("urgency", "보통"))
