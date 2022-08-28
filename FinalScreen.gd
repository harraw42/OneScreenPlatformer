extends Control

func _physics_process(delta):
	$CoinFinalCount/Label.text = str(GameStats.coin_number)
	$FinalTime/Label.text = GameStats.get_time()
	get_tree().paused = true
