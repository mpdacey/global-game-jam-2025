extends Node

signal day_completed

@export var current_day: DayResource
var _current_event_index = 0
@onready var character_event_controller = %CharacterEventController

func _input(event):
	if event.is_action_pressed("test_proceed_day"):
		play_next_event()

func play_next_event():
	if _current_event_index >= current_day.events.size():
		day_completed.emit()
		return
	
	character_event_controller.current_event = current_day.events[_current_event_index]
	_current_event_index += 1
