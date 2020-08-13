class_name Health
extends Stats

func _ready():
	value = 3 # Replace with function body.

func draw():
	for i in range(0, get_child_count()):
		if i < value:
			get_child(i).visible = true
		else:
			get_child(i).visible = false
