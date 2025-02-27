extends Character

@onready var hp_label: Label = %HPLabel

func _ready() -> void:
	hp_label.text = str(int(hp.get_value()))
	
	var effect = AttributeEffect.new('HP', Game.save_data.core_hp.value)
	add_child(effect)

func _on_hp_value_changed(new_value: Variant) -> void:
	hp_label.text = str(int(new_value))
	if new_value <= 0:
		Game.send_event(GameEvent.new(Game.GameEventName.CORE_DESTROYED))
