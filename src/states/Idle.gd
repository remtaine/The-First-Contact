class_name Idle
extends State

func _ready():
	pass # Replace with function body.

func interpret_inputs(input):
	if input.is_moving:
		return "moving"
	else:
		return state_name

func enter():
	host.change_direction()
