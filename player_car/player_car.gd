extends VehicleBody3D

@onready var score_keeper := $ScoreKeeper
@onready var fuel_tank := $FuelTank
@onready var engine := $Engine

@onready var back_light_left := $BackLightLeft
@onready var back_light_right := $BackLightRight

const MAX_ENGINE_FORCE := 400.0
const MAX_BRAKE_FORCE := 5.0
const MAX_STEER_ANGLE := 0.6

const STEER_SPEED := 5.0
var steer_angle := 0.0

func _process(_delta: float) -> void:
	var braking := is_braking()
	back_light_left.visible = braking
	back_light_right.visible = braking

func _physics_process(delta: float) -> void:
	var throttle_amount := Input.get_action_strength("forward") - Input.get_action_strength("backward")
	var brake_amount := Input.get_action_strength("brake")
	var steer_amount := Input.get_action_strength("turn_left") - Input.get_action_strength("turn_right")

	engine_force = throttle_amount * MAX_ENGINE_FORCE
	if is_speeding_up():
		if !engine.playing:
			if engine_force > 0.0:
				engine.play()
		else:
			if engine_force <= 0.0:
				engine.stop()
		engine_force = fuel_tank.burn_fuel(engine_force)
	else:
		if engine.playing:
			engine.stop()
	brake = brake_amount * MAX_BRAKE_FORCE

	var steer_target := steer_amount * MAX_STEER_ANGLE
	var steer_delta := STEER_SPEED * delta
	if steer_angle > steer_target:
		steer_angle = max(steer_angle - steer_delta, steer_target)
	elif steer_angle < steer_target:
		steer_angle = min(steer_angle + steer_delta, steer_target)
	steering = steer_angle

func is_braking() -> bool:
	return brake > 0.0 || is_braking_via_throttle()

func is_braking_via_throttle() -> bool:
	return linear_velocity.normalized().dot(transform.basis.z.normalized()) > 0.5 && engine_force < 0.0

func is_speeding_up() -> bool:
	return !is_braking_via_throttle()

func add_score(score_to_add: int) -> void:
	score_keeper.add_score(score_to_add)

func add_fuel(fuel_to_add: float) -> void:
	fuel_tank.add_fuel(fuel_to_add)
