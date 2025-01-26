extends Node2D

signal handing_drink_to_customer

@export var tea_sprite: Sprite2D
@export var liquid_colors: Array[Color]

@onready var liquidSlider = $LiquidSlider
@onready var bubbleCollection = $Nozzle/BubbleGenerator/BubbleCollection
@onready var bubbleMax = $Nozzle/BubbleGenerator.BUBBLE_MAX_COUNT
@onready var customer_handout_timer = $CustomerHandoutTimer

var isHeld = false
var button_index = 0			#Index of the button that is being held
var bubble_request = 0			#Amount of bubbles requested by the customer
var remaining_capacity = 0		#Total remaining capacity of the slider
var amount_added = 0			#Amount added with each button press; is reset with each button release
var liquid_shared_material: ShaderMaterial = preload("res://materials/liquid_material.tres")

var liquid_cap = 0

var _lid_placed: bool = false

func _ready():
	bubble_request = randi_range(15, bubbleMax)
	remaining_capacity = 100
	liquid_cap = liquidSlider.max_value
	liquid_shared_material.set_shader_parameter("Alpha", 0)
	
	print("I would like " + str(bubble_request) + " bubbles please.")

func _input(event):
	if not OS.is_debug_build():
		return
	
	if event.is_action_pressed("test_cup_fill"):
		_lid_placed = true

func _process(delta):
	increment_slider(button_index)

func increment_slider(id) -> void:
	#If cup capacity remains, add bubbles for as long as the button is held
	if id == 0 and isHeld and remaining_capacity > 0:
		liquidSlider.value = bubbleCollection.get_child_count()
		amount_added = bubbleCollection.get_child_count()
		
		#If the added bubbles exceed the specified amount, print a line saying so
		if bubbleCollection.get_child_count() > bubble_request:
			print("Too many bubbles!")
			
	#Else, if the held button is for liquid, add liquid until cup is full
	elif id == 1 and isHeld and remaining_capacity > 0:
		liquidSlider.value += 1
		remaining_capacity -= 1
		liquid_shared_material.set_shader_parameter("Alpha", liquidSlider.value - liquid_cap)
	print("Remaining capacity is " + str(remaining_capacity))

func hand_drink_to_customer():
	if _lid_placed:
		handing_drink_to_customer.emit()

func reset_cup():
	_lid_placed = false
	liquid_shared_material.set_shader_parameter("Alpha", 0)
	$"Prep-station"/ButtonPanels/AnimationPlayer.play("RESET")

func _on_button_button_down(id) -> void:
	#Set held boolean to true
	isHeld = true
	button_index = id
	if id == 1:
		liquid_shared_material.set_shader_parameter("LiquidColour", liquid_colors[id])

func _on_button_button_up(id) -> void:
	#Set held boolean to false, decrement remaining capacity and reset added amount
	isHeld = false
	if id == 0:
		$"Prep-station"/ButtonPanels/AnimationPlayer.play("Buttons_Up")
	elif id == 1:
		$"Prep-station"/ButtonPanels/AnimationPlayer.play("Buttons_End")
		_lid_placed = true
		
	if amount_added > 0:
		remaining_capacity -= amount_added
		amount_added = 0
	liquid_cap = remaining_capacity
