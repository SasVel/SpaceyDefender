extends Node2D
class_name WavesController

signal on_no_enemies
var isActive : bool = true

func _process(delta):
	if isActive:
		if get_tree().get_nodes_in_group("Enemies").size() == 0:
			emit_signal("on_no_enemies")
			print("works")
			isActive = false
			GlobalInfo.waveCount += 1
			

