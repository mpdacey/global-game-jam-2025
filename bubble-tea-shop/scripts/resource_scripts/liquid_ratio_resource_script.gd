extends Resource
class_name LiquidRatio

enum LiquidFlavour {
	PEACH,
	MATCHA,
	COCONUT,
	STRAWBERRY
}

@export var flavour: LiquidFlavour
@export_range(0,1) var ratio: float = 0
