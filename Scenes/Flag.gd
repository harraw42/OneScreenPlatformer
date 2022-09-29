extends Area2D

func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		get_tree().change_scene("res://Scenes/FinalScreen.tscn")
		SoundEffects.change_track("title_screen")
