extends Control

@onready var time_label: Label = $TimeLabel
@onready var experience_label: Label = $ExperienceLabel
@onready var best_time_label: Label = $BestTimeLabel

var secs: int = 0
var mins: int = 0

var experience = Game.save_data.experience
var best_time = Game.save_data.statistics['best_time']

func  _ready() -> void:
	experience.value_changed.connect(_on_game_experience_changed)
	experience_label.text = str(int(experience.value))
	best_time_label.text = "Лучшее время: "+str(Helpers.time_to_string(best_time.value))

func _physics_process(_delta: float) -> void:
	time_label.text = Helpers.time_to_string(Game.time)

func _on_game_experience_changed(_experience):
	experience_label.text = str(int(_experience))
	
func _on_time_node_secs_changed(_secs: Variant) -> void:
	secs = _secs

func _on_time_node_mins_changed(_mins: Variant) -> void:
	mins = _mins
