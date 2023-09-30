extends Node3D

@export var starting_pitch = 20.0

const JOYPAD_SENSITIVITY := 0.035
const MOUSE_SENSITIVITY := 0.0035

const HALF_PI := PI / 2.0
const MIN_PITCH := HALF_PI * 0.1
const MAX_PITCH := HALF_PI * 0.9

@onready var pitch := $Pitch
@onready var camera := $Pitch/Camera3D

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pitch.rotation_degrees.x = starting_pitch

func _process(_delta: float) -> void:
	var inputs := Input.get_vector("look_left_joypad", "look_right_joypad", "look_up_joypad", "look_down_joypad")
	rotation.y = calculate_yaw(rotation.y, inputs.x * JOYPAD_SENSITIVITY)
	pitch.rotation.x = calculate_pitch(pitch.rotation.x, inputs.y * JOYPAD_SENSITIVITY)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var delta_x: float = event.relative.x
		var delta_y: float = event.relative.y
		rotation.y = calculate_yaw(rotation.y, delta_x * MOUSE_SENSITIVITY)
		pitch.rotation.x = calculate_pitch(pitch.rotation.x, delta_y * MOUSE_SENSITIVITY)

func calculate_yaw(current_rotation: float, delta: float) -> float:
	return fmod(current_rotation - delta, 2.0 * PI)

func calculate_pitch(current_rotation: float, delta: float) -> float:
	return clamp(current_rotation + delta, MIN_PITCH, MAX_PITCH)
