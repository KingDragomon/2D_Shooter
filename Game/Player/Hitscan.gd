extends RayCast2D

var cast_point

func _physics_process(_delta):

	cast_point = target_position
	force_raycast_update()

	if is_colliding():
		cast_point = to_local(get_collision_point())

	$Line2D.points[1] = cast_point

	