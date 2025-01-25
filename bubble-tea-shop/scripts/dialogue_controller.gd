extends Node

var current_dialogue: DialogueResource = preload("res://resources/dialogue/test_dialogue_linear.dialogue")
@onready var balloon_list_controller = $"../BalloonListController"

func _input(event):
	if event.is_action_pressed("test_dialogue"):
		balloon_list_controller.start(current_dialogue, "")
