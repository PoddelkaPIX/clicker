class_name SaveData extends Resource

signal experience_changed(experience)
signal max_combo_changed(value)
signal max_combo_score_changed(value)

const _DEFAULT_DIFFICULTY = 1

@export_category('Core')
var core_hp = UseState.new(1)
var core_damage = UseState.new(0)

@export_category('Cursor')
var cursor_damage = UseState.new(1)

@export_category('Statistics')
@export var best_time: float = 0

@export_category('Upgrades')
var core_hp_upgrade_price: UseState = UseState.new(250)
var core_damage_upgrade_price: UseState = UseState.new(250)
var cursor_damage_upgrade_price: UseState = UseState.new(25)

@export_category('Game')
@export var experience: int:
	set(value):
		experience = value
		experience_changed.emit(experience)
	get():
		return experience

@export var difficulty: float = _DEFAULT_DIFFICULTY: 
	get():
		return difficulty * difficulty_multiplier

@export_category('Statistics')
@export var max_combo: int:
	set(value):
		max_combo = value
		max_combo_changed.emit(value)
		
@export var max_combo_score: int:
	set(value):
		max_combo_score = value
		max_combo_score_changed.emit(value)

var difficulty_multiplier: float = _DEFAULT_DIFFICULTY

func reset_difficulty():
	Game.save_data.difficulty = _DEFAULT_DIFFICULTY
	Game.save_data.difficulty_multiplier = _DEFAULT_DIFFICULTY
