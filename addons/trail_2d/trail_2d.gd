extends Line2D

@export_category('Trail')
@export var length : = 10

@onready var parent : Node2D = get_parent()
var offset : = Vector2.ZERO

func _ready() -> void:
	offset = position
	top_level = true

func _physics_process(_delta: float) -> void:
	global_position = Vector2.ZERO
	
	if  get_point_count() != 0:
		offset = get_point_position(0).normalized()
	var point : = parent.global_position + offset

	for index in range(get_point_count() - 1):
		var old_point = get_point_position(index)
		if old_point == point:
			remove_point(0)
			add_point(point + offset, 0)
			break
		
	add_point(point, 0)
	
	if get_point_count() > length:
		remove_point(get_point_count() - 1)
