extends Control
## First-chapter entry. Store owns validity; menu never computes game results.
const Store = preload("res://src/core/shared_spell/story_save.gd")
const Flow = preload("res://src/core/shared_spell/story_flow.gd")
const Story = preload("res://src/ui/story/story_screen.tscn")
var save_folder := "res://artifacts/local-validation/story-progress"
var story_view: Control
var continue_button: Button
var new_pending := false
var message := "첫 학교생활 · 기능 연결판 / 최종 화면 연출 제작 중"

func _ready() -> void:
    show_menu()

func _saved() -> Dictionary:
    return Store.new().load_progress(ProjectSettings.globalize_path(save_folder))

func _has_slots() -> bool:
    for slot in range(2):
        if FileAccess.file_exists(save_folder.path_join("event-%d.save" % slot)): return true
    return false

func request_new() -> void:
    var saved := _saved()
    if saved.status == "LOADED":
        new_pending = true
        message = "새 게임을 시작하면 현재 이야기 진행을 대체합니다. 취소하면 기존 기록이 유지됩니다."
        _menu()
    elif _has_slots():
        message = "손상되었거나 호환되지 않는 저장이 있습니다. 원본을 보존했으며 새 게임으로 덮어쓰지 않습니다."
        _menu()
    else:
        _start_new()

func confirm_new() -> void:
    if not new_pending: return
    new_pending = false
    if _saved().status != "LOADED":
        message = "저장 상태가 변경되었습니다. 원본을 보존합니다."
        _menu()
        return
    _start_new()

func cancel_new() -> void:
    new_pending = false
    message = "새 게임을 취소했습니다. 기존 이야기 기록을 보존했습니다."
    _menu()

func _start_new() -> void:
    var parent := ProjectSettings.globalize_path(save_folder).simplify_path()
    while not DirAccess.dir_exists_absolute(parent):
        if FileAccess.file_exists(parent):
            message = "저장 경로가 폴더가 아닙니다. 현재 기록을 보존합니다."
            _menu()
            return
        var next := parent.get_base_dir()
        if next == parent: break
        parent = next
    var fresh: Dictionary = Flow.new().create()
    var result: Dictionary = Store.new().save_progress(ProjectSettings.globalize_path(save_folder),{"story":fresh})
    if result.status != "SAVED":
        message = "저장할 수 없어 새 게임을 시작하지 않았습니다. 기존 기록은 유지됩니다."
        _menu()
        return
    _enter(fresh)

func continue_story() -> void:
    if new_pending: return
    var saved := _saved()
    if saved.status != "LOADED":
        message = "정상 이야기 저장이 없습니다. 손상된 파일은 덮어쓰지 않습니다."
        _menu()
        return
    _enter(saved.payload.story)

func _clear() -> void:
    for child in get_children():
        remove_child(child)
        child.queue_free()
    story_view = null

func _enter(state: Dictionary) -> void:
    _clear()
    new_pending = false
    story_view = Story.instantiate()
    story_view.story = state.duplicate(true)
    story_view.save_folder = save_folder
    story_view.main_requested.connect(show_menu)
    add_child(story_view)

func show_menu() -> void:
    new_pending = false
    _menu()

func _menu() -> void:
    _clear()
    var margin := MarginContainer.new()
    margin.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    for side in ["left","right","top","bottom"]: margin.add_theme_constant_override("margin_"+side,48)
    add_child(margin)
    var box := VBoxContainer.new()
    box.add_theme_constant_override("separation",12)
    margin.add_child(box)
    var title := Label.new()
    title.text = "GRIMOIRE\n세계를 다시 쓰는 법"
    title.add_theme_font_size_override("font_size",32)
    box.add_child(title)
    var notice := Label.new()
    notice.text = message
    notice.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    notice.custom_minimum_size.y = 64
    notice.add_theme_font_size_override("font_size",22)
    box.add_child(notice)
    if new_pending:
        _button(box,"취소 · 기존 이야기 유지",cancel_new).grab_focus()
        _button(box,"기록을 대체하고 새 게임",confirm_new)
        return
    _button(box,"새 게임",request_new)
    continue_button = _button(box,"이어하기",continue_story)
    continue_button.disabled = _saved().status != "LOADED"
    if continue_button.disabled:
        continue_button.text = "이어하기 · 유효한 저장 없음"
    _button(box,"설정 · 연결 준비 중",func(): pass).disabled = true
    _button(box,"도감 · 연결 준비 중",func(): pass).disabled = true
    if OS.get_name() not in ["Android","iOS","Web"]:
        _button(box,"종료",func(): get_tree().quit())

func _button(parent: Node, caption: String, callback: Callable) -> Button:
    var button := Button.new()
    button.text = caption
    button.custom_minimum_size.y = 56
    button.add_theme_font_size_override("font_size",24)
    button.pressed.connect(callback)
    parent.add_child(button)
    return button
