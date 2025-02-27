class_name UseState extends Resource

signal value_changed(value)

@export var value: float:
	set(_value):
		value = _value
		value_changed.emit(value)

func _init(_value = 0.0) -> void:
	value = _value
