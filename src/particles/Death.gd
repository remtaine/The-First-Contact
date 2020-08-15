extends CPUParticles2D

var sound = preload("res://sounds/sfx/enemy_dead.wav")
onready var audio = $Audio

func _ready():
	pass
	
func setup(pos, c = Color.white):
	global_position = pos
	color = c
	emitting = true
	$Audio.stream = sound
	$Audio.play()

func _on_Audio_finished():
	queue_free()
