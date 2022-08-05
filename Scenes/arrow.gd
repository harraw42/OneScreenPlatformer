extends Sprite

var speed = 60
var motion = Vector2()

func _ready():
	global_position = get_parent().global_position
	

func start(dir):
	if dir == "up" || dir == "down":
		self.rotation_degrees = 0
		if dir == "up":
			motion.y = -speed
		else:
			motion.y = speed
	if dir == "left" || dir == "right":
		self.rotation_degrees = 270
		if dir == "up":
			motion.x = -speed
		else:
			motion.x = speed

func _physics_process(delta):
	pass
