extends Ability

@onready var smart_area: SmartArea = $SmartArea

@onready var animation_tree: AnimationNodeStateMachinePlayback = $AnimationTree['parameters/playback']

var damage = Game.save_data.core_attributes['damage']
var core_repulsion_power = 0.1

func _physics_process(_delta: float) -> void:
	global_position = owner.global_position

func _activate():
	animation_tree.travel('active')
	for body in smart_area.bodies:
		if body is Character:
			var effect = AttributeEffect.new('HP', -damage.value)
			body.add_child(effect)
			
			var dir = self.global_position.direction_to(body.global_position)
			body.velocity += dir * abs(body.velocity * core_repulsion_power) 
