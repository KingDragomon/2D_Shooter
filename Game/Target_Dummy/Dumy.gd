extends StaticBody2D

var health: int = 5:
	set(value):
		health = value
		if(health<=0):
			queue_free()

func _take_Damage(x):
	health -= x