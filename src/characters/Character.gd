class_name Character
extends KinematicBody2D

var _state = null
var possible_states : Dictionary = {}

onready var object_holder = get_parent().get_parent().get_node("Objects")
onready var states_holder = $States
onready var health = $Stats/Health
onready var sprite = $Sprite

onready var audio_hurt = $Audio/Hurt
onready var sound_hurt = preload("res://sounds/sfx/player_hit.wav")
onready var sound_die = preload("res://sounds/sfx/player_dead.wav")

onready var audio_shoot = $Audio/Shoot
onready var sound_shoot = preload("res://sounds/sfx/laser_shoot.wav")

onready var audio_move = $Audio/Move
onready var sound_move = preload("res://sounds/sfx/move.wav")

onready var death_particle_resource = preload("res://src/particles/Death.tscn")
export var color = Color.white

func _ready():
	if states_holder != null:
		for child in states_holder.get_children():
			possible_states[child.state_name] = child
			if _state == null:
				_state = child

func _physics_process(delta):
	var input = _state.get_raw_input()
	change_state(_state.interpret_inputs(input))
	_state.run(input)

func change_state(state_name, repeat = false):
	var new_state = possible_states[state_name]
	if _state != new_state or repeat:
		exit_state()
		_state = new_state
		enter_state()
	
func enter_state():
	_state.enter()
	
func exit_state():
	_state.exit()

func change_direction(dir = "idle"):
	pass

func damage(dmg = 1):
	var d = death_particle_resource.instance()
	d.setup(global_position, color)
	object_holder.add_child(d)
	queue_free()
#	health.update(1)

func play_sound(sound):
	match sound:
		"hurt":
			audio_hurt.stream = sound_hurt
			audio_hurt.play()
		"die":
			audio_hurt.stream = sound_die
			audio_hurt.play()
		"shoot":
			audio_shoot.stream = sound_shoot
			audio_shoot.play()
		"move":
			audio_move.stream = sound_move
			audio_move.play()
