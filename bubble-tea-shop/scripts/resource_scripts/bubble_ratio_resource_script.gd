extends Resource
class_name BubbleRatio

enum BubbleFlavour {
	MANGO,
	LIME,
	GRAPE,
	RASPBERRY
}

@export var flavour: BubbleFlavour
@export_range(0, 1) var ratio: float = 0
