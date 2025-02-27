class_name ScoreManager extends Node

func _ready() -> void:
	Game.event_received.connect(_on_game_event_received)
	
func _on_game_event_received(event: GameEvent):
	match event.index:
		Game.GameEventName.POINTS_COUNTED:
			var points = event.data['points']
			Game.save_data.experience.value += points
