extends KinematicBody2D

var speed = 60
var motion = Vector2()

func _ready():
	global_position = get_parent().global_position
	

func start(dir):
	if dir == "up" || dir == "down":
		$Sprite.rotation_degrees = 270
		if dir == "up":
			motion.y = -speed
		else:
			motion.y = speed
	if dir == "left" || dir == "right":
		$Sprite.rotation_degrees = 0
		if dir == "up":
			motion.x = -speed
		else:
			motion.x = speed

func _physics_process(delta):
	motion = move_and_slide(motion)
	if $ray.is_colliding() == true && $ray.get_collider().get("TYPE") != null:
		if $ray.get_collider().get("TYPE") == "Player":
			get_tree().reload_current_scene()
	if $ray.is_colliding() == true && $ray.get_collider().get("TYPE") == null:
		queue_free()

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		if GameStats.check_reset() == false:
			body.global_position = GameStats.get_spawn().global_position
