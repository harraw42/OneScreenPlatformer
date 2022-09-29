extends Control

func _physics_process(delta):
	$CoinFinalCount/Label.text = str(GameStats.coin_number)
	$FinalTime/Label.text = GameStats.get_time()
	get_tree().paused = true


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")
	SoundEffects.change_track("main")
