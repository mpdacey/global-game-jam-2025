extends Node

func _input(event):
	if event.is_action_pressed("test_dialogue"):
		DialogueManager.show_dialogue_balloon_scene(preload("res://scenes/custom_button/balloon.tscn"),load("res://resources/dialogue/test_dialogue_linear.dialogue"))
