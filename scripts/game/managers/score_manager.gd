class_name ScoreManager extends Node

func _ready() -> void:
	Game.event_received.connect(_on_game_event_received)
	
func _on_game_event_received(event: GameEvent):
	match event.index:
		#Game.GameEventName.CLICK_PAST_ENEMY:
			#var damage = event.data['damage']
			#Game.save_data.experience -= damage
		Game.GameEventName.POINTS_COUNTED:
			var points = event.data['points']
			Game.save_data.experience += points
