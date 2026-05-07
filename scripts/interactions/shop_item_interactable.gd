extends "res://scripts/interactions/interactable.gd"

@export var item_id: StringName = &"bento"
@export var label_text: String = "Item"

@onready var label: Label = $Label

func _ready() -> void:
	label.text = label_text

func interact(_player: Node) -> void:
	var purchased := ActionSystem.purchase_item(item_id)
	if not purchased:
		push_warning("Purchase failed: %s" % item_id)
