extends "res://scripts/interactions/interactable.gd"

@export var target_scene: StringName = &"apartment"
@export var target_spawn_point: StringName = &""
@export var label_text: String = ""

@onready var label: Label = $Label

func _ready() -> void:
	if label_text != "":
		label.text = label_text

func interact(_player: Node) -> void:
	SceneManager.change_scene(target_scene, target_spawn_point)
