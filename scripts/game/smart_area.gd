class_name SmartArea extends Area2D

var bodies: Array[Node2D] = []

func _ready() -> void:
	body_entered.connect(_on_area_2d_body_entered)
	body_exited.connect(_on_area_2d_body_exited)

func _on_area_2d_body_entered(body: Node2D) -> void:
	bodies.append(body)

func _on_area_2d_body_exited(body: Node2D) -> void:
	bodies.erase(body)
