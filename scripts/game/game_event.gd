class_name GameEvent

var index: int
var data: Dictionary

func _init(_index: int, _data: Dictionary = {}) -> void:
	index = _index
	data = _data
