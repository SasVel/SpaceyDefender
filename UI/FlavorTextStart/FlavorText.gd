extends Control

@onready var text = $MainText
@export var textContet : String
@export var speed : float = 8.0

func _ready():
	text.visible_ratio = 0
	text.push_color(Color.GREEN)
	text.append_text(textContet)

func _process(delta):
	text.visible_ratio += speed / 1000
	
	if Input.is_anything_pressed():
		_on_wait_timer_timeout()

func _on_wait_timer_timeout():
	get_tree().change_scene_to_file("res://World/Main.tscn")
