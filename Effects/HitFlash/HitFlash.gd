extends Node2D

var target : Sprite2D
@onready var flashTimer = $FlashTimer

func _ready():
	flashTimer.start()
	target.self_modulate = Color(10, 10,10)

func _on_flash_timer_timeout():
	if target != null:
		target.self_modulate = Color(1, 1, 1)
