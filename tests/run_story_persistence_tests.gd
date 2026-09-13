extends SceneTree
## Regression: failed persistence must never publish a transition or allow another paid action.
const Screen = preload("res://src/ui/story/story_screen.gd")
const Flow = preload("res://src/core/shared_spell/story_flow.gd")
const Events = preload("res://src/core/shared_spell/event_session.gd")
const Duel = preload("res://src/core/shared_spell/duel_session.gd")
const Store = preload("res://src/core/shared_spell/story_save.gd")
const Menu = preload("res://src/ui/story/story_menu.tscn")
const FOLDER = "res://artifacts/local-validation/story-persistence-tests"

class FailingScreen extends Screen:
    var reject_write := true
    func persist_payload(payload: Dictionary) -> Dictionary:
        if reject_write: return {"status":"REJECTED","reason":"SAVE_UNWRITABLE"}
        return Store.new().save_progress(ProjectSettings.globalize_path(save_folder),payload)

func _initialize() -> void:
    call_deferred("_run")

func _run() -> void:
    var c = preload("res://tests/test_case.gd").new()
    root.size = Vector2i(1280,720)
    var screen = FailingScreen.new()
    screen.save_folder = "res://src/ui/story/story_screen.gd/no-save"
    root.add_child(screen)
    await process_frame
    var before: Dictionary = screen.story.duplicate(true)
    screen.advance_story(0)
    c.assert_equal(before,screen.story,"failed transition must keep the current scene")
    c.assert_true(screen.has_method("retry_save"),"failed write has an explicit retry")
    if not screen.has_method("retry_save"):
        screen.queue_free()
        await process_frame
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
        quit(1)
        return
    screen.save_folder = FOLDER
    c.assert_true(screen.persistence_blocked,"failed transition locks progression")
    c.assert_equal(1,screen.pending_transition.stage,"only the intended next scene is staged")
    screen.advance_story(0)
    screen.load_story()
    c.assert_equal(before,screen.story,"repeated advance and load cannot discard unsaved transition")
    c.assert_true(not screen.retry_save(),"repeated failure remains blocked")
    screen.reject_write = false
    c.assert_true(screen.retry_save(),"same transition can be persisted")
    c.assert_equal(1,screen.story.stage,"retry publishes exactly one scene transition")
    var generation: int = Store.new().load_progress(ProjectSettings.globalize_path(FOLDER)).generation
    screen.retry_save()
    c.assert_equal(generation,Store.new().load_progress(ProjectSettings.globalize_path(FOLDER)).generation,"idle retry does not rewrite save")
    screen.queue_free()
    await process_frame

    for stage in [2,3,4,6,7]:
        for kind in ["CAST","HELP","STOP"]:
            if stage == 3 and kind == "HELP": continue
            var active = FailingScreen.new()
            active.story = _state(stage)
            active.save_folder = FOLDER.path_join("stage-%d-%s" % [stage,kind])
            root.add_child(active)
            await process_frame
            var view = active.activity_view
            if stage == 3:
                if kind == "CAST": view.select_card(0)
                else: view.choose_action(kind)
            elif kind == "CAST":
                view.select_glyph("WARD" if stage == 6 else "EMBER")
                view.select_target({2:"vessel",4:"leak",6:"device",7:"lamp"}[stage])
            else: view.select_manual(kind)
            view.confirm_action()
            await process_frame
            c.assert_true(active.persistence_blocked,"committed action blocks after save failure stage %d %s" % [stage,kind])
            var committed: Dictionary = active.story.duplicate(true)
            c.assert_equal(view.session,committed.activity,"parent retains exact child result")
            if stage != 3:
                c.assert_equal(kind,committed.activity.receipts.values().back().identity.kind,"fixture exercises intended event action")
            c.assert_true(view.confirm.disabled,"disabled confirm advertises persistence lock")
            view.confirm_action()
            view.continue_story()
            active.load_story()
            active.advance_story(stage)
            c.assert_equal(committed,active.story,"blocked action/load/continue preserve result")
            c.assert_equal(committed.activity,view.session,"child cannot consume twice")
            active.reject_write = false
            c.assert_true(active.retry_save(),"retry writes committed snapshot")
            var loaded: Dictionary = Store.new().load_progress(ProjectSettings.globalize_path(active.save_folder))
            c.assert_equal(committed,loaded.payload.story,"disk contains exact result without replay")
            c.assert_true(not active.persistence_blocked,"successful save releases lock")
            active.queue_free()
            await process_frame

    var reflect = FailingScreen.new()
    reflect.story = _state(5)
    reflect.save_folder = FOLDER.path_join("reflection")
    root.add_child(reflect)
    await process_frame
    reflect.choose_reflection("CAUSE")
    c.assert_equal("",reflect.story.get("reflection",""),"reflection is not published before persistence")
    reflect.choose_reflection("RISK")
    reflect.reject_write = false
    reflect.retry_save()
    c.assert_equal("CAUSE",reflect.story.reflection,"repeated choice cannot replace pending answer")
    reflect.queue_free()
    await process_frame

    var menu = Menu.instantiate()
    menu.save_folder = FOLDER.path_join("menu")
    root.add_child(menu)
    menu.request_new()
    if menu.new_pending: menu.confirm_new()
    var live = menu.story_view
    live.save_folder = "res://src/ui/story/story_screen.gd/no-save"
    live.advance_story(0)
    menu.open_pause()
    menu.request_new()
    menu.save_and_main()
    c.assert_true(is_instance_valid(menu.suspended_story),"failed save-and-main retains paused instance")
    menu.resume_story()
    c.assert_true(menu.story_view == live and live.persistence_blocked,"pause roundtrip preserves lock")
    var error_panel = live.get_node_or_null("PersistenceError")
    c.assert_true(error_panel != null and error_panel.find_children("*","Button",true,false).any(func(b): return b.text == "메뉴"),"recovery overlay keeps menu physically accessible")
    c.assert_true(not menu.request_exit(),"normal close refuses to lose unsaved progress")
    c.assert_true(is_instance_valid(live),"close cancellation keeps the game")
    menu.queue_free()
    await process_frame
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

func _state(stage: int) -> Dictionary:
    var flow = Flow.new()
    var state: Dictionary = flow.create()
    while state.stage < stage:
        if state.stage in Flow.ACTIVITIES:
            var activity: Dictionary = state.activity
            var result: Dictionary
            if state.stage == 3:
                result = Duel.new().apply(activity,{"id":"fixture-stop","revision":activity.revision,"kind":"STOP","ids":[]})
            else:
                result = Events.new().act(activity,{"id":"fixture-stop","expected_revision":activity.spell_state.revision,"kind":"STOP"})
            state = flow.checkpoint(state,result.state).state
        if state.stage == 5: state = flow.reflect(state,"CAUSE").state
        state = flow.advance(state,state.stage).state
    return state
