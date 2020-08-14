class_name Level
extends Node2D

onready var menu_path = "res://src/menus/MainMenu.tscn"
onready var screenshake = $Addons/Camera/Screenshake
var score = 0
var shown_score = 0
onready var score_label = $HUD/Control/Score
onready var tween = $Addons/Tween

func _ready():
	update_score()
	
func _process(delta):
	score_label.text = String(ceil(shown_score))
	
func _unhandled_input(event):
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
	if event.is_action_pressed("menu"):
		get_tree().change_scene(menu_path)

func screenshake():
	screenshake.start()

func update_score(s = 0):
	tween.stop(self, "shown_score")	
	set_process(true)
	score += s	
	tween.interpolate_property(self, "shown_score", shown_score, score, 0.8, Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.start()

func _on_Tween_tween_completed(object, key):
	if key == ":shown_score":
		pass
