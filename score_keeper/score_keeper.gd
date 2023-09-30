extends Node

var current_score := 0
var total_score_collectibles: int

func _ready() -> void:
	total_score_collectibles = get_tree().get_nodes_in_group("score_collectible").size()
	set_score(0)

func add_score(new_score: int) -> void:
	set_score(current_score + new_score)

func set_score(new_score: int) -> void:
	current_score = new_score
	get_tree().call_group("score_subscriber", "_on_score_changed", new_score, total_score_collectibles)
	if current_score >= total_score_collectibles:
		get_tree().call_group("win_subscriber", "_on_win")
