extends CanvasLayer

@onready var day_value: Label = $Root/StatusPanel/MarginContainer/GridContainer/DayValue
@onready var time_value: Label = $Root/StatusPanel/MarginContainer/GridContainer/TimeValue
@onready var money_value: Label = $Root/StatusPanel/MarginContainer/GridContainer/MoneyValue
@onready var energy_value: Label = $Root/StatusPanel/MarginContainer/GridContainer/EnergyValue
@onready var mood_value: Label = $Root/StatusPanel/MarginContainer/GridContainer/MoodValue
@onready var stress_value: Label = $Root/StatusPanel/MarginContainer/GridContainer/StressValue

func _ready() -> void:
	if not GameState.status_changed.is_connected(_on_status_changed):
		GameState.status_changed.connect(_on_status_changed)

	_on_status_changed(GameState.get_status())

func _exit_tree() -> void:
	if GameState.status_changed.is_connected(_on_status_changed):
		GameState.status_changed.disconnect(_on_status_changed)

func _on_status_changed(status: Dictionary) -> void:
	day_value.text = str(status["day"])
	time_value.text = str(status["time"])
	money_value.text = "$%d" % int(status["money"])
	energy_value.text = "%d" % int(status["energy"])
	mood_value.text = "%d" % int(status["mood"])
	stress_value.text = "%d" % int(status["stress"])
