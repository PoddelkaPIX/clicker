extends Menu
@onready var time_label: Label = $Time
@onready var experience_label: Label = $ExperienceLabel

func _ready() -> void:
	super._ready()
	time_label.text = 'Время: ' + Helpers.time_to_string(Game.time)
	experience_label.text = 'Опыт: ' + str(Game.save_data.experience.value)

func _on_timer_timeout() -> void:
	
	$UpgradesMenuBtn.disabled = false

func _on_upgrades_menu_btn_pressed() -> void:
	get_tree().change_scene_to_file('res://scenes/menu/upgrades_menu.tscn')
