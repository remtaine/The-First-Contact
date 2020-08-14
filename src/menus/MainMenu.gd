extends Node2D

export var path = "res://src/levels/Level1.tscn"
onready var anim = $Labels/StartLabel/AnimationPlayer

func _ready():
	anim.play("idle_flash")
	
func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		anim.play("clicked_flash")
		yield(get_tree().create_timer(0.6), "timeout")
		get_tree().change_scene(path)

