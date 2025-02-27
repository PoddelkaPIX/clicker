extends Menu

const UPGRADE_LIST_ITEM = preload("res://scenes/menu/upgrades_menu_upgrade_list_item.tscn")

@onready var upgrade_list: VBoxContainer = %UpgradeList
@onready var experience_label: Label = %ExperienceLabel

var core_hp = Game.save_data.core_attributes['hp']
var core_damage = Game.save_data.core_attributes['damage']
var cursor_damage = Game.save_data.cursor_attributes['damage']
var experience = Game.save_data.experience

var upgrades = Game.save_data.upgrades

func _ready() -> void:
	super._ready()
	experience_label.text = 'Опыт:' + str(experience.value)
	
	fill_list(upgrades, upgrade_list)
	experience.value_changed.connect(_on_game_experience_changed)

func fill_list(items, list):
	print(items, list)
	for key in items.keys():
		
		var item = items[key]
		var list_item = UPGRADE_LIST_ITEM.instantiate()
		list_item.text = key
		list_item.value = item.value
		list_item.price = item.price
		list.add_child(list_item)

func set_label_text(label, value):
	label.text = str(value)

func _on_game_experience_changed(new_value):
	experience_label.text = 'Опыт:' + str(new_value)

func _on_continue_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game/levels/level_1.tscn")
