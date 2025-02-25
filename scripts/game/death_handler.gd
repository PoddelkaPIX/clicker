extends Node

@export var fsm: FSM

func _ready() -> void:
	if owner is Character:
		await owner.ready
		owner.hp.value_changed.connect(_on_character_hp_value_changed)
		
func _on_character_hp_value_changed(_old_value, new_value):
	if new_value <= 0:
		fsm.send_event('Death')
