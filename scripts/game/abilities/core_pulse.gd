extends Ability

@onready var smart_area: SmartArea = $SmartArea

@onready var animation_tree: AnimationNodeStateMachinePlayback = $AnimationTree['parameters/playback']

func _activate():
	animation_tree.travel('active')
	
	for body in smart_area.bodies:
		if body is Character:
			var effect = AttributeEffect.new('HP', Game.save_data.core_damage.value)
			if Game.save_data.repulsion_upgrade:
				var dir = self.global_position.direction_to(body.global_position)
				body.velocity += dir * abs(body.velocity) 
