extends Node2D


func _ready():
	$AnimationPlayer.play("Fizzing")


func _on_Radius_area_entered(area):
	if area.is_in_group("Player"):
		print("pre")
		$AnimationPlayer.play("PreExplosion")
		yield($AnimationPlayer,"animation_finished")
		print("explo")
		$AnimationPlayer.play("Explosion")
		yield($AnimationPlayer,"animation_finished")
		print("done")
		queue_free()
