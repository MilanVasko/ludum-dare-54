extends Label

func _on_fuel_changed(new_fuel: float) -> void:
	text = format_percent(new_fuel, 1)

func format_percent(value: float, precision: int) -> String:
	return format_number(value, precision) + "%"

func format_number(value: float, precision: int) -> String:
	var p := int(pow(10, precision))
	var expanded := int(abs(value * p))
	return ("-" if value < 0.0 else "") + str(int(expanded / float(p))) + "." + str(expanded % p)
