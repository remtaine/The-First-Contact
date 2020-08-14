class_name State
extends Node2D

#export var is_bot = false
export var state_name = "State"
onready var host = get_parent().get_parent()
export var type = "bot"
func get_raw_input() -> Dictionary:
	var inputs
	match type:
		"bot":
			inputs = {
				is_moving = true,
				input_direction = Vector2.DOWN
			}	
		"structure":
			inputs = {
				is_moving = false,
				input_direction = Vector2.ZERO
			}
		_:
			inputs = {
				is_moving = Input.is_action_pressed("move_down") or Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right") or Input.is_action_pressed("move_up"),
				input_direction = get_input_direction()
			}
	return inputs
	
func interpret_inputs(input):
	return "idle"

func enter():
	pass

func exit():
	pass

func get_input_direction() -> Vector2:
	return Vector2(float(Input.is_action_pressed("move_right")) - float(Input.is_action_pressed("move_left")), float(Input.is_action_pressed("move_down")) - float(Input.is_action_pressed("move_up"))).normalized()

func run(input):
	pass
