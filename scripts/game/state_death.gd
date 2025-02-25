extends Node

@export var animation_tree: AnimationTree

func _on_death_entered() -> void:
	if owner is Character:
		var attribute_effect = AttributeEffect.new('MoveSpeed', -(owner.move_speed.get_value() - 50))
		owner.add_child(attribute_effect)
		owner.velocity = Vector2.ZERO
		animation_tree['parameters/playback'].travel('death')

	await get_tree().create_timer(1).timeout
	owner.queue_free()
