class_name Bombs
extends Stats

func _ready():
	value = 3 # Replace with function body.

func update(v = 0):
	value -= v

	if v > 0: #ie damage
		pass
	elif v < 0: #ie heal
		pass
	
	draw()

func draw():
	for i in range(0, get_child_count()):
		if i < value:
			get_child(i).visible = true
		else:
			get_child(i).visible = false
