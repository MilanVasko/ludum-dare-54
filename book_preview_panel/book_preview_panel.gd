extends VBoxContainer

@export var self_destruct_instances: bool
@export var book_text_keeper_path: NodePath
@onready var book_text_keeper := get_node(book_text_keeper_path)

var book_preview_scene := preload("res://book_preview/book_preview.tscn")

func _on_found_book_index_updated() -> void:
	var instance := book_preview_scene.instantiate()
	instance.set_text(book_text_keeper.fetch_latest_text())
	add_child(instance)

func _on_voiceover_finished() -> void:
	if self_destruct_instances:
		get_child(0).queue_free()
