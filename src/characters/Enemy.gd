class_name Enemy
extends Character

var hp : int = 1
export var val = 1

func _ready():
	sound_hurt = preload("res://sounds/sfx/enemy_hit.wav")
	sound_die = preload("res://sounds/sfx/enemy_dead.wav")
	randomize()
	sprite.play(String(randi()% 4 + 1))

func setup(pos, lives):
	global_position = pos
	hp = lives
