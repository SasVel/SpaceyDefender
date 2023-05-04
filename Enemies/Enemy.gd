extends CharacterBody2D

func _physics_process(delta):
	var directionToPlayer = global_position.direction_to(PlayerInfo.playerPosition)
	velocity = velocity.move_toward(directionToPlayer, 10)
	move_and_slide()
