extends Node2D

var enemies = []

func _ready():
	pass

func append(e):
	enemies.append(e)

func check_if_match(index) -> Array:
	var matched = []
	matched.append(enemies[index])
	
	var used_hp = enemies[index].hp
	#check left
	if index != 0:
		for i in range(index - 1, -1, -1):
			if enemies[i] == null:
				break
			if enemies[i].hp == used_hp:
				matched.append(enemies[i])
			else:
				break
	#check right
	if index != enemies.size():
		for i in range(index + 1, enemies.size()):
			if enemies[i] == null:
				break
			if enemies[i].hp == used_hp:
				matched.append(enemies[i])
			else:
				break
	return matched
