class_name Level extends Node

@onready var lose_screen = preload("res://scenes/menu/lose_screen.tscn")


func _ready() -> void:
	Game.save_data.reset_difficulty()
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	Game.game_state = Game.GameState.PLAY
	Game.time = 0

#func _on_core_destroyed():
	#Game.game_state = Game.GameState.LOSE
	#if Game.time > Game.save_data.best_time:
		#Game.save_data.best_time = Game.time
	#get_tree().change_scene_to_packed.call_deferred(lose_screen)
