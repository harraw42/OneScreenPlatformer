extends Area2D


func _ready():
	$CoinInChest.hide()

func _on_LootBoxWithCoin_area_entered(area):
	if area.is_in_group("Destruction"):
		$AnimationPlayer.play("Opening")
		$CoinInChest.show()
