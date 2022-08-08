extends KinematicBody2D

const bullet = preload("res://Scenes/arrow.tscn")

export(String) var dir = ""

var reload = 1.2
var timer = false

const TYPE = "dart_trap"

func _ready():
	if dir == "right":
		self.rotation_degrees = 0
	if dir == "left":
		self.rotation_degrees = 180
	if dir == "up":
		self.rotation_degrees = 270
	if dir == "down":
		self.rotation_degrees = 90

func _physics_process(delta):
	if timer == false:
		$Timer.start()
		timer = true

func _on_Timer_timeout():
	if timer == true:
		shoot()
		timer = false

func shoot():
	var b = bullet.instance()
	b.start(dir)
	self.add_child(b)
