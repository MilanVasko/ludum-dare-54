extends Node3D

@export var decoration_scenes: Array[PackedScene]
@export var min_scale: float
@export var max_scale: float

func _ready() -> void:
	$Placeholder.queue_free()
	var selected_scene := decoration_scenes[randi_range(0, decoration_scenes.size() - 1)]
	var instance := selected_scene.instantiate()
	add_child(instance)
	instance.scale = Vector3.ONE * randf_range(min_scale, max_scale)
	instance.rotate_y(randf() * 2.0 * PI)
