class_name MainMenu
extends Node2D

export var path = "res://src/menus/StoryMenu.tscn"
onready var anim = $Labels/StartLabel/AnimationPlayer
onready var audio_clicked = $Audio/Clicked

func _ready():
	anim.play("idle_flash")
	
func _unhandled_input(event):
	if event.is_action_pressed("shoot") and anim.playback_speed != 10:
		audio_clicked.play()
		anim.playback_speed = 10
		yield(get_tree().create_timer(0.6), "timeout")
		get_tree().change_scene(path)

