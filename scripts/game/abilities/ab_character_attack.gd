extends Ability

@export var damage = 1
@export var attack_speed = 0.1

@onready var smart_area: SmartArea = $SmartArea

var core: Character

func _physics_process(_delta: float) -> void:
	self.global_position = get_parent().get_parent().global_position

func _on_smart_area_body_entered(body: Node2D) -> void:
	core = body
	trigger()
	
func _activate():
	await get_tree().create_timer(attack_speed).timeout
	var attribute_effect = AttributeEffect.new('HP', -1)
	core.add_child(attribute_effect)
