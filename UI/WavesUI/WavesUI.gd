extends Control

@onready var label = $Label
@onready var showTimer = $ShowTimer

func _ready():
	WaveController.on_no_enemies.connect(on_no_enemies)
	label.visible = false

func _on_show_timer_timeout():
	label.visible = false
	WaveController.isActive = true
	WaveController.spawn_enemies()

func on_no_enemies():
	label.visible = true
	label.text = "Wave " + str(GlobalInfo.waveCount)
	WaveController.isActive = false
	showTimer.start()
