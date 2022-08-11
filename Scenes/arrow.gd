extends Area2D

var speed = 10
var motion = Vector2()

func _ready():
	global_position = get_parent().global_position
	

func start(dir):
	if dir == "up" || dir == "down":
		$Sprite.rotation_degrees = 0
		if dir == "up":
			motion.y = -speed
		else:
			motion.y = speed
	if dir == "right" || dir == "left":
		$Sprite.rotation_degrees = 90
		if dir == "up":
			motion.x = -speed
		else:
			motion.x = speed

func _physics_process(delta):
	translate(motion)


func _on_Area2D_area_entered(area):
	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("Wall"):
		queue_free() 
