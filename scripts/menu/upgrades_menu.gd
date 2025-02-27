extends Menu

@onready var experience_label: Label = $ExperienceLabel

@onready var cursor_damage_label: Label = %CursorDamageLabel
@onready var cursor_damage_price_label: Label = %CursorDamagePriceLabel

@onready var core_hp_label: Label = %CoreHPLabel
@onready var core_hp_price_label: Label = %CoreHPPriceLabel

@onready var core_damage_label: Label = %CoreDamageLabel
@onready var core_damage_price_label: Label = %CoreDamagePriceLabel

@onready var save_data = Game.save_data

func _ready() -> void:
	super._ready()
	experience_label.text = 'Опыт:' + str(save_data.experience.value)
	
	set_label_text(cursor_damage_label, save_data.cursor_damage.value)
	set_label_text(core_hp_label, save_data.core_hp.value)
	set_label_text(core_damage_label, save_data.core_damage.value)

	cursor_damage_price_label.text = str(int(save_data.cursor_damage_upgrade_price.value))
	core_hp_price_label.text = str(int(save_data.core_hp_upgrade_price.value))
	core_damage_price_label.text = str(int(save_data.core_damage_upgrade_price.value))

	save_data.experience.value_changed.connect(_on_game_experience_changed)

func set_label_text(label, value):
	label.text = str(int(value))

func _on_game_experience_changed(new_value):
	experience_label.text = 'Опыт:' + str(new_value)

func _on_continue_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game/levels/level_1.tscn")

func _on_cursor_damage_btn_pressed() -> void:
	buy_upgrade(save_data.cursor_damage, save_data.cursor_damage_upgrade_price, 1, 25)
	cursor_damage_price_label.text = str(int(save_data.cursor_damage_upgrade_price.value))
	set_label_text(cursor_damage_label, save_data.cursor_damage.value)

func _on_core_hp_button_pressed() -> void:
	buy_upgrade(save_data.core_hp, save_data.core_hp_upgrade_price, 1, 25)
	core_hp_price_label.text = str(int(save_data.core_hp_upgrade_price.value))
	set_label_text(core_hp_label, save_data.core_hp.value)

func _on_core_damage_btn_pressed() -> void:
	buy_upgrade(save_data.core_damage, save_data.core_damage_upgrade_price, 1, 250)
	core_damage_price_label.text = str(int(save_data.core_damage_upgrade_price.value))
	set_label_text(core_damage_label, save_data.core_damage.value)

func buy_upgrade(attribute, price: UseState, summand: int, add_cost: int):
	if save_data.experience.value < price.value: return
	
	save_data.experience.value -= price.value
	price.value += add_cost
	attribute.value += summand
