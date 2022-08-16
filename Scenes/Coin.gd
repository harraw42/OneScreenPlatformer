extends Node2D

export (int) var coin_number

func _on_CoinArea_area_entered(area):
	if area.is_in_group("Player"):
		coin_number = 1
		queue_free()
		$CoinCounter/Control/Label.text = GameStats.coin_counter()
