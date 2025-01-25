extends Node

var current_event: CharacterEventResource:
	set(value):
		current_event = value
		character_portrait.enter_customer(current_event.character_sprite)
	get:
		return current_event

@onready var character_portrait: Sprite2D = %CharacterPortrait
@onready var dialogue_controller = %DialogueController

func display_dialogue():
	dialogue_controller.current_dialogue = current_event.dialogue
	dialogue_controller.start_current_dialogue()
