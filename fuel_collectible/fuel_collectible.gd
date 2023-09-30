extends Area3D

@export var fuel_amount: float

func _on_body_entered(body: Node3D) -> void:
	if body.has_method("add_fuel"):
		body.add_fuel(fuel_amount)
		queue_free()
