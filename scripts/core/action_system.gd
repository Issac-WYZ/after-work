extends Node

signal work_completed
signal purchase_completed(item_id: StringName)
signal purchase_failed(item_id: StringName, reason: String)
signal sleep_completed

const WORK_REWARD := 80
const WORK_ENERGY_COST := -30
const WORK_STRESS_GAIN := 20
const WORK_END_TIME := "18:00"
const WAKE_UP_TIME := "07:00"
const FULL_ENERGY := 100
const SLEEP_STRESS_RECOVERY := -15
const LOW_STRESS_MOOD_THRESHOLD := 20
const HIGH_STRESS_MOOD_THRESHOLD := 50
const LOW_STRESS_MOOD_BONUS := 5
const HIGH_STRESS_MOOD_PENALTY := -5

func complete_work() -> void:
	GameState.add_money(WORK_REWARD)
	GameState.add_energy(WORK_ENERGY_COST)
	GameState.add_stress(WORK_STRESS_GAIN)
	GameState.set_time(WORK_END_TIME)
	work_completed.emit()

func purchase_item(item_id: StringName) -> bool:
	var item := ShopSystem.get_item(item_id)
	if item.is_empty():
		purchase_failed.emit(item_id, "unknown_item")
		return false

	var price := int(item.get("price", 0))
	if not GameState.spend_money(price):
		purchase_failed.emit(item_id, "not_enough_money")
		return false

	_apply_optional_stat_change(item, "energy")
	_apply_optional_stat_change(item, "mood")
	_apply_optional_stat_change(item, "stress")

	purchase_completed.emit(item_id)
	return true

func sleep_until_next_day() -> void:
	GameState.advance_day()
	GameState.set_time(WAKE_UP_TIME)
	GameState.set_energy(FULL_ENERGY)
	GameState.add_stress(SLEEP_STRESS_RECOVERY)
	_adjust_mood_after_sleep()
	sleep_completed.emit()

func _apply_optional_stat_change(item: Dictionary, key: String) -> void:
	var amount := int(item.get(key, 0))
	if amount == 0:
		return

	match key:
		"energy":
			GameState.add_energy(amount)
		"mood":
			GameState.add_mood(amount)
		"stress":
			GameState.add_stress(amount)

func _adjust_mood_after_sleep() -> void:
	var status := GameState.get_status()
	var current_stress := int(status["stress"])

	if current_stress <= LOW_STRESS_MOOD_THRESHOLD:
		GameState.add_mood(LOW_STRESS_MOOD_BONUS)
	elif current_stress >= HIGH_STRESS_MOOD_THRESHOLD:
		GameState.add_mood(HIGH_STRESS_MOOD_PENALTY)
