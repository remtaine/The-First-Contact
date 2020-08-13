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
