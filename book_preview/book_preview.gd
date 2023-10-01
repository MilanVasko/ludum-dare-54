extends PanelContainer

@export var time_to_live := 5.0

func set_text(new_text: String) -> void:
	$Label.text = new_text

