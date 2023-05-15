extends Control

@onready var label = $Label
@onready var showTimer = $ShowTimer

func _ready():
	var wavesController = get_tree().get_first_node_in_group("WaveController") as WavesController
	wavesController.on_no_enemies.connect(on_no_enemies)
	label.visible = false

func _on_show_timer_timeout():
	label.visible = false

func on_no_enemies():
	label.visible = false
	showTimer.start()
