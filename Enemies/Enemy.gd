extends CharacterBody2D

var d = 0.0

@export var speed = 100
@export var acceleration = 80

@export var rotation_speed : float = 8

@export var distance_for_attack = 150
@export var attack_rotation_speed = 1.0

var isRightAttackRotation = randi_range(0, 2) == 0 if true else false

var distanceToPlayer = Vector2.ZERO

enum {
	CHASE,
	ATTACK
}
var state = CHASE

func _physics_process(delta):
	distanceToPlayer = global_position - PlayerInfo.playerPosition
	d += delta
	
	enemy_rotation()
	match state:
		CHASE:
			chase_state()
		ATTACK:
			attack_state()
	
	move_and_slide()

func enemy_rotation():
	var angle = self.get_angle_to(PlayerInfo.playerPosition)
	global_rotation = lerp_angle(rotation, rotation + angle + deg_to_rad(90), rotation_speed / 100)
	
func chase_state():
	if abs(distanceToPlayer) <= Vector2(distance_for_attack, distance_for_attack):
		state = ATTACK
		
	var directionToPlayer = global_position.direction_to(PlayerInfo.playerPosition)
	velocity = velocity.move_toward(directionToPlayer * acceleration, speed)


func attack_state():
	velocity = velocity.move_toward(Vector2.ZERO, 10)
	if isRightAttackRotation:
		attack_rotation_speed *= -1
		
	position = Vector2(
		sin(d * attack_rotation_speed) * distance_for_attack,
		cos(d * attack_rotation_speed) * distance_for_attack
	) + PlayerInfo.playerPosition
	
	if abs(distanceToPlayer) >= Vector2(distance_for_attack, distance_for_attack):
		state = CHASE
	pass
