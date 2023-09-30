extends Panel

func _ready() -> void:
	hide_popup()

func show_popup() -> void:
	set_popup_visible(true)

func hide_popup() -> void:
	set_popup_visible(false)

func set_popup_visible(value: bool) -> void:
	visible = value
	get_tree().paused = value
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE if value else Input.MOUSE_MODE_CAPTURED
	$MainMenu.grab_focus()

func _on_win() -> void:
	show_popup()
