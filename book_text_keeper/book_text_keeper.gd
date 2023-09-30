extends Node

var current_index := -1

const texts: Array[String] = [
	"Jo Die woke up in a dark, small room with no windows and doors. How did she get there? Where was she? Why was she there?",
	"Jo stood up and looked around herself. There was one small source of light right next to her. A small lamp.",
	"The lamp was weird for one reason. It was electrical, but not connected to any source of electricity!",
	"Jo looked at it. It made no sense. How could it be?",
	"But there was no time to lose. She needed to get out of there.",
	"Jo grabbed the lamp, since it was a light source and she was smart and knew it could help her.",
	"Looking around the room she found a little green plant and a key. But there were no doors.",
	"So she went to look around the walls for some kind of a keyhole, but... Nothing.",
	"Jo is becoming more and more desperate. She starts to pond on the walls.",
	"Suddenly when she punches one wall, a keyhole appears and she tries to insert the key.",
	"The key fits and secret door is opened and Jo carefully steps out of the room, still holding the lamp.",
	"But on the outside, there is only another, similar room with message written on the wall saying: YOU CAN'T ESCAPE LIMITED SPACE."
]

func fetch_latest_text() -> String:
	return texts[current_index]

func _on_book_found() -> void:
	current_index += 1
	get_tree().call_group("book_subscriber", "_on_found_book_index_updated")
