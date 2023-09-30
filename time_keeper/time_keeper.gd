extends Node

var current_time := 0.0

func _ready() -> void:
	set_time(0.0)

func _process(delta: float) -> void:
	set_time(current_time + delta)

func set_time(new_time: float) -> void:
	current_time = new_time
	get_tree().call_group("time_subscriber", "_on_time_changed", current_time)
