extends Control

func _ready() -> void:
	hide_popup()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		toggle_popup()

func toggle_popup() -> void:
	set_popup_visible(!visible)

func show_popup() -> void:
	set_popup_visible(true)

func hide_popup() -> void:
	set_popup_visible(false)

func set_popup_visible(value: bool) -> void:
	visible = value
	get_tree().paused = value
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE if value else Input.MOUSE_MODE_CAPTURED
	$Restart.grab_focus()

