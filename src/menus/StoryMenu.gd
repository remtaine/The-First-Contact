class_name StoryMenu
extends Node2D

onready var story = $StoryLabel
onready var cont = $ContinueLabel
onready var cont_anim = $ContinueLabel/FlashAnimation
onready var tween = $Tween
onready var audio_type = $Audio/Type
#onready var timer_type = $Timers/Type
var total_text = ""
var letters = 0

export var path = "res://src/levels/Level1.tscn"
export var duration = 9.0

func _ready():
	total_text = story.text
#	timer_type.start()
	tween.interpolate_property(self,"letters", letters, total_text.length(),duration, Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.start()
	
func _process(delta):
	story.text = total_text.left(letters)
	if letters == total_text.length() and not cont_anim.is_playing():
		fully_on()
	elif story.text.ends_with(".") and not cont_anim.is_playing():# or story.text.ends_with("!"):
		tween.stop_all()		
		audio_type.stream_paused = true
		yield(get_tree().create_timer(0.5), "timeout")
		tween.resume_all()
		audio_type.stream_paused = false

func fully_on():
	story.text = total_text
	cont_anim.play("idle")	
	set_process(false)
	audio_type.stop()

func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		if cont_anim.is_playing():
			cont_anim.playback_speed = 10
			yield(get_tree().create_timer(0.8), "timeout")
			get_tree().change_scene(path)
		else:
			fully_on()
