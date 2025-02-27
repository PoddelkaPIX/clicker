extends Control

const ITEM = preload("res://scenes/ui/progress_statistics_list_item.tscn")

@onready var cursor_attribute_list: VBoxContainer = %CursorAttributeList
@onready var core_attribute_list: VBoxContainer = %CoreAttributeList
@onready var statistic_list: VBoxContainer = %StatisticList

var damage = Game.save_data.core_attributes['damage']
var hp = Game.save_data.core_attributes['hp']

var core_attributes = Game.save_data.core_attributes
var cursor_attributes = Game.save_data.cursor_attributes
var statistics = Game.save_data.statistics

func _ready() -> void:
	_fill_list(cursor_attributes, cursor_attribute_list)
	_fill_list(core_attributes, core_attribute_list)
	_fill_list(statistics, statistic_list)
	
func _fill_list(items: Dictionary, list):
	for key in items.keys():
		var item = _create_item(key, items[key])
		list.add_child(item)

func _create_item(text, value) -> Control:
	var item = ITEM.instantiate()
	item.text = text
	item.value = value
	return item
