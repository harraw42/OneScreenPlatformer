extends Node2D

var coin_number

func _ready():
	$CanvasLayer/Control/Resume/ResumeButton.hide()
	$CanvasLayer/Control/Quit/QuitButton.hide()

func _process(delta):
	if Input.is_action_pressed("reset"):
		GameStats.reset()
	$CanvasLayer/Control/Label.text = GameStats.get_time()
	#$CoinCounter/Control/Label.text = coin_number
	$CoinCounter/Control/Label.text = str(GameStats.coin_number)

func _on_OptionsButton_pressed():
	$CanvasLayer/Control/Resume/ResumeButton.show()
	$CanvasLayer/Control/Quit/QuitButton.show()
	get_tree().paused = true


func _on_ResumeButton_pressed():
	$CanvasLayer/Control/Resume/ResumeButton.hide()
	$CanvasLayer/Control/Quit/QuitButton.hide()
	get_tree().paused = false


func _on_QuitButton_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
	get_tree().paused = false
	SoundEffects.change_track("title_screen")
