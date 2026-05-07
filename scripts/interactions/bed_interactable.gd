extends "res://scripts/interactions/interactable.gd"

@export var label_text: String = "Sleep"

@onready var label: Label = $Label

func _ready() -> void:
	label.text = label_text

func interact(_player: Node) -> void:
	ActionSystem.sleep_until_next_day()
