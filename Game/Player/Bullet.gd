extends CharacterBody2D

var speed = 250

func _ready():
	$Life.start(1)

func _physics_process(_delta):
	velocity = velocity.normalized() * speed
	move_and_slide()


func _on_bullet_collision_body_entered(body:Node2D):
	if(body.has_method("_take_Damage")):
		body._take_Damage(1)
	queue_free()
	

func _on_life_timeout():
	queue_free()