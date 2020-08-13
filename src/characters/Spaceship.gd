class_name Spaceship
extends Character

var is_flipped : bool = false

onready var tween = $Tween
onready var shot_cd = $Timers/ShotCooldown
onready var bullet_point = $BulletPoint

#onready var sound_hurt = preload("")

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
