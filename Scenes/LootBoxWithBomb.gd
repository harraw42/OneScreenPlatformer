extends Area2D


func _ready():
	$BombInChest.hide()

func _on_LootBoxWithBomb_area_entered(area):
	if area.is_in_group("Destruction"):
		$AnimationPlayer.play("Opening")
		$BombInChest.show()
