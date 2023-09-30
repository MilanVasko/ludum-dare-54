extends Area3D

@export
var score_amount := 5

func _on_body_entered(body: Node3D) -> void:
	if body.has_method("add_score"):
		body.add_score(score_amount)
		queue_free()
