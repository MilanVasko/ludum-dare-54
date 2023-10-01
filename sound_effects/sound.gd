extends AudioStreamPlayer3D

@export var min_delay: float
@export var max_delay: float

var delay: float

func _ready() -> void:
	delay = randf_range(min_delay, max_delay)

func _process(delta: float) -> void:
	if playing:
		return
	delay -= delta
	if delay <= 0.0:
		delay = randf_range(min_delay, max_delay)
		play()
