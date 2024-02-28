extends CharacterBody2D

const bulletPath = preload("res://Player/Bullet.tscn")

var speed = 200
var direction

var can_Shoot = true

func _get_direction():
	direction = Input.get_vector("left","right","up","down")
	velocity = direction.normalized() * speed

func _shooting():
	can_Shoot = false

	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $Handle/Bullet_Start.global_position
	bullet.velocity = get_global_mouse_position() - bullet.global_position

	$Shoot_Timer.start(3)
	


func _physics_process(_delta):

	#Shooting
	if Input.is_action_just_pressed("shoot") && can_Shoot:
		_shooting()

	#Movement
	_get_direction()
	move_and_slide()



func _on_shoot_timer_timeout():
	can_Shoot = true
