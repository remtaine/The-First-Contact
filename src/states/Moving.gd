class_name Moving
extends State

export var speed : int = 32
var last_direction : Vector2 = Vector2.ZERO
var direction : Vector2 = Vector2.ZERO
var velocity : Vector2 = Vector2.ZERO

onready var tween = $Tween

func _ready():
	state_name = "moving"
func enter():
	pass

func run(input):
	direction = input.input_direction.normalized()
	velocity = direction * speed
#	host.move_and_slide(velocity)
	if velocity.x < 0:
		host.is_flipped = false
		host.change_direction("left")
	elif velocity.x > 0:
		host.is_flipped = false
		host.change_direction("right")
	else:
		host.change_direction()
		
	#TODO add lockin
#	elif velocity.y < 0:
#		host.change_direction("up")
#	else:
#		host.change_direction("down")
			
#	tween.interpolate_property(host,"position", host.position, host.position + velocity, 0.2, Tween.TRANS_LINEAR,Tween.EASE_IN)
#	tween.start()
#	host.position += velocity
	host.move_and_slide(velocity)
	
func interpret_inputs(input):
	if input.is_moving:
		return state_name
	else:
		return "idle"
