extends CharacterBody2D

@export var BASE_SPEED = 100
@export var MAX_SPEED = 500
@export var ACCELERATION = 40 
@export var DECELERATION = 10
var CURR_SPEED = BASE_SPEED : set = set_curr_speed
var input_vector : Vector2

func _physics_process(_delta):
	set_process_input(false)
	look_at(get_global_mouse_position())
	self.rotation_degrees += 90
	
	input_vector = Input.get_vector("ui_left", "ui_right", "accelerate", "none")
	var inputTransformed = transform.basis_xform(input_vector)
	
	if (input_vector != Vector2.ZERO && input_vector.y < 0):
		CURR_SPEED += ACCELERATION
		velocity = inputTransformed * CURR_SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, DECELERATION)
		CURR_SPEED -= DECELERATION
		
		
	PlayerInfo.playerPosition = self.position
	move_and_slide()

func set_curr_speed(val):
	CURR_SPEED = clamp(val, BASE_SPEED, MAX_SPEED)

