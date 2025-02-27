class_name UseState extends Resource

signal value_changed(new_value)

var value:
	set(_value):
		value = _value
		value_changed.emit(_value)

func _init(_value = 0) -> void:
	value = _value
