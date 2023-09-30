extends Label

func _ready() -> void:
	var total_score_collectibles := get_tree().get_nodes_in_group("score_collectible").size()
	_on_score_changed(0, total_score_collectibles)

func _on_score_changed(new_score: int, total_score_collectibles: int) -> void:
	text = str(new_score) + "/" + str(total_score_collectibles)
