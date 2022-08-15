extends Node2D

export (int) var offset  = 0

func _ready():
	$AnimationPlayer.seek(offset)
