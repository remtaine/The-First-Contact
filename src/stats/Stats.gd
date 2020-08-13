class_name Stats
extends Node2D

export var value = 0

func _ready():
	pass # Replace with function body.

func update(v = 0):
	value -= v

	if v > 0: #ie damage
		pass
	elif v < 0: #ie heal
		pass
	
	draw()

func draw():
	pass
