extends Label

func _on_time_changed(new_time: float) -> void:
	text = format_time(new_time)

func format_time(time: float) -> String:
	var seconds := int(time) % 60
	var minutes := int(time / 60.0)
	return zero_padding(minutes) + str(minutes) + ":" + zero_padding(seconds) + str(seconds)

func zero_padding(value: int) -> String:
	return "0" if value < 10 else ""
