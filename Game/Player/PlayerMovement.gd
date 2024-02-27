extends CharacterBody2D

var speed = 200

var direction

func get_direction():
	direction = Input.get_vector("left","right","up","down")
	velocity = direction.normalized() * speed


func _physics_process(_delta):
	get_direction()
	move_and_slide()