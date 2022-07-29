extends KinematicBody2D

export (int) var speed = 120
export (int) var jump_speed = -180
export (int) var gravity = 400
export (int) var slide_speed = 400

var velocity = Vector2.ZERO

export (float) var friction = 10
export (float) var acceleration = 25

enum state {IDLE, JUMPING, STARTJUMP, FALLING, ATTACKING, RUNNING, ROLLING, PUSHING}
# player default animation
onready var player_state = state.IDLE

func _ready():
	$AnimationPlayer.play("Idle Animation")

 #changing anim
func update_animation(anim):
	if velocity.x < 0:
		$Sprite.flip_h = true
	elif velocity.x > 0:
		$Sprite.flip_h = false
	match(anim):
		state.RUNNING:
			$AnimationPlayer.play("Running")
		state.JUMPING:
			$AnimationPlayer.play("Jumping")
		state.FALLING:
			$AnimationPlayer.play("Fall")
		state.ATTACKING:
			$AnimationPlayer.play("Attacking")
		state.IDLE:
			$AnimationPlayer.play("Idle Animation")
		state.PUSHING:
			$AnimationPlayer.play("Pushing")
		state.ROLLING:
			$AnimationPlayer.play("Roll")
	pass
	
func handle_state(player_state):
	match(player_state):
		state.STARTJUMP:
			velocity.y = jump_speed
	pass
	
func get_input():
	var dir = Input.get_action_strength('right') - Input.get_action_strength('left')
	if dir != 0:
		velocity.x = move_toward(velocity.x, dir*speed, acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, friction)

func _physics_process(delta):
	get_input()
	print(is_on_floor())
	if velocity == Vector2.ZERO:
		player_state = state.IDLE
	if Input.get_action_strength('jump') and is_on_floor():
		player_state = state.STARTJUMP
	elif velocity.x != 0:
		player_state = state.RUNNING
	
	if is_on_floor() == false:
		if velocity.y < 0:
			player_state = state.JUMPING
		if velocity.y > 0:
			player_state = state.FALLING
	
	handle_state(player_state)
	update_animation(player_state)
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	#for index in get_slide_count():
		#var collision = get_slide_collision(index)
		#if collision.collider is MoveableStone:
			#collision.collider.slide(-collision.normal * (speed / 2))
