class_name Enemy
extends Character

var hp : int = 1
export var val = 1
var row = null
var row_pos = null
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
		
func damage(dmg = 1, check_rows = true):
	#TODO check if damage at least 3 in a row
	if check_rows:
		var damaged = row.check_if_match(row_pos)
		if damaged != null and damaged.size() >= 2:
			for enemy in damaged:
				enemy.damage(1000, false)
	#first check left
	#first check right
	#if in_a_row.length > 	3
	hp -= dmg
	if hp > 0:
		#TODO flash anim for hurt
		match_to_hp()
		play_sound("hurt")
	else:
		.damage(dmg)
#	play_sound("die")
#	health.update(1)
