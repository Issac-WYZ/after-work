extends CharacterBody2D

@export var move_speed: float = 120.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var interaction_detector: Area2D = $InteractionDetector

var _nearby_interactables: Array[Area2D] = []
var _last_direction := "down"

func _ready() -> void:
	interaction_detector.area_entered.connect(_on_interaction_area_entered)
	interaction_detector.area_exited.connect(_on_interaction_area_exited)
	_play_idle_animation()

func _physics_process(_delta: float) -> void:
	var input_direction := Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)

	velocity = input_direction * move_speed
	move_and_slide()
	_update_animation(input_direction)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		var interactable := _get_current_interactable()
		if interactable != null:
			var viewport := get_viewport()
			if viewport != null:
				viewport.set_input_as_handled()
			interactable.call("interact", self)

func _on_interaction_area_entered(area: Area2D) -> void:
	if not area.has_method("interact"):
		return

	if not _nearby_interactables.has(area):
		_nearby_interactables.append(area)

func _on_interaction_area_exited(area: Area2D) -> void:
	_nearby_interactables.erase(area)

func _get_current_interactable() -> Area2D:
	for index in range(_nearby_interactables.size() - 1, -1, -1):
		if not is_instance_valid(_nearby_interactables[index]):
			_nearby_interactables.remove_at(index)

	if _nearby_interactables.is_empty():
		return null

	_nearby_interactables.sort_custom(_sort_by_distance_to_player)
	return _nearby_interactables.front()

func _sort_by_distance_to_player(a: Area2D, b: Area2D) -> bool:
	return global_position.distance_squared_to(a.global_position) < global_position.distance_squared_to(b.global_position)

func _update_animation(input_direction: Vector2) -> void:
	if input_direction == Vector2.ZERO:
		_play_idle_animation()
		return

	_last_direction = _get_direction_name(input_direction)
	_play_animation("walk_%s" % _last_direction)

func _get_direction_name(input_direction: Vector2) -> String:
	if absf(input_direction.x) > absf(input_direction.y):
		if input_direction.x > 0.0:
			return "right"
		return "left"

	if input_direction.y > 0.0:
		return "down"
	return "up"

func _play_idle_animation() -> void:
	_play_animation("idle_%s" % _last_direction)

func _play_animation(animation_name: String) -> void:
	if animated_sprite.animation == animation_name and animated_sprite.is_playing():
		return

	animated_sprite.play(animation_name)
