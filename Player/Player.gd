extends CharacterBody2D
class_name Player

@export var BASE_SPEED = 100
@export var MAX_SPEED = 500
@export var ACCELERATION = 40 
@export var DECELERATION = 10
var CURR_SPEED = BASE_SPEED : set = set_curr_speed
var input_vector = Vector2.ZERO
var inputOn : bool = true

enum state {
	IDLE,
	MOVE
}
var currentState = state.IDLE

@onready var Bullet = preload("res://Bullet/PlayerBullet/PlayerBullet.tscn")
var canShoot = true;
@onready var shootTimer = $ShootTimer
@onready var shootSound = $ShootSoundPlayer/AudioStreamPlayer2D 

func _ready():
	PlayerStats.no_health.connect(on_no_health)

func _physics_process(_delta):
	look_at(get_global_mouse_position())
	self.rotation_degrees += 90
	
	if inputOn:
		input_vector = Input.get_vector("ui_left", "ui_right", "accelerate", "none")
	
	match currentState:
		state.IDLE:
			idle_state()
		state.MOVE:
			move_state()
		
	GlobalInfo.playerPosition = self.position
	GlobalInfo.playerRotation = self.rotation
	GlobalInfo.playerVelocity = self.velocity
	
	shoot_action()
	move_and_slide()

func idle_state():
	velocity = velocity.move_toward(Vector2.ZERO, DECELERATION)
	CURR_SPEED -= DECELERATION
	
	if input_vector != Vector2.ZERO && inputOn:
		currentState = state.MOVE
	
func move_state():
	var inputTransformed = transform.basis_xform(input_vector)
	if (input_vector != Vector2.ZERO && input_vector.y < 0):
		CURR_SPEED += ACCELERATION
		velocity = inputTransformed * CURR_SPEED
	else:
		currentState = state.IDLE
func shoot_action():
	if Input.is_action_pressed("shoot") && canShoot:
		var bullet = Bullet.instantiate() as Bullet
		bullet.entity = self
		get_tree().get_root().get_child(1).add_child(bullet)
		canShoot = false
		shootTimer.start()
		shootSound.play()
		

func _on_shoot_timer_timeout():
	canShoot = true

func set_curr_speed(val):
	CURR_SPEED = clamp(val, BASE_SPEED, MAX_SPEED)

func _on_hurt_box_area_entered(area):
	PlayerStats.health -= area.damage

func on_no_health():
	queue_free()
