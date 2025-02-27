class_name SaveData extends Resource

const DEFAULT_DIFFICULTY = 1
const SAVE_PATH = "res://save_1.tres"

var _core_hp = UseState.new(1)
var _core_damage = UseState.new(0)
var _cursor_damage = UseState.new(5)

@export_category('Attributes')
@export var core_attributes: Dictionary[String, UseState] = {
	'hp': _core_hp,
	'damage': _core_damage
}

@export var cursor_attributes: Dictionary[String, UseState] = {
	'damage': _cursor_damage
}

@export_category('Statistics')
@export var statistics: Dictionary[String, UseState] = {
	'best_time': UseState.new(0),
	'max_combo': UseState.new(0),
	'max_combo_score': UseState.new(0)
}

@export_category('Upgrade Prices')
@export var upgrades: Dictionary[String, Upgrade] = {
	'core_hp': Upgrade.new(25, _core_hp),
	'core_damage': Upgrade.new(250, _core_damage),
	'cursor_damage': Upgrade.new(25, _cursor_damage),
}

@export_category('Game')
@export var experience := UseState.new(500)
@export var difficulty: float = DEFAULT_DIFFICULTY

func reset_difficulty():
	Game.save_data.difficulty = DEFAULT_DIFFICULTY

func save():
	ResourceSaver.save(self, SAVE_PATH, ResourceSaver.FLAG_REPLACE_SUBRESOURCE_PATHS)

func load_save() -> SaveData:
	if ResourceLoader.exists(SAVE_PATH):
		return ResourceLoader.load(SAVE_PATH)
	else:
		return SaveData.new()
