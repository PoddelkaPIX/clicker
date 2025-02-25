class_name Spawner extends Node

@export var _disabled: bool = false

@export var _character_scene: PackedScene

@export var _spawn_interval: float = 1
@export var _spawn_points_container: Node

@onready var _timer: Timer = Timer.new()

var _spawn_points: Array[Marker2D] = []

func  _ready() -> void:
	add_child(_timer)
	_timer.timeout.connect(_on_timer_timeout)
	_timer.wait_time = _spawn_interval
	_timer.start()
	
	for node in _spawn_points_container.get_children():
		if node is Marker2D:
			_spawn_points.append(node)

func _on_timer_timeout() -> void:
	if _disabled: return
	var sp = _spawn_points.pick_random()
	var character = _character_scene.instantiate()
	character.global_position = sp.global_position
	get_parent().add_child(character)
