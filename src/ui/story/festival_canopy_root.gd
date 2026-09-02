class_name FestivalCanopyRoot
extends Control

const StoryProgress = preload("res://src/core/story/story_progress.gd")
const ThemeFactory = preload("res://src/ui/theme/grimoire_theme_factory.gd")

var _progress = null


func _ready() -> void:
    theme = ThemeFactory.create_theme()
    if _progress == null and is_inside_tree() and get_tree() != null:
        configure(StoryProgress.consume_festival_canopy_handoff(get_tree().root))
    var confirm_button := get_node_or_null(NodePath("ClosingPanel/Festival/ConfirmFirstSessionButton")) as Button
    if confirm_button != null and not confirm_button.pressed.is_connected(_on_confirm_first_session_pressed):
        confirm_button.pressed.connect(_on_confirm_first_session_pressed)


func configure(progress) -> void:
    _progress = progress if _is_festival_progress(progress) else null


func confirm_first_session() -> Dictionary:
    if not _is_festival_progress(_progress):
        return {"status": &"FESTIVAL_CANOPY_PROGRESS_REQUIRED"}
    var notice := get_node_or_null(NodePath("ClosingPanel/Festival/CompletionNotice")) as Label
    if notice != null:
        notice.visible = true
        notice.text = "첫 장을 기록했습니다. 다음 수업은 새 사건과 함께 이어집니다."
    var button := get_node_or_null(NodePath("ClosingPanel/Festival/ConfirmFirstSessionButton")) as Button
    if button != null:
        button.disabled = true
    return {
        "status": &"FIRST_SESSION_COMPLETE",
        "current_beat": _progress.current_beat(),
    }


func _on_confirm_first_session_pressed() -> void:
    confirm_first_session()


func _is_festival_progress(progress) -> bool:
    return progress != null and progress.has_method("current_beat") and progress.call("current_beat") == StoryProgress.FESTIVAL_CANOPY
