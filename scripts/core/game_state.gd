extends Node

signal status_changed(status: Dictionary)

const MIN_STAT := 0
const MAX_STAT := 100

var day: int = 1
var current_time: String = "07:00"
var money: int = 100
var energy: int = 100
var mood: int = 60
var stress: int = 10

func _ready() -> void:
	status_changed.emit(get_status())

func get_status() -> Dictionary:
	return {
		"day": day,
		"time": current_time,
		"money": money,
		"energy": energy,
		"mood": mood,
		"stress": stress,
	}

func set_time(value: String) -> void:
	current_time = value
	_emit_status_changed()

func add_money(amount: int) -> void:
	money = max(0, money + amount)
	_emit_status_changed()

func spend_money(cost: int) -> bool:
	if cost < 0:
		return false

	if money < cost:
		return false

	money -= cost
	_emit_status_changed()
	return true

func add_energy(amount: int) -> void:
	energy = clampi(energy + amount, MIN_STAT, MAX_STAT)
	_emit_status_changed()

func add_mood(amount: int) -> void:
	mood = clampi(mood + amount, MIN_STAT, MAX_STAT)
	_emit_status_changed()

func add_stress(amount: int) -> void:
	stress = clampi(stress + amount, MIN_STAT, MAX_STAT)
	_emit_status_changed()

func advance_day() -> void:
	day += 1
	_emit_status_changed()

func reset_to_initial_state() -> void:
	day = 1
	current_time = "07:00"
	money = 100
	energy = 100
	mood = 60
	stress = 10
	_emit_status_changed()

func _emit_status_changed() -> void:
	status_changed.emit(get_status())
