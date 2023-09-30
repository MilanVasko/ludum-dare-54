extends Control

func _on_pressed() -> void:
	var err := get_tree().change_scene_to_file("res://main.tscn")
	assert(err == OK)
