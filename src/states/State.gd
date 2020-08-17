class_name State
extends Node2D

#export var is_bot = false
export var state_name = "State"
onready var host = get_parent().get_parent()
export var type = "bot"

var inputs = {
	is_moving = false,
	input_direction = Vector2.ZERO,
	is_shooting = false,
	is_bombing = false
}

func get_raw_input() -> Dictionary:
	match type:
		"bot":
			inputs = {
				is_moving = true,
				input_direction = Vector2.DOWN,
				is_shooting = false,
				is_bombing = false
			}	
		"structure":
			inputs = {
				is_moving = false,
				input_direction = Vector2.ZERO,
				is_shooting = false,
				is_bombing = false
			}
		_:
			inputs = {
				is_moving = Input.is_action_pressed("move_down") or Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right") or Input.is_action_pressed("move_up"),
				input_direction = get_input_direction(),
				is_shooting = Input.is_action_pressed("shoot"),
				is_bombing = Input.is_action_just_pressed("bomb")
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
