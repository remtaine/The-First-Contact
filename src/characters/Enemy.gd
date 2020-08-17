class_name Enemy
extends Character

var hp : int = 1
export var val = 1
var row = null
var row_pos = null
var minimum_combo = 3
onready var hp_label = $HealthLabel
onready var combo_label_resource = preload("res://src/addons/ComboLabel.tscn")

func _ready():
	sound_hurt = preload("res://sounds/sfx/enemy_hit.wav")
	sound_die = preload("res://sounds/sfx/enemy_dead.wav")
	
func setup(pos, lives, r, rp):
	row = r
	if row != null:
		row.append(self)
	row_pos = rp
	
	if pos != Vector2.INF:
		global_position = pos
	
	var i
	if lives == 0:
		randomize()
		i = randi()% 6 + 1
	else:
		i = lives
		
	hp = i
	match_to_hp()


func match_to_hp():
	match hp:
		1: #ie green
			color = Color("00e436")
		2: #ie blue
			color = Color("29adff")
		3: #ie yellow
			color = Color("ffec27")
		4: #ie red
			color = Color("ff004d")
		5: #ie pink
			color = Color("ff77a8")
		6: #ie white
			color = Color("c2c3c7")
		7: #ie gold
			color = Color("ffa300")
		8: #ie dark green
			color = Color("008751")
	$Sprite.play(String(hp))
	$HealthLabel.text = String(hp)
	$HealthLabel.add_color_override("font_color", color)
		
func damage(dmg = 1, check_rows = true, combo = 0):
	#TODO check if damage at least 3 in a row
	if check_rows:
		var damaged = row.check_if_match(row_pos)
		if damaged != null and damaged.size() >= minimum_combo: 
			for enemy in damaged:
				if enemy != self:
					enemy.damage(1000, false)
				else:
					enemy.damage(1000, false, damaged.size())
					
	#first check left
	#first check right
	#if in_a_row.length > 	3
	hp -= dmg
	if hp > 0:
		#TODO flash anim for hurt
		match_to_hp()
		play_sound("hurt")
		anim_hurt.play("hurt")
	else:
		if combo > 0:
			var d = combo_label_resource.instance()
			d.setup(global_position,combo)
			object_holder.add_child(d)
		get_tree().call_group("levels", "update_score", 1 + (combo/2))
		.damage(dmg)
#	play_sound("die")
#	health.update(1)
