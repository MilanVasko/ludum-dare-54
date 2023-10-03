extends Area3D

@export var fuel_amount: float

const RESPAWN_TIME := 20.0
var respawn_time := 0.0

func _on_body_entered(body: Node3D) -> void:
	if !visible:
		return

	if body.has_method("add_fuel"):
		body.add_fuel(fuel_amount)
		visible = false
		respawn_time = RESPAWN_TIME

func respawn_timer(delta):
	if respawn_time <= 0:
		return

	respawn_time = respawn_time-delta
	if respawn_time < 0:
		visible = true
		respawn_time = 0
