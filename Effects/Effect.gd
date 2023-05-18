extends AnimatedSprite2D

func _ready():
	if self.animation_finished.get_connections() == null:
		self.animation_finished.connect(_on_animation_finished)
	self.play("Animate")
	
func _on_animation_finished():
	queue_free()


