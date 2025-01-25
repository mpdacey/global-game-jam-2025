extends Node2D

signal max_achieved

const BUBBLE_MAX_COUNT = 40

@export var bubble_colours: Array[Color]
var bubble_scene: PackedScene = preload("res://scenes/bubble.tscn")
var bubble_shared_material: ShaderMaterial = preload("res://materials/bubble_material.tres")
@onready var bubble_collection = $BubbleCollection
@onready var bubble_spawn_timer = $BubbleSpawnTimer

func clear_bubbles():
	for bubble in bubble_collection.get_children():
		bubble.queue_free()

func _on_button_pressed(flavour: BubbleRatio.BubbleFlavour):
	bubble_shared_material.set_shader_parameter("BubbleColour", bubble_colours[flavour])
	_bubble_spawn_time_out()

# Could potentially pool these bubbles, but this will do... I hope
func _bubble_spawn_time_out():
	var bubble = bubble_scene.instantiate()
	bubble_collection.add_child(bubble)
	
	if bubble_collection.get_child_count() >= BUBBLE_MAX_COUNT:
		max_achieved.emit()
		return
	
	bubble_spawn_timer.start()

func _on_button_released():
	bubble_spawn_timer.stop()
