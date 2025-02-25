class_name Core extends Area2D

signal destroyed

@onready var animation_tree: AnimationNodeStateMachinePlayback = $AnimationTree['parameters/playback']

@onready var hp: Attribute

func _ready() -> void:	
	hp = Game.save_data.core_hp.duplicate()
	hp.value_changed.connect(_on_hp_value_changed)
	$HP.text = str(int(hp.value))

func _on_hp_value_changed(_value, new_value):
	$HP.text = str(int(new_value))
	if new_value <= 0:
		destroyed.emit()

func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		$HitAudio.playing = true
		body.queue_free()
		hp.value -= body.attribute_manager.get_attribute('Damage').value
		animation_tree.travel('hit')
