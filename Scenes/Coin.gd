extends Node2D

export (int) var coin_number


func _on_CoinArea_area_entered(area):
	if area.is_in_group("Player"):
		GameStats.coin_number+=1
		queue_free()

func _process(delta):
	pass
	if Input.is_action_just_pressed("reset"):
		GameStats.coin_number=0
