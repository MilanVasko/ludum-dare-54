extends AudioStreamPlayer

@export var variations: Array[AudioStream]

func _on_finished() -> void:
	stream = variations[randi_range(0, variations.size() - 1)]
	play()
