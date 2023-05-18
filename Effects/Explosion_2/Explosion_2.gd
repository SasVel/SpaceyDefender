extends "res://Effects/Effect.gd"


func _on_explosion_light_sound_player_ready():
	var explosionSound = $ExplosionLightSoundPlayer/AudioStreamPlayer2D
	explosionSound.play()
