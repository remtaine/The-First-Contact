class_name ConditionMenu
extends Node2D

var level_path = "res://src/levels/Level1.tscn"
var menu_path = "res://src/menus/MainMenu.tscn"

onready var final_score = $Labels/Right/FinalScoreLabel

func _ready():
	final_score.text = String(Global.score)
	
func _unhandled_input(event):
	if event.is_action_pressed("reset"):
		get_tree().change_scene(level_path)
	if event.is_action_pressed("menu"):
		get_tree().change_scene(menu_path)
