extends Area2D

func _ready():
	$AnimationPlayer.play("Savepoint")

func _process(delta):
	if GameStats.get_spawn() != self:
		$AnimationPlayer.play("Savepoint")
