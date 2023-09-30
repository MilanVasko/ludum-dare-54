extends Node3D

@export var speed := 5.0
@export var transform_distance := 0.3

var accum_x := 0.0

func _process(delta: float) -> void:
	accum_x = fmod(accum_x + delta * speed, 2.0 * PI)
	position.y = sin(accum_x) * transform_distance
