extends KinematicBody2D

export (int) var speed = 120
export (int) var jump_speed = -180
export (int) var gravity = 400
export (int) var slide_speed = 400
export (int) var sword_pos = 12
var velocity = Vector2.ZERO

export (float) var friction = 10
export (float) var acceleration = 25

enum state {IDLE, JUMPING, STARTJUMP, FALLING, ATTACKING, RUNNING, ROLLING, PUSHING}
# player default animation
onready var player_state = state.IDLE
onready var state_machine = $AnimationTree.get("parameters/playback")

func _ready():
	state_machine.travel("Idle Animation")
	$Slash.hide()

 #changing anim
func update_animation(anim):
	if velocity.x < 0:
		$Sprite.flip_h = true
		$Slash.flip_h = true
		$Slash.position.x = -sword_pos
	elif velocity.x > 0:
		$Sprite.flip_h = false
		$Slash.flip_h = false
		$Slash.position.x = sword_pos
	match(anim):
		state.RUNNING:
			state_machine.travel("Running")
		state.JUMPING:
			state_machine.travel("Jumping")
		state.FALLING:
			state_machine.travel("Fall")
		state.ATTACKING:
			state_machine.travel("Attacking")
		state.IDLE:
			state_machine.travel("Idle Animation")
			
		state.PUSHING:
			state_machine.travel("Pushing")
		state.ROLLING:
			state_machine.travel("Roll")
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
	
	if Input.is_action_pressed("attack"):
		player_state = state.ATTACKING
		$Slash.show()
		$Slash/SlashAnimation.play("Slash")
	
	if Input.is_action_just_pressed("roll"):
		player_state = state.ROLLING
	
	handle_state(player_state)
	update_animation(player_state)
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	

func _on_DeathZone_area_entered(area):
	if area.is_in_group("Deadly"):
		if GameStats.check_reset() == false:
			global_position = GameStats.get_spawn().global_position



func _on_SlashAnimation_animation_finished(anim_name):
	$Slash.hide()
