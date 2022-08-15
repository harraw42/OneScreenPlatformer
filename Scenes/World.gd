extends Node2D

func _ready():
	pass 

func _process(delta):
	$CanvasLayer/Control/Label.text = GameStats.get_time()
