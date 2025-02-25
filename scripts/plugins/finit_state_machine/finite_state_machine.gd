@icon("uid://5vtejjtviphp")
class_name FSM extends Node

signal state_changed(current_state: FSM_State)

var _current_state: FSM_State

func _ready() -> void:
	set_first_state()

func set_state(_to_state_name: String) -> void:
	if _current_state != null:
		if _current_state.has_transition(_to_state_name) == null: return
		_current_state.exit()
	
	_current_state = get_state(_to_state_name)
	_current_state.enter()
	state_changed.emit(_current_state)

func get_state(_state_name: String) -> FSM_State:
	return get_node_or_null(_state_name)

func set_first_state() -> void:
	var state: FSM_State = get_child(0)
	set_state(state.name)

func send_event(event: String):
	var transition: FSM_Transition = _current_state.has_transition(event)
	if transition:
		set_state(transition.get_to_state_name())

func _update(_delta):
	pass
