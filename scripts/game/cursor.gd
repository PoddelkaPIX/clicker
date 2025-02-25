extends Node2D

@onready var animation_tree: AnimationNodeStateMachinePlayback = $AnimationTree['parameters/playback']

func _physics_process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	
	if Input.is_action_just_pressed('m_1'):
		animation_tree.travel('click')
		%AbClick.trigger()
