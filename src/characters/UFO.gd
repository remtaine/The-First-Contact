class_name UFO
extends Character

onready var hp_bar = $Stats/Healthbar
var hp = 0
# Called when the node enters the scene tree for the first time.

func _ready():
	hp = hp_bar.max_value
	update_hp_bar()

func damage(dmg = 1):
	hp -= dmg
	update_hp_bar()
	if hp > 0:
		play_sound("hurt")
	else:
		.damage(dmg)
		
func update_hp_bar():
	hp_bar.value = hp
