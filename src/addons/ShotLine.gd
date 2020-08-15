extends Line2D

onready var raycast = $RayCast2D

func _ready():
	pass
#	points.append(global_position)
#
#	if raycast.is_colliding():
#		points.append(raycast.get_collision_point())
#	else:
#		points.append(raycast.cast_to)

func _process(delta):
	draw()

func draw():
	if raycast.is_colliding():
		points[1].y = to_local(raycast.get_collision_point()).y
	else:
		points[1] = (raycast.cast_to)
	set_broken_line_points()

func set_broken_line_points(dash_length = 5):
	pass
#	var p : PoolVector2Array
#	p.append(global_position)
	
