class_name GameManager extends Node

@onready var lose_screen = preload("res://scenes/menu/lose_screen.tscn")

func _ready() -> void:
	Game.event_received.connect(_on_game_event_received)
	
func _on_game_event_received(event: GameEvent):
	match event.index:
		Game.GameEventName.CORE_DESTROYED:
			_on_core_destroyed()

func _on_core_destroyed():
	Game.game_state = Game.GameState.LOSE
	if Game.time > Game.save_data.best_time.value:
		Game.save_data.best_time.value = Game.time
	get_tree().change_scene_to_packed.call_deferred(lose_screen)
