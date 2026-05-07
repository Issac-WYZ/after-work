extends Node

const SCENE_PATHS := {
	&"apartment": "res://scenes/apartment/Apartment.tscn",
	&"main_street": "res://scenes/main_street/MainStreet.tscn",
	&"office": "res://scenes/office/Office.tscn",
	&"convenience_store": "res://scenes/convenience_store/ConvenienceStore.tscn",
}

var _pending_spawn_point: StringName = &""

func change_scene(scene_key: StringName, spawn_point: StringName = &"") -> void:
	if not SCENE_PATHS.has(scene_key):
		push_error("Unknown scene key: %s" % scene_key)
		return

	_pending_spawn_point = spawn_point
	var error := get_tree().change_scene_to_file(SCENE_PATHS[scene_key])
	if error != OK:
		push_error("Failed to change scene to %s: %s" % [scene_key, error])
		_pending_spawn_point = &""
		return

	await get_tree().process_frame
	_move_player_to_spawn_point()

func _move_player_to_spawn_point() -> void:
	if _pending_spawn_point == &"":
		return

	var current_scene := get_tree().current_scene
	if current_scene == null:
		_pending_spawn_point = &""
		return

	var player := current_scene.find_child("Player", true, false) as Node2D
	var spawn_point := current_scene.find_child(String(_pending_spawn_point), true, false) as Node2D

	if player != null and spawn_point != null:
		player.global_position = spawn_point.global_position

	_pending_spawn_point = &""
