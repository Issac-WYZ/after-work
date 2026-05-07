extends "res://scripts/interactions/interactable.gd"

@export var label_text: String = "Work"
@export var work_minigame_path: NodePath

@onready var label: Label = $Label

func _ready() -> void:
	label.text = label_text

func interact(_player: Node) -> void:
	var work_minigame := get_node_or_null(work_minigame_path)
	if work_minigame == null:
		push_error("Work minigame is not configured.")
		return

	if not work_minigame.has_method("start"):
		push_error("Configured work minigame has no start method.")
		return

	work_minigame.call("start")
