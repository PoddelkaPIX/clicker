class_name ComboManager extends Node

signal score_combo_changed(combo_score, combo)

@onready var timer: Timer = Timer.new()

var _score_combo: int = 0:
	set(value):
		_score_combo = value
		score_combo_changed.emit(_score_combo, _combo)

var _combo: int = 0

var max_combo = Game.save_data.statistics['max_combo']
var max_combo_score = Game.save_data.statistics['max_combo_score']

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)
	Game.event_received.connect(_on_game_event_received)

func _on_timer_timeout() -> void:
	Game.send_event(GameEvent.new(Game.GameEventName.POINTS_COUNTED, {'points': abs(_score_combo)}))
	
	if _combo > max_combo.value:
		max_combo.value = _combo
	
	if _score_combo > max_combo_score.value:
		max_combo_score.value = _score_combo
		
	_reset()

func _on_game_event_received(event: GameEvent):
	match event.index:
		Game.GameEventName.CLICK_PAST_ENEMY:
			Game.send_event(GameEvent.new(Game.GameEventName.POINTS_NO_COUNTED))
			_reset()
			timer.stop()
		Game.GameEventName.CLICK_ON_ENEMY:
			timer.stop()
			timer.wait_time = 0.3
			timer.start()
			var damage = event.data["damage"]
			_score_combo += damage
		Game.GameEventName.CLICK_ON_ENEMIES:
			_combo += 1
		
func _reset():
	_score_combo = 0
	_combo = 0
