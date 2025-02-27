class_name GameManager extends Node

@onready var lose_screen = preload("res://scenes/menu/lose_screen.tscn")

var best_time = Game.save_data.statistics['best_time']

func _ready() -> void:
	Game.event_received.connect(_on_game_event_received)
	
func _on_game_event_received(event: GameEvent):
	match event.index:
		Game.GameEventName.CORE_DESTROYED:
			_on_core_destroyed()

func _on_core_destroyed():
	Game.game_state = Game.GameState.LOSE
	if Game.time > best_time.value:
		best_time.value = Game.time
	get_tree().change_scene_to_packed.call_deferred(lose_screen)
