extends Node

var current_event: CharacterEventResource:
	set(value):
		current_event = value
		character_portrait.texture = value.character_sprite
		dialogue_controller.current_dialogue = value.dialogue
		dialogue_controller.start_current_dialogue()
	get:
		return current_event

@onready var character_portrait: Sprite2D = %CharacterPortrait
@onready var dialogue_controller = %DialogueController
