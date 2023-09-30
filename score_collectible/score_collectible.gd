extends Area3D

const SCORE_AMOUNT := 1

func _on_body_entered(body: Node3D) -> void:
	if body.has_method("add_score"):
		body.add_score(SCORE_AMOUNT)
		get_tree().call_group("book_subscriber", "_on_book_found")
		queue_free()
