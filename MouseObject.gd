extends Area2D

func _process(_delta):
	self.position = get_global_mouse_position()
	


func _on_body_entered(body):
	var player = body as Player
	
	player.inputOn = false
	player.currentState = player.state.IDLE

func _on_body_exited(body):
	var player = body as Player
	player.inputOn = true
