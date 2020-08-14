extends CPUParticles2D

func _ready():
	pass

func setup(pos, c = Color.white):
	global_position = pos
	color = c
	emitting = true
