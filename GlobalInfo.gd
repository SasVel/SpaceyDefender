extends Node2D

var playerPosition : Vector2
var playerRotation
var playerVelocity : Vector2

var score : int = 0
var enemiesKilled : int = 0

signal wave_count_changed
var waveCount : int = 0 : set = on_wave_count_changed
func _on_score_timer_timeout():
	score += 10

func on_wave_count_changed(val):
	waveCount = val
