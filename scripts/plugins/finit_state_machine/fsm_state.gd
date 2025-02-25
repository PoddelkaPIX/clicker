@icon("uid://df8d6ly0kgryq")
class_name FSM_State extends Node

signal entered
signal exited
signal updated

var _is_disabled = true

var transitions: Array[FSM_Transition] = []

func _init(_state_name: String = "", _transitions: Array[FSM_Transition] = []) -> void:
	if _state_name != "":
		name = _state_name
	transitions = _transitions

func _ready() -> void:
	for transition: FSM_Transition in get_children():
		add_transition(transition)

func _process(delta: float) -> void:
	if _is_disabled: return
	
	update(delta)

func add_transition(_transition: FSM_Transition) -> void:
	transitions.append(_transition)

func has_transition(to_state_name: String) -> FSM_Transition:
	var transition: FSM_Transition = null
	for i in transitions:
		if i.get_to_state_name() == to_state_name:
			transition = i
			break
	return transition

func enter() -> void:
	_is_disabled = false
	entered.emit()
	_enter()

func exit() -> void:
	_is_disabled = true
	exited.emit()
	_exit()

func update(_delta: float) -> void:
	updated.emit()
	_update(_delta)

func _enter() -> void:
	pass

func _exit() -> void:
	pass

func _update(_delta: float) -> void:
	pass
