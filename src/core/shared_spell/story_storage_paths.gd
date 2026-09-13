extends RefCounted
## Editor runs stay inside the checkout; exported games use writable player data.

static func root(editor_session: bool) -> String:
    return "res://artifacts/local-validation" if editor_session else "user://grimoire"

static func folder(family: String, editor_session: bool) -> String:
    return root(editor_session).path_join(family)
