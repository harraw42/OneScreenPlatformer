extends Node2D


func _ready():
	$DoorAnimationPlayer.play("DoorClosed")


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		$DoorAnimationPlayer.play("DoorOpen")
		

