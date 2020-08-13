class_name Stats
extends Node2D

export var is_bot = false
export var value = 0

func _ready():
	if is_bot:
		for child in get_children():
			child.visible = false


func update(v = 0):
	value -= v

	if v > 0: #ie damage
		pass
	elif v < 0: #ie heal
		pass
	
	draw()

func draw():
	if not is_bot:
		for i in range(0, get_child_count()):
			if i < value:
				get_child(i).visible = true
			else:
				get_child(i).visible = false
