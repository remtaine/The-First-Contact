class_name Hitbox
extends Area2D

export var target_group = "enemies"
onready var host = get_parent().get_parent()

func _ready():
	pass	

func setup(tg):
	target_group = tg
	
func _on_Hitbox_body_entered(body):
	if body.is_in_group(target_group):
#		body.damage(1)
		get_tree().call_group("levels", "screenshake")
		get_tree().call_group("levels", "update_score", 100)
		body.damage()
		host.queue_free()
