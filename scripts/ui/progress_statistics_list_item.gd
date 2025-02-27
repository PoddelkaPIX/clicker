extends HBoxContainer

@onready var text_label: Label = %TextLabel
@onready var value_label: Label = %ValueLabel

var text: String
var value: UseState

func _ready() -> void:
	text_label.text = text
	value_label.text = str(value.value)
	
	value.value_changed.connect(_on_value_changed)

func _on_value_changed(new_value):
	value_label.text = str(new_value)
