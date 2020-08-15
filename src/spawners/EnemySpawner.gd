class_name EnemySpawner
extends Node2D

var monster_holder = []
export var starting_rows = 3

onready var positions = $Positions
onready var row_resource = preload("res://src/spawners/EnemyRowSpawner.tscn")

func _ready():
	setup()

func setup():
	for i in range (0, starting_rows): #will dictate y
		for pos in positions.get_children():
			pass
			#TODO spawn monster
			#setup monster
