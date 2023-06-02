extends Area2D

@export var health_on_pickup = 1

func _on_body_entered(body):
	PlayerStats.health += health_on_pickup
	queue_free()

func _on_pickup_timer_timeout():
	queue_free()
