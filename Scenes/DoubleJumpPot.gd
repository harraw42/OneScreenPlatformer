extends Area2D

func _ready():
	pass

func _on_DoubleJumpPot_body_entered(body):
	if "Player" in body.name:
		queue_free()
