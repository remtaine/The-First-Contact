class_name Warning
extends Sprite


func _ready():
	pass

func animate():
	$MoveAnim.play("appear")
	$FlashAnim.play("appear")
