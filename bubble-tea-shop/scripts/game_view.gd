extends Node

signal enter_prep_area
signal exit_prep_area

var isRight = false
@onready var animationcontroller = $Camera2D/AnimationPlayer

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
