extends Control


func _ready():
	pass 

func _physics_process(delta):
	$CoinFinalCount/Label.text = GameStats.get_time()
	$FinalTime/Label.text = str(GameStats.coin_number)
