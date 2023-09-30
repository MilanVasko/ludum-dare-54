extends VehicleBody3D

@onready var score_keeper = $ScoreKeeper

const MAX_ENGINE_FORCE := 400.0
const MAX_BRAKE_FORCE := 5.0
const MAX_STEER_ANGLE := 0.6

const STEER_SPEED := 5.0
var steer_angle := 0.0

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func _physics_process(delta: float) -> void:
	var throttle_amount := Input.get_action_strength("forward") - Input.get_action_strength("backward")
	var brake_amount := Input.get_action_strength("brake")
	var steer_amount := Input.get_action_strength("turn_left") - Input.get_action_strength("turn_right")

	engine_force = throttle_amount * MAX_ENGINE_FORCE
	brake = brake_amount * MAX_BRAKE_FORCE

	var steer_target := steer_amount * MAX_STEER_ANGLE
	var steer_delta := STEER_SPEED * delta
	if steer_angle > steer_target:
		steer_angle = max(steer_angle - steer_delta, steer_target)
	elif steer_angle < steer_target:
		steer_angle = min(steer_angle + steer_delta, steer_target)
	steering = steer_angle

func add_score(new_score: int) -> void:
	score_keeper.add_score(new_score)
