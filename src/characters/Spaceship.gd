class_name Spaceship
extends Character

var is_flipped : bool = false

onready var tween = $Tween
onready var shot_cd = $Timers/ShotCooldown
onready var bullet_point = $BulletPoint
#onready var sound_hurt = preload("")

onready var particles = $Particles
onready var object_holder = get_parent().get_parent().get_node("Objects")
onready var bullet_resource := preload("res://src/objects/Bullet.tscn")

func _ready():
	set_physics_process(false)
	#TODO do tween stuff
	tween.interpolate_property(self, "scale", Vector2.ZERO, Vector2.ONE,0.5, Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.start()
	
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


func _on_Tween_tween_completed(object, key):
	print(key)
	if key == ":scale":
		play_sound("move")
		yield(get_tree().create_timer(0.5), "timeout")
		particles.visible = true
		set_physics_process(true)
		_on_ShotCooldown_timeout()
