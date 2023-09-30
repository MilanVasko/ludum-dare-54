extends Node

const FUEL_PER_ENGINE_FORCE := 0.0001
var current_fuel := 100.0

func _ready() -> void:
	set_fuel(current_fuel)

func burn_fuel(engine_force: float) -> float:
	var amount := absf(engine_force) * FUEL_PER_ENGINE_FORCE
	var force_to_return := engine_force * minf(current_fuel / amount, 1.0)
	set_fuel(current_fuel - amount)
	return force_to_return

func set_fuel(amount: float) -> void:
	current_fuel = clampf(amount, 0.0, 100.0)
	get_tree().call_group("fuel_subscriber", "_on_fuel_changed", current_fuel)

func add_fuel(amount: float) -> void:
	set_fuel(current_fuel + amount)
