class_name Enemy
extends Character

var hp : int = 1

func _ready():
	pass

func setup(pos, lives):
	global_position = pos
	hp = lives
