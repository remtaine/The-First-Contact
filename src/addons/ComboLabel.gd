extends Position2D

onready var label = $Label
func _ready():
	pass

func setup(pos, num):
	global_position = pos
	global_position.x = clamp(global_position.x, 14, 50)
	global_position.y = clamp(global_position.y, 12, 48)
	$Label.text = "Combo x" + String(num)
