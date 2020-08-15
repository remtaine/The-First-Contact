class_name Spaceship
extends Character

var is_flipped : bool = false
onready var tween = $Tween
onready var shot_cd = $Timers/ShotCooldown
onready var bullet_point = $BulletPoint
onready var shot_line = $Addons/ShotLine
#onready var sound_hurt = preload("")

onready var particles = $Particles

onready var bullet_resource := preload("res://src/objects/Bullet.tscn")

func _ready():
	set_physics_process(false)
	#TODO do tween stuff
	var d = 0.5
	tween.interpolate_property(self, "scale", Vector2.ZERO, Vector2.ONE, d, Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.interpolate_property(self, "rotation_degrees", 360, 0,d, Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.start()
	
#for state-independent movement
func _physics_process(delta):
	._physics_process(delta)
	if _state.inputs.is_shooting and shot_cd.is_stopped():
		shoot()

func change_direction(dir = "idle"):
	if dir == "idle":
#		play_sound("move")
		pass
	sprite.play(dir)

func _on_ShotCooldown_timeout():
	shot_line.default_color = Color("fff1e8")
#	spawn_bullet()
#	play_sound("shoot")
#	shot_cd.start()

func shoot():
	spawn_bullet()
	play_sound("shoot")
	shot_line.default_color = Color("ff004d")
	shot_cd.start()
	
func spawn_bullet():
	var b = bullet_resource.instance()
	b.setup(Vector2.UP, shot_line.global_position)
	object_holder.add_child(b)

func damage(dmg = 1):
	.damage(dmg)
	show_other_parts(false)
#	health.update(1)

func show_other_parts(t = true):
	particles.visible = t
	shot_line.visible = t
	
func _on_Tween_tween_completed(object, key):
	if key == ":scale":
		play_sound("move")
		yield(get_tree().create_timer(0.2), "timeout")
		show_other_parts()
		set_physics_process(true)
#		_on_ShotCooldown_timeout()
