extends PanelContainer

@export var self_destruct := false
@export var time_to_live := 5.0

func set_text(new_text: String) -> void:
	$Label.text = new_text

func _process(delta: float) -> void:
	if self_destruct:
		time_to_live -= delta
		if time_to_live <= 0.0:
			queue_free()
