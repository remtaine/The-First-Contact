class_name Spaceship
extends Character

var is_flipped : bool = false

onready var tween = $Tween
onready var sprite = $Sprite
onready var shot_cd = $Timers/ShotCooldown
onready var bullet_point = $BulletPoint

#onready var sound_hurt = preload("")
onready var audio_hurt = $Audio/Hurt
onready var sound_hurt = preload("res://sounds/sfx/player_hit.wav")
onready var sound_die = preload("res://sounds/sfx/player_dead.wav")

onready var audio_shoot = $Audio/Shoot
onready var sound_shoot = preload("res://sounds/sfx/laser_shoot.wav")

onready var audio_move = $Audio/Move
onready var sound_move = preload("res://sounds/sfx/move.wav")

onready var object_holder = get_parent().get_parent().get_node("Objects")
onready var bullet_resource := preload("res://src/objects/Bullet.tscn")

func _ready():
	spawn_bullet()

func change_direction(dir = "idle"):
	if dir == "idle":
#		play_sound("move")
		pass
	sprite.play(dir)

func _on_ShotCooldown_timeout():
	spawn_bullet()
	play_sound("shoot")
	shot_cd.start()
	
func spawn_bullet():
	var b = bullet_resource.instance()
	b.setup(Vector2.UP, bullet_point.global_position)
	object_holder.add_child(b)

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
