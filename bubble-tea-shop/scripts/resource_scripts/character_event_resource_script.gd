extends Resource
class_name CharacterEventResource

enum LiquidFlavour {
	PEACH,
	MATCHA,
	COCONUT,
	STRAWBERRY
}

@export var bubbles: Array[BubbleRatio]
@export var liquid: LiquidFlavour
@export var character_sprite: Texture2D
@export var dialogue: DialogueResource
