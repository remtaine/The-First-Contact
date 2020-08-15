class_name MainMenu
extends Node2D

export var path = "res://src/menus/StoryMenu.tscn"
onready var anim = $Labels/StartLabel/AnimationPlayer

func _ready():
	anim.play("idle_flash")
	
func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		anim.playback_speed = 10
		yield(get_tree().create_timer(0.6), "timeout")
		get_tree().change_scene(path)

