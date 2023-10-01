extends AudioStreamPlayer3D

var current_index := -1

@export var audio_files: Array[AudioStreamWAV]
var queued_audio_files: Array[AudioStreamWAV] = []

func _process(_delta: float) -> void:
	if !playing && !queued_audio_files.is_empty():
		var queued_audio_file := queued_audio_files[0]
		queued_audio_files.remove_at(0)
		stream = queued_audio_file
		var bus_index := AudioServer.get_bus_index("EverythingExceptVoiceover")
		AudioServer.set_bus_volume_db(bus_index, -14.0)
		play()

func _on_book_found() -> void:
	current_index += 1
	queued_audio_files.push_back(audio_files[current_index])
	# get_tree().call_group("book_subscriber", "_on_found_book_index_updated")

func _on_finished() -> void:
	var bus_index := AudioServer.get_bus_index("EverythingExceptVoiceover")
	AudioServer.set_bus_volume_db(bus_index, 0.0)
	get_tree().call_group("book_subscriber", "_on_voiceover_finished")
