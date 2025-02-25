class_name UseState extends Resource

signal value_changed(old_value, new_value)

var value:
	set(_value):
		value = _value
		value_changed.emit(_value)

func _init(_value) -> void:
	value = _value
