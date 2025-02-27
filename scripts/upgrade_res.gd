class_name Upgrade extends Resource

@export var price: UseState
@export var value: UseState

func _init(_price: float, _value: UseState) -> void:
	price = UseState.new(_price)
	value = _value
