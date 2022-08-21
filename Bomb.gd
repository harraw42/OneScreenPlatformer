extends Node2D


func _ready():
	pass 


func _on_Radius_area_entered(area):
	if .is_in_group("Player"):
		$AnimationPlayer.play("PreExplosion")
