extends Node

signal enter_prep_area
signal exit_prep_area
signal start_day(day: DayResource)
signal game_finished

@export var days: Array[DayResource]
var current_day: int = 0

var isRight = false
@onready var animationcontroller = $Camera2D/AnimationPlayer

func _input(event):
	if not OS.is_debug_build():
		return
	
	if event.is_action_pressed("test_next_day"):
		load_next_day()

func start_game():
	current_day = 0
	load_next_day()

func load_next_day():
	if current_day >= days.size():
		game_finished.emit()
		return
	
	start_day.emit(days[current_day])
	current_day += 1

func _on_button_r_pressed() -> void:
	if !isRight:
		print("Going right!")
		animationcontroller.play("camera_pan")
		isRight = true
		enter_prep_area.emit()

func _on_button_l_pressed() -> void:
	if isRight:
		print("Going left!")
		animationcontroller.play_backwards("camera_pan")
		isRight = false
		exit_prep_area.emit()
