extends Node

signal work_completed

const WORK_REWARD := 80
const WORK_ENERGY_COST := -30
const WORK_STRESS_GAIN := 20
const WORK_END_TIME := "18:00"

func complete_work() -> void:
	GameState.add_money(WORK_REWARD)
	GameState.add_energy(WORK_ENERGY_COST)
	GameState.add_stress(WORK_STRESS_GAIN)
	GameState.set_time(WORK_END_TIME)
	work_completed.emit()
