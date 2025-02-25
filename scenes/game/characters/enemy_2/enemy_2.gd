extends Character

@onready var ENEMY_1 = preload("res://scenes/characters/enemy_1/enemy_1.tscn")

func _death():
	for i in range(3):
		var enemy = ENEMY_1.instantiate()
		enemy.global_position = global_position
		enemy.velocity = Vector2(randi_range(-1000, 1000), randi_range(-1000, 1000))
		enemy.velocity += global_position.direction_to(target_position) * -1000
		get_parent().add_child.call_deferred(enemy)
