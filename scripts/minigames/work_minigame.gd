extends CanvasLayer

const REQUIRED_PROGRESS := 5
const DIRECTIONS := [
	{"action": "move_up", "label": "UP"},
	{"action": "move_down", "label": "DOWN"},
	{"action": "move_left", "label": "LEFT"},
	{"action": "move_right", "label": "RIGHT"},
]

@onready var prompt_label: Label = $Root/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/PromptLabel
@onready var progress_label: Label = $Root/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ProgressLabel

var _rng := RandomNumberGenerator.new()
var _is_active := false
var _progress := 0
var _current_action := ""

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	_rng.randomize()
	hide()

func start() -> void:
	if _is_active:
		return

	_is_active = true
	_progress = 0
	get_tree().paused = true
	show()
	_show_next_prompt()

func _unhandled_input(event: InputEvent) -> void:
	if not _is_active:
		return

	if event is InputEventKey and event.echo:
		return

	for direction in DIRECTIONS:
		var action := String(direction["action"])
		if event.is_action_pressed(action):
			get_viewport().set_input_as_handled()
			if action == _current_action:
				_progress += 1
				if _progress >= REQUIRED_PROGRESS:
					_finish_work()
				else:
					_show_next_prompt()
			return

func _show_next_prompt() -> void:
	var direction: Dictionary = DIRECTIONS[_rng.randi_range(0, DIRECTIONS.size() - 1)]
	_current_action = String(direction["action"])
	prompt_label.text = String(direction["label"])
	progress_label.text = "%d/%d" % [_progress, REQUIRED_PROGRESS]

func _finish_work() -> void:
	ActionSystem.complete_work()
	_is_active = false
	hide()
	get_tree().paused = false
