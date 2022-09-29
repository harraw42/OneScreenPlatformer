extends Node2D

export (int) var coin_number


func _on_CoinArea_area_entered(area):
	if area.is_in_group("Player"):
		$CoinAnimations.play("Pickup")
		GameStats.coin_number+=1

func _process(delta):
	pass
	if Input.is_action_just_pressed("reset"):
		GameStats.coin_number=0

func _on_CoinAnimations_animation_finished(anim_name):
	queue_free()
