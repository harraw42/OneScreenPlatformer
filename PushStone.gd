extends KinematicBody2D

export (int) var speed = 20
export (int) var gravity = 450

var velocity = Vector2.ZERO

export (float) var friction = 100
export (float) var acceleration = 5

func _ready():
	pass
	
func _physics_process(delta):
	velocity = velocity.move_toward(Vector2.ZERO,0.1)
	move_and_slide(velocity * speed * delta,Vector2.UP)
