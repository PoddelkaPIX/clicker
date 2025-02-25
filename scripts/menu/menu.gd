class_name Menu extends Control

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	Game.game_state = Game.GameState.MENU

func show_node(node: Control):
	for childe in get_children():
		childe.visible = false
	
	node.visible = true

func _to_initial_state():
	pass
