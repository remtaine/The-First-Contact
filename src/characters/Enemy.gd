class_name Enemy
extends Character

var hp : int = 1
export var val = 1

func _ready():
	sound_hurt = preload("res://sounds/sfx/enemy_hit.wav")
	sound_die = preload("res://sounds/sfx/enemy_dead.wav")
	setup()
	
func setup(pos = Vector2.INF, lives = 0):
	if pos != Vector2.INF:
		global_position = pos

	var i
	if lives == 0:
		randomize()
		i = randi()% 8 + 1
		sprite.play(String(i))
	else:
		i = lives
		sprite.play(String(i))
		
	hp = i

	match i:
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
