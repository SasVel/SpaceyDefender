extends Enemy

@onready var EnemyScene = preload("res://Enemies/EnemyShip/EnemyShip.tscn")
var lastSpawnPosition = Vector2.ZERO
@export var enemiesToSpawn = 3
@onready var spawnArea = $SpawnArea
@onready var spawnTimer = $SpawnTimer
@onready var spawnRange = spawnArea.get_child(0).shape.size
@onready var stats = $Stats

@onready var HealthPickup = preload("res://Pickup/HealthUp/HealthUp.tscn")

func attack_state():
	if spawnTimer.is_stopped():
		spawnTimer.start()
	super()

func chase_state():
	if !spawnTimer.is_stopped():
		spawnTimer.stop()
	super()

func _on_spawn_timer_timeout():
	for i in enemiesToSpawn:
		var randAbsPosRange = get_random_absolute_pos()
		while randAbsPosRange == lastSpawnPosition:
			randAbsPosRange = get_random_absolute_pos()
		enemy_spawn(randAbsPosRange)
	
	
func enemy_spawn(enemyPos):
	var enemy = EnemyScene.instantiate()
	enemy.position = enemyPos
	get_tree().get_root().get_child(2).add_child(enemy)
	lastSpawnPosition = enemy.position
	
func get_random_absolute_pos():
	var randRelativePosRange = Vector2(randi_range(0, spawnRange.x), randi_range(0, spawnRange.y))
	
	if randRelativePosRange.x < spawnRange.x / 2:
		randRelativePosRange.x *= -1
	if randRelativePosRange.y < spawnRange.y / 2:
		randRelativePosRange.y *= -1
	var randAbsPosRange = self.position + randRelativePosRange
	return randAbsPosRange
	
func _on_hurt_box_area_entered(area):
	super(area)
	stats.health -= area.damage

func _on_stats_no_health():
	GlobalInfo.enemiesKilled += 1
	GlobalInfo.score += scoreOnKill
	
	if randi_range(0, 100) <= 60:
		spawn_health_pickup()
	death_effect()
	queue_free()

func spawn_health_pickup():
	var healthPickup = HealthPickup.instantiate()
	healthPickup.global_position = self.global_position
	get_tree().get_root().add_child(healthPickup)
