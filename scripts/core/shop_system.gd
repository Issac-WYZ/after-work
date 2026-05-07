extends Node

const ITEMS := {
	&"bento": {
		"display_name": "Bento",
		"price": 20,
		"energy": 30,
	},
	&"coffee": {
		"display_name": "Coffee",
		"price": 10,
		"energy": 10,
		"stress": 5,
	},
	&"dessert": {
		"display_name": "Dessert",
		"price": 15,
		"mood": 20,
	},
}

func has_item(item_id: StringName) -> bool:
	return ITEMS.has(item_id)

func get_item(item_id: StringName) -> Dictionary:
	return ITEMS.get(item_id, {})
