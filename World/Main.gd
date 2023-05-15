extends Node2D

func _ready():
	var wavesUI = $UIElements/WavesUI
	wavesUI.on_no_enemies()
