class_name Character extends CharacterBody2D

@export var hit_sounds: Array[AudioStreamPlayer]

@onready var difficulty = Game.save_data.difficulty

@onready var hp: Attribute = %HP
@onready var damage: Attribute = %Damage
@onready var move_speed: Attribute = %MoveSpeed

var target_position = Vector2(960, 530)

func _physics_process(delta: float) -> void:
	var dir =  global_position.direction_to(target_position)
	var move_speed_value = move_speed.get_value()
	velocity += (dir * move_speed_value) * delta
	var x = clamp(velocity.x, move_speed_value * -5, move_speed_value * 5)
	var y = clamp(velocity.y, move_speed_value * -5, move_speed_value * 5)
	velocity = Vector2(x, y)
	move_and_slide()
