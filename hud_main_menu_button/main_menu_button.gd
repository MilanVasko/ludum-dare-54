extends Button

func _on_pressed() -> void:
	var err := get_tree().change_scene_to_file("res://main_menu/main_menu.tscn")
	assert(err == OK)
