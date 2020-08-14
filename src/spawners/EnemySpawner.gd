class_name EnemySpawner
extends Node2D

var monster_holder = []
var starting_rows = 5

onready var row_resource = preload("res://src/spawners/EnemyRowSpawner.tscn")
func _ready():
	for i in range (0,starting_rows):
		pass
