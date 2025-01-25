extends Node

@onready var animationcontroller = $Camera2D/AnimationPlayer

var isRight = false

func _on_button_r_pressed() -> void:
	if !isRight:
		print("Going right!")
		animationcontroller.play("camera_pan")
		isRight = true

func _on_button_l_pressed() -> void:
	if isRight:
		print("Going left!")
		animationcontroller.play_backwards("camera_pan")
		isRight = false
