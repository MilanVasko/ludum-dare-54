extends Node

var current_score := 0

func _ready() -> void:
	set_score(0)

func add_score(new_score: int) -> void:
	set_score(current_score + new_score)

func set_score(new_score: int) -> void:
	current_score = new_score
	get_tree().call_group("score_subscriber", "_on_score_changed", new_score)
