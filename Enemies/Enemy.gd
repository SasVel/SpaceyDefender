extends CharacterBody2D

var d = 0.0

@export var speed = 100
@export var acceleration = 80

@export var rotation_speed : float = 8

@export var distance_for_attack = 200
@export var attack_rotation_speed = 1.0

var isRightAttackRotation = randi_range(0, 2) == 0 if true else false
@onready var enemyPivot = preload("res://Enemies/EnemyPivot/EnemyPivot.tscn").instantiate()

var distanceToPlayer = Vector2.ZERO

enum {
	CHASE,
	ATTACK
}
var state = CHASE

@onready var Bullet = preload("res://Bullet/EnemyBullet/EnemyBullet.tscn")
@onready var shootTimer = $ShootTimer

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
	var directionToPlayer = global_position.direction_to(PlayerInfo.playerPosition)
	velocity = velocity.move_toward(directionToPlayer * acceleration, speed)
	
	if !shootTimer.is_stopped():
		shootTimer.stop()
	if abs(distanceToPlayer).x < distance_for_attack || abs(distanceToPlayer).y < distance_for_attack:
		state = ATTACK


func attack_state():
	velocity = velocity.move_toward(Vector2.ZERO, 10)
	if isRightAttackRotation:
		attack_rotation_speed *= -1
		
	if shootTimer.is_stopped():
		shootTimer.start()
	if abs(distanceToPlayer).x > distance_for_attack || abs(distanceToPlayer).y > distance_for_attack:
		state = CHASE


func _on_hurt_box_area_entered(area):
	queue_free()

func _on_shoot_timer_timeout():
	shoot()
	
func shoot():
	var bullet = Bullet.instantiate()
	bullet.entity = self
	get_tree().get_root().get_child(1).add_child(bullet)
