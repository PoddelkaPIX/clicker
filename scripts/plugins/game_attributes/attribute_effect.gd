class_name AttributeEffect extends Node

var value: float
var attribute_name: String

func _init(_attribute_name: String, _value: float = 0):
	value = _value
	attribute_name = _attribute_name
