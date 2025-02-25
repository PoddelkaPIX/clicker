extends Control

@onready var click_range_label: Label = %ClickRangeLabel
@onready var click_damage_label: Label = %ClickDamageLabel
@onready var core_damage_label: Label = %CoreDamageLabel
@onready var hp_label: Label = %HPLabel
@onready var max_combo_label: Label = %MaxComboLabel
@onready var max_combo_score_label: Label = %MaxComboScoreLabel

func _ready() -> void:
	click_damage_label.text = pars_attribute(Game.save_data.cursor_damage)
	core_damage_label.text = pars_attribute(Game.save_data.core_damage)
	hp_label.text = pars_attribute(Game.save_data.core_hp)
	
	max_combo_label.text = str(Game.save_data.max_combo)
	max_combo_score_label.text = str(Game.save_data.max_combo_score)
	
	Game.save_data.max_combo_changed.connect(_on_max_combo_changed)
	Game.save_data.max_combo_score_changed.connect(_on_max_combo_score_changed)

func pars_attribute(attribute: UseState) -> String:
	return str(int(attribute.value))

func _on_max_combo_changed(value):
	max_combo_label.text = str(value)
	
func _on_max_combo_score_changed(value):
	max_combo_score_label.text = str(value)
