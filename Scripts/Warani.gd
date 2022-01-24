extends KinematicBody2D

var attacking = true
var start = -80
var end = 50
var speed = 1
var velocity = Vector2()

func _process(delta):
	velocity = Vector2()
	if attacking:
		move_and_collide(Vector2(-speed,0))
		print(position.x, "More")
		if position.x <= start:
			attacking = false
	else:
		move_and_collide(Vector2(speed,0))
		print(position.x, "no more")
		if position.x >= end:
			attacking = true
	velocity = velocity.normalized() * speed
