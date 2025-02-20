extends Node2D

@export var tea_sprite: Sprite2D
@export var liquid_colors: Array[Color]

var isHeld = false
var liquid_shared_material: ShaderMaterial = preload("res://materials/liquid_material.tres")

func _on_liquid_button_button_down(id) -> void:
	isHeld = true
	if id == 1:
		liquid_shared_material.set_shader_parameter("LiquidColour", liquid_colors[id])

func _on_liquid_button_button_up(id) -> void:
	isHeld = false
