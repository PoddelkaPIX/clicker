class_name Level extends Node

func _ready() -> void:
	Game.save_data.reset_difficulty()
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	Game.game_state = Game.GameState.PLAY
	Game.time = 0
