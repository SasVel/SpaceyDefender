extends CharacterBody2D

@export var SPEED = 100
func _ready():
	rotation = PlayerInfo.playerRotation
	position = PlayerInfo.playerPosition + Vector2(20, 20)

func _physics_process(delta):
	var input_vector = Vector2(0, 1)
	
	velocity = input_vector * SPEED
	
	out_of_bounds()
	move_and_slide()
		
func out_of_bounds():
	if position.y < 0 || position.y > 400 || position.x < 0 || position.x > 700:
		queue_free()
