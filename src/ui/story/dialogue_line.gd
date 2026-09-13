extends Resource
## Presentation metadata only; never a save snapshot or a gameplay command.
@export var line_id: String = ""
@export var speaker_id: String = "NARRATOR"
@export var text_key: String = ""
@export var portrait_state: String = "neutral"
@export var actor_slots: Dictionary = {}
@export var choices: Array[Dictionary] = []
