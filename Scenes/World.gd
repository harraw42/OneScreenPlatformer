extends Node2D


var coin_number

func _ready():
	pass 

func _process(delta):
	if Input.is_action_pressed("reset"):
		GameStats.reset()
	$CanvasLayer/Control/Label.text = GameStats.get_time()
	#$CoinCounter/Control/Label.text = coin_number
	$CoinCounter/Control/Label.text = str(GameStats.coin_number)
