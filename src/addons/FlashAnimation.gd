extends AnimationPlayer

onready var target = get_parent()

func _ready():
	var a1 = Animation.new()
	var track_index = a1.add_track(Animation.TYPE_VALUE)
	a1.track_set_path(track_index, target.name + ":modulate.a")
	a1.track_insert_key(track_index, 0.0, 255)
	a1.track_insert_key(track_index, 1.0, 0)
	a1.track_insert_key(track_index, 2.0, 255)
	a1.track_insert_key(track_index, 3.0, 0)
	a1.track_insert_key(track_index, 4.0, 255)
	a1.loop = true
	
	add_animation("iadle", a1)
