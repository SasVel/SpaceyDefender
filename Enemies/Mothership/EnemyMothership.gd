extends Enemy

@onready var enemy = preload("res://Enemies/EnemyShip/EnemyShip.tscn")
var lastSpawnPosition = Vector2.ZERO
@export var enemiesToSpawn = 3
@onready var spawnArea = $SpawnArea
@onready var spawnTimer = $SpawnTimer
@onready var spawnRange = spawnArea.get_child(0).shape.size


func attack_state():
	if spawnTimer.is_stopped():
		spawnTimer.start()
	super()

func chase_state():
	if !spawnTimer.is_stopped():
		spawnTimer.stop()
	super()

func _on_spawn_timer_timeout():
	var randRelativePosRange = Vector2(randi_range(0, spawnRange.x), randi_range(0, spawnRange.y))
	var randGlPosRange = self.position
#	if randRelativePosRange.x > spawnRange.x / 2:
		
