extends CharacterBody2D

var speed = 300

func _physics_process(_delta):
	velocity = velocity.normalized() * speed
	move_and_slide()