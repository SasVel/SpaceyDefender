extends Node2D

var target : CharacterBody2D

func _ready():
	self.visible = true
	target = self.get_parent() as CharacterBody2D

func _process(delta):
	self.global_position = GlobalInfo.playerPosition
	rotate_to_target()

func _on_indicator_notifier_screen_entered():
	self.visible = false
	pass

func _on_indicator_notifier_screen_exited():
	self.visible = true
	pass

func rotate_to_target():
	self.look_at(target.position)
	rotation += deg_to_rad(90)

