extends CharacterBody2D
class_name	Enemy

var d = 0.0

@export var speed = 100
@export var acceleration = 80
@export var rotation_speed : float = 8
@export var distance_for_attack = 200
@export var attack_rotation_speed = 1.0
@export var scoreOnKill = 100
var isRightAttackRotation = randi_range(0, 2) == 0 if true else false
var distanceToPlayer = Vector2.ZERO

enum {
	CHASE,
	ATTACK
}
var state = CHASE

func _ready():
	self.add_to_group("Enemies")

func _physics_process(delta):
	distanceToPlayer = global_position - GlobalInfo.playerPosition
	d += delta
	
	enemy_rotation()
	match state:
		CHASE:
			chase_state()
		ATTACK:
			attack_state()
	move_and_slide()
	
func enemy_rotation():
	var angle = self.get_angle_to(GlobalInfo.playerPosition)
	global_rotation = lerp_angle(rotation, rotation + angle + deg_to_rad(90), rotation_speed / 100)
	
func chase_state():
	var directionToPlayer = global_position.direction_to(GlobalInfo.playerPosition)
	velocity = velocity.move_toward(directionToPlayer * acceleration, speed)
	
	if abs(distanceToPlayer).x < distance_for_attack || abs(distanceToPlayer).y < distance_for_attack:
		state = ATTACK
		
func attack_state():
	velocity = velocity.move_toward(Vector2.ZERO, 10)
		
	if abs(distanceToPlayer).x > distance_for_attack || abs(distanceToPlayer).y > distance_for_attack:
		state = CHASE
