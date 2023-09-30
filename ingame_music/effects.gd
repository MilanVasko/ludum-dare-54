extends AudioStreamPlayer

@export var speed := 1.0

var accum := 0.0
var panner: AudioEffectPanner

func _ready() -> void:
	var bus_index := AudioServer.get_bus_index("MusicEffects")
	panner = AudioServer.get_bus_effect(bus_index, 0)

func _process(delta: float) -> void:
	accum = fmod(accum + delta * speed, 2.0 * PI)
	panner.pan = sin(accum)
