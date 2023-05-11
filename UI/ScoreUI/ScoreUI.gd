extends Control

@onready var ScoreDisplay = $ScoreDisplay

func _ready():
	PlayerStats.no_health.connect(on_no_health)

func _process(_delta):
	ScoreDisplay.text = str(GlobalInfo.score)

func on_no_health():
	self.visible = false
