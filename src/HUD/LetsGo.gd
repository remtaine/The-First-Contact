class_name LetsGo
extends Warning

func _ready():
	pass

func _on_MoveAnim_animation_finished(anim_name):
			get_tree().call_group("levels", "start_spawn")
