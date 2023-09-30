extends Node3D

const TWO_PI := PI * 2.0

@export var speed_x: float
@export var speed_y: float
@export var transform_distance: float

var accum_x := 0.0
var accum_y := 0.0

func _process(delta: float) -> void:
	accum_x = fmod(accum_x + delta * speed_x, TWO_PI)
	accum_y = fmod(accum_y + delta * speed_y, TWO_PI)
	position.y = sin(accum_y) * transform_distance
	rotation.y = accum_x
