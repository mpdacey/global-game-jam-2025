extends Sprite2D

signal character_entered
signal character_is_exiting
signal character_exited

@onready var character_animation_tree: AnimationTree = $CharacterAnimationTree

func _input(event):
	if event.is_action_pressed("test_customer_leave"):
		exit_customer()

func enter_customer(customer_sprite: Texture2D):
	self.texture = customer_sprite
	character_animation_tree.get("parameters/playback").travel("enter")

func exit_customer():
	character_animation_tree.get("parameters/playback").travel("exit")

#region AnimatorSignals

func _emit_entered():
	character_entered.emit()

func _emit_is_exiting():
	character_is_exiting.emit()

func _emit_exited():
	character_exited.emit()

#endregion
