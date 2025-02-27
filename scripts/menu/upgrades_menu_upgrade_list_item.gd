extends HBoxContainer

@onready var value_label: Label = %ValueLabel
@onready var upgrade_button: Button = %UpgradeButton
@onready var price_label: Label = %PriceLabel

var text: String
var value: UseState
var price: UseState

var experience = Game.save_data.experience

func _ready() -> void:
	upgrade_button.text = text
	value_label.text = str(value.value)
	price_label.text = str(price.value)
	
	value.value_changed.connect(_on_value_changed)
	price.value_changed.connect(_on_price_value_changed)
	upgrade_button.pressed.connect(_on_btn_pressed)

func _on_value_changed(_value):
	value_label.text = str(_value)
	
func _on_price_value_changed(_value):
	price_label.text = str(_value)

func _on_btn_pressed() -> void:
	buy_upgrade(value, price, 1, 25)
	
func buy_upgrade(attribute, _price: UseState, summand: int, add_cost: int):
	if experience.value < _price.value: return
	
	experience.value -= _price.value
	price.value += add_cost
	attribute.value += summand
