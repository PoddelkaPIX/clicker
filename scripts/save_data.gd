class_name SaveData extends Resource

const _DEFAULT_DIFFICULTY = 1

@export_category('Core')
var core_hp = UseState.new(1)
var core_damage = UseState.new(0)

@export_category('Cursor')
var cursor_damage = UseState.new(1)

@export_category('Statistics')
@export var best_time := UseState.new(0)
@export var max_combo := UseState.new(0)
@export var max_combo_score := UseState.new(0)

@export_category('Upgrade Prices')
var core_hp_upgrade_price: UseState = UseState.new(25)
var core_damage_upgrade_price: UseState = UseState.new(250)
var cursor_damage_upgrade_price: UseState = UseState.new(25)

@export_category('Upgrades')
var repulsion_upgrade = true

@export_category('Game')
@export var experience := UseState.new(0)

@export var difficulty: float = _DEFAULT_DIFFICULTY: 
	get():
		return difficulty * difficulty_multiplier

var difficulty_multiplier: float = _DEFAULT_DIFFICULTY

func reset_difficulty():
	Game.save_data.difficulty = _DEFAULT_DIFFICULTY
	Game.save_data.difficulty_multiplier = _DEFAULT_DIFFICULTY
