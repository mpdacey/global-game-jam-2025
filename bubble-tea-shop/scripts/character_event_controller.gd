extends Node

var current_event: CharacterEventResource:
	set(value):
		current_event = value
		character_portrait.texture = value.character_sprite
		dialogue_controller.current_dialogue = value.dialogue
	get:
		return current_event

@onready var character_portrait: Sprite2D = %CharacterPortrait
@onready var dialogue_controller = %DialogueController

func _ready():
	current_event = preload("res://resources/events/AlexA.tres")
