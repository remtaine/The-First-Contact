class_name EnemySpawner
extends Node2D

var monster_holder = []
export var starting_rows = 3

onready var positions = $Positions
onready var row_resource = preload("res://src/spawners/EnemyRowSpawner.tscn")
onready var enemy_resource = preload("res://src/characters/Enemy.tscn")

onready var character_holder = get_parent().get_parent().get_node("Characters")

onready var spawn_checkers = $SpawnCheckers

func _ready():
	set_process(false)
	yield(get_tree().create_timer(3), "timeout")
	set_process(true)
#	spawn_new_enemies()

func spawn_new_enemies():
#	for i in range (0, starting_rows): #will dictate y
	var row = row_resource.instance()
	for ctr in range (0, positions.get_child_count()):
		var hp = randi() % 6 + 1 
		var enemy = null
		if hp != 0:
			enemy = enemy_resource.instance()
			enemy.setup(positions.get_child(ctr).global_position, hp, row, ctr)
		character_holder.add_child(enemy)
	print_debug(row.enemies)

func _process(delta):
#	if not spawn_checker.is_colliding():
	for checker in spawn_checkers.get_children():
		if checker.is_colliding():
			return
	spawn_new_enemies()
