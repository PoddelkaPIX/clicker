extends Node

signal game_state_changed(new_state)
signal event_received(event: GameEvent)

enum GameState {MENU, PAUSE, PLAY, LOSE, WIN}
enum GameEventName {
	POINTS_NO_COUNTED,
	POINTS_COUNTED,
	CLICK_PAST_ENEMY,
	CLICK_ON_ENEMY,
	CLICK_ON_ENEMIES,
	CORE_DESTROYED,
	DEAL_DAMAGE_TO_ENEMY
}

var save_data: SaveData = SaveData.new()

var time: float = 0

var game_state: GameState = GameState.PLAY:
	set(value):
		game_state = value
		game_state_changed.emit(value)

func _ready() -> void:
	save_data = save_data.load_save()
	game_state_changed.connect(_on_game_state_changed)

func _physics_process(delta: float) -> void:
	if game_state == GameState.PLAY:
		time  += delta

func _input(event: InputEvent) -> void:
	if event.is_action('ui_focus_next'):
		save_data.save()
		get_tree().quit()
		
func _on_game_state_changed(new_state):
	match new_state:
		GameState.LOSE:
			pass
		GameState.WIN:
			pass

func send_event(event: GameEvent):
	event_received.emit(event)
