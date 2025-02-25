extends Ability

@onready var smart_area: SmartArea = $SmartArea


func  _physics_process(_delta: float) -> void:
	self.global_position = get_parent().get_parent().global_position

func _activate():
	var damage: UseState = Game.save_data.cursor_damage

	if len(smart_area.bodies) == 0:
		Game.send_event(GameEvent.new(Game.GameEventName.CLICK_PAST_ENEMY, {'damage': damage.value}))
	else:
		Game.send_event(GameEvent.new(Game.GameEventName.CLICK_ON_ENEMIES, {'enemies': smart_area.bodies}))

	for body in smart_area.bodies:
		var data = {'damage': int(damage.value), 'enemy': body}
		Game.send_event(GameEvent.new(Game.GameEventName.CLICK_ON_ENEMY, data))
		Game.send_event(GameEvent.new(Game.GameEventName.DEAL_DAMAGE_TO_ENEMY, data))
		
