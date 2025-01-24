extends Node2D

@onready var bubbleSlider = $BubbleSlider
@onready var liquidSlider = $LiquidSlider

var button_held = false
var button_pressed = 0
var bubble_request = 0			#Amount of bubbles requested by the customer
var remaining_capacity = 0		#Total remaining capacity of the slider
var amount_added = 0			#Amount added with each button press; is reset with each button release

func _ready():
	bubble_request = randi_range(20, 80)
	remaining_capacity = bubbleSlider.max_value
	
	print("I would like " + str(bubble_request) + " bubbles please.")

func _process(delta):
	increment_slider(button_pressed)

func increment_slider(id) -> void:
	var b = id
	
	#If cup capacity remains, add bubbles for as long as the button is held
	if b == 0 and button_held and remaining_capacity > 0:
		print("More bubbles!")
		bubbleSlider.value += 1
		liquidSlider.value += 1
		amount_added += 1
		
		if bubbleSlider.value > bubble_request:
			print("Too many bubbles!")
			
	elif b == 1 and button_held and remaining_capacity > 0:
		print("Adding liquid")
		liquidSlider.value += 1
		amount_added += 1
		

func _on_button_button_down(button_id) -> void:
	#Set held boolean to true
	button_held = true
	button_pressed = button_id

func _on_button_button_up(button_id) -> void:
	#Set held boolean to false, decrement remaining capacity and reset added amount
	button_held = false
	remaining_capacity -= amount_added
	amount_added = 0
	
	print("Remaining capacity is " + str(remaining_capacity))
