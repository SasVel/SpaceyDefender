extends "res://Effects/Effect.gd"

func _on_explosion_sound_player_ready():
	var explosionSound = $ExplosionSoundPlayer/AudioStreamPlayer2D
	explosionSound.play()
