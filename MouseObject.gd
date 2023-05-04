extends Area2D

func _process(_delta):
	self.position = get_global_mouse_position()
		

func _on_body_entered(body):
	set_process_input(false)
