extends Node
## Dedicated QA export entry. Export templates do not support --script.
## Uses a dedicated test family, never the player's story-progress family.
func _ready() -> void:
    call_deferred("_run")

func _run() -> void:
    var failures: Array[String] = []
    if OS.has_feature("editor"): failures.append("NOT_EXPORTED_BINARY")
    for key in ["autoload/HeraGameInspector","autoload/_mcp_game_helper"]:
        if ProjectSettings.has_setting(key): failures.append("EDITOR_AUTOLOAD_IN_PACK")
    var menu = load("res://src/ui/story/story_menu.tscn").instantiate()
    if not menu.save_folder.begins_with("user://grimoire/"): failures.append("NOT_WRITABLE_USER_PATH")
    menu.save_folder = "user://grimoire/export-storage-probe-20260914"
    add_child(menu)
    if "--write" in OS.get_cmdline_user_args():
        menu.request_new()
        if menu.new_pending: menu.confirm_new()
        if is_instance_valid(menu.story_view): menu.story_view.advance_story(0)
    else:
        menu.continue_story()
    if not is_instance_valid(menu.story_view) or menu.story_view.story.stage != 1:
        failures.append("STORY_NOT_RESTORED_AT_CLASSROOM")
    if DisplayServer.get_name() != "headless":
        await RenderingServer.frame_post_draw
        for argument in OS.get_cmdline_user_args():
            if argument.begins_with("--capture="):
                var capture_error := get_viewport().get_texture().get_image().save_png(argument.trim_prefix("--capture="))
                if capture_error != OK: failures.append("CAPTURE_WRITE_FAILED")
    print(JSON.stringify({"mode":"write" if "--write" in OS.get_cmdline_user_args() else "read", "failures":failures, "exported":not OS.has_feature("editor")}))
    menu.queue_free()
    await get_tree().process_frame
    get_tree().quit(0 if failures.is_empty() else 1)
