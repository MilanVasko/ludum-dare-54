extends Node3D

@export var rotate_speed: float

func _ready() -> void:
	rotate_y(randf() * 2 * PI)

func _process(delta: float) -> void:
	rotate_y(delta * rotate_speed)
