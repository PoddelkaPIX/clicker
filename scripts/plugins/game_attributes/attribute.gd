class_name Attribute extends Node

signal value_changed(value, new_value)
signal min_value_changed(value, new_value)
signal max_value_changed(value, new_value)

@export_category('Values')
@export var _value := 0.0:
	set(new_value):
		value_changed.emit(_value, new_value)
		_value = new_value

@export var _min_value := 0:
	set(new_value):
		min_value_changed.emit(_min_value, new_value)
		_min_value = new_value
		
@export var max_value := -1.0:
	set(new_value):
		max_value_changed.emit(max_value, new_value)
		max_value = new_value

func _ready() -> void:
	owner.child_entered_tree.connect(_on_owner_child_entered_tree)

func get_value() -> float:
	return _value

func _on_owner_child_entered_tree(node):
	if node is AttributeEffect and node.attribute_name == name:
		_value += node.value
		node.queue_free()

#func apply_status_effects(value: float) -> float:
	#if status_effects_map == null: return value
	#
	#var buffed = 0
	#var debuffed = 0
	#
	#for status_effect: StatusEffect in status_effects_map.get_children():
		#if name not in status_effect.modifiable_attributes: return value
		#if status_effect.type == StatusEffect.EType.BUFF:
			#buffed += status_effect.modify(value)
		#if status_effect.type == StatusEffect.EType.DEBUFF:
			#debuffed += status_effect.modify(value)
#
	#return value + (buffed - debuffed)
