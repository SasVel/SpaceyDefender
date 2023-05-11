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
			
