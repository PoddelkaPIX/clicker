extends Menu
	
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game/levels/level_1.tscn")
