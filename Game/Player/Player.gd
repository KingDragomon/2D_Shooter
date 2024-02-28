extends CharacterBody2D

const bulletPath = preload("res://Player/Bullet.tscn")

var speed = 200

var direction

func _get_direction():
	direction = Input.get_vector("left","right","up","down")
	velocity = direction.normalized() * speed

func _shooting():
	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $Handle/Bullet_Start.global_position
	bullet.velocity = get_global_mouse_position()-bullet.global_position


func _physics_process(_delta):

	#Shooting
	if Input.is_action_just_pressed("shoot"):
		_shooting()

	#Movement
	_get_direction()
	move_and_slide()

