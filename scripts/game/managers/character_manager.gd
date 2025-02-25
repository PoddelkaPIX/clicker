class_name CharacterManager extends Node

func _ready() -> void:
	Game.event_received.connect(_on_game_event_received)
	
func _on_game_event_received(event: GameEvent):
	match event.index:
		Game.GameEventName.DEAL_DAMAGE_TO_ENEMY:
			var character: Character = event.data['enemy']
			var damage: int = event.data['damage']
			
			var attribute_effect = AttributeEffect.new('HP', -damage)
			character.add_child(attribute_effect)
