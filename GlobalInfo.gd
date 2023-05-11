extends Node2D

var playerPosition : Vector2
var playerRotation
var playerVelocity : Vector2

var score : int = 0
var enemiesKilled : int = 0

func _on_score_timer_timeout():
	score += 10
