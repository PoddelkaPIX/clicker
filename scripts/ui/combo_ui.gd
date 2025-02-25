extends Control

@export var combo_counter: ComboCounter

@onready var label: Label = $PanelContainer/Label


func _ready() -> void:
	visible = false
	label.modulate = Color.BLUE_VIOLET
	combo_counter.score_combo_changed.connect(_on_score_combo_changed)
	Game.event_received.connect(_on_game_event_received)

func _on_score_combo_changed(combo_score: int, combo):
	if combo_score != 0:
		visible = true
		label.text = str(abs(combo_score))+' ('+str(combo)+')'

func _on_game_event_received(event: GameEvent):
	match event.index:
		Game.GameEventName.POINTS_COUNTED:
			label.modulate = Color.GREEN
			label.text = "+"+label.text
			hide_label(0.2)
		Game.GameEventName.POINTS_NO_COUNTED:
			label.modulate = Color.RED
			hide_label(0.2)
		
func hide_label(delay: float):
	await get_tree().create_timer(delay).timeout
	label.modulate = Color.BLUE_VIOLET
	visible = false
	
