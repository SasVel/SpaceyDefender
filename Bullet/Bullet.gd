extends CharacterBody2D

@export var SPEED = 420

@onready var playerPos = PlayerInfo.playerPosition
@onready var playerRot = PlayerInfo.playerRotation
@onready var playerVel = PlayerInfo.playerVelocity

func _ready():
	rotation = playerRot
	position = playerPos

func _physics_process(delta):
	var input_vector = Vector2(cos(rotation + deg_to_rad(-90)), sin(rotation + deg_to_rad(-90)))
	
	velocity = input_vector * SPEED + playerVel
	
	out_of_bounds()
	move_and_slide()
		
func out_of_bounds():
	if position.y < playerPos.y - 400 || position.y > playerPos.y + 400 || position.x < playerPos.x - 700 || position.x > playerPos.x + 700:
		queue_free()
