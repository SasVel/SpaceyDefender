extends Enemy

@onready var Bullet = preload("res://Bullet/EnemyBullet/EnemyBullet.tscn")
@onready var shootTimer = $ShootTimer
@onready var shootSound = $ShootSoundPlayer/AudioStreamPlayer2D
@onready var stats = $Stats
	
func chase_state():
	if !shootTimer.is_stopped():
		shootTimer.stop()
	super()

func attack_state():
	if isRightAttackRotation:
		attack_rotation_speed *= -1
		
	if shootTimer.is_stopped():
		shootTimer.start()
	super()

func _on_hurt_box_area_entered(area):
	super(area)
	stats.health -= area.damage

func _on_shoot_timer_timeout():
	shoot()
	
func shoot():
	shootSound.play()
	var bullet = Bullet.instantiate()
	bullet.entity = self
	get_tree().get_root().get_child(1).add_child(bullet)

func _on_stats_no_health():
	GlobalInfo.enemiesKilled += 1
	GlobalInfo.score += scoreOnKill
	death_effect()
	queue_free()
