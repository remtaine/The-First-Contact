class_name UFO
extends Character

onready var hp_bar = $Stats/Healthbar
var hp = 0
onready var condition_path = "res://src/menus/ConditionMenu.tscn"

# Called when the node enters the scene tree for the first time.
signal died(path)

func _ready():
	hp = hp_bar.max_value
	update_hp_bar()
	var level = get_parent().get_parent()
	self.connect("died", level, "go_to")

func damage(dmg = 1):
	hp -= dmg
	if hp < 0:
		hp = 0
	update_hp_bar()
	
	if hp > 0:
		play_sound("hurt")
		anim_hurt.play("hurt")
	else:
		var d = death_particle_resource.instance()
		d.setup(global_position, color)
		object_holder.add_child(d)
		emit_signal("died", condition_path)
		queue_free()
		
func update_hp_bar():
	hp_bar.value = hp
