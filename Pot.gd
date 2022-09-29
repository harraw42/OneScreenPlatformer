extends Area2D





func _ready():
	pass # Replace with function body.




func _on_Pot_area_entered(area):
	if area.is_in_group("Destruction"):
		queue_free()
		GameStats.coin_number +=1
