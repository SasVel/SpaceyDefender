extends Control

@onready var gameOverLabel = $GameOverLabel
@onready var scoreLabel = $GameOverLabel/Score
@onready var enemiesKilledLabel = $GameOverLabel/EnemiesKilled

func _ready():
	self.visible = false
	PlayerStats.no_health.connect(on_no_health)

func on_no_health():
	get_tree().paused = true
	
	scoreLabel.text = "SCORE " + str(GlobalInfo.score)
	enemiesKilledLabel.text = "ENEMIES KILLED " + str(GlobalInfo.enemiesKilled)
	
	self.visible = true

func _on_restart_btn_pressed():
	GlobalInfo.score = 0
	GlobalInfo.waveCount = 1
	PlayerStats.health = PlayerStats.max_health
	for enemy in get_tree().get_nodes_in_group("Enemies"):
		enemy.queue_free()

	get_tree().reload_current_scene()
	get_tree().paused = false
