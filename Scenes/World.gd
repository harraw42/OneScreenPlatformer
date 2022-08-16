extends Node2D

func _ready():
	pass 

func _process(delta):
	if Input.is_action_pressed("reset"):
		GameStats.reset()
	$CanvasLayer/Control/Label.text = GameStats.get_time()
	$CoinCounter/Control/Label.text = GameStats.coin_number()
