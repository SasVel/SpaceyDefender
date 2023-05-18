extends Control

@onready var pauseLabel = $PauseLabel
@onready var escLabel = $EscLabel

func _ready():
	self.visible = false

func _process(_delta):
	if Input.is_action_just_pressed("pause") && get_tree().paused == false:
			self.visible = true
			get_tree().paused = true
	elif Input.is_action_just_pressed("pause") && get_tree().paused == true:
			self.visible = false
			get_tree().paused = false
			

func _on_restart_btn_pressed():
	GlobalInfo.score = 0
	GlobalInfo.waveCount = 1
	PlayerStats.health = PlayerStats.max_health
	for enemy in get_tree().get_nodes_in_group("Enemies"):
		enemy.queue_free()

	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_main_menu_btn_pressed():
	get_tree().change_scene_to_file("res://UI/MainMenuUI/MainMenuUI.tscn")
