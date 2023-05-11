extends Control

@onready var gameOverLabel = $GameOverLabel
@onready var scoreLabel = $GameOverLabel/Score
@onready var enemiesKilledLabel = $GameOverLabel/EnemiesKilled

func _ready():
	self.visible = false
	PlayerStats.no_health.connect(on_no_health)

func on_no_health():
	get_tree().paused = true
	
	scoreLabel.text = "SCORE " + str(ScoreboardInfo.score)
	enemiesKilledLabel.text = "ENEMIES KILLED " + str(PlayerStats.enemiesKilled)
	
	self.visible = true

func _on_texture_button_pressed():
	get_tree().reload_current_scene()
	ScoreboardInfo.score = 0
	PlayerStats.health = PlayerStats.max_health
	get_tree().paused = false
