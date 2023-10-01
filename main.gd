extends Control

func _ready() -> void:
	$Panel/Play.grab_focus()

func _on_play_pressed() -> void:
	var err := get_tree().change_scene_to_file("res://level1/level1.tscn")
	assert(err == OK)
