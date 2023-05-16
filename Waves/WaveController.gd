extends Node2D
class_name WavesController

signal on_no_enemies
var isActive : bool = false
@onready var Mothership = preload("res://Enemies/Mothership/EnemyMothership.tscn")
@onready var currScreenSize = get_viewport().get_visible_rect().size

func _process(delta):
	if isActive:
		if get_tree().get_nodes_in_group("Enemies").size() == 0:
			GlobalInfo.waveCount += 1
			emit_signal("on_no_enemies")
			

func spawn_enemies():
	for i in GlobalInfo.waveCount * 2:
		spawn_mothership()

func spawn_mothership():
	var randomQuadrant = Vector2(-1 if randi_range(0, 1) == 0 else 1,-1 if randi_range(0, 1) == 0 else 1)
	var spawnPosX = GlobalInfo.playerPosition.x + (currScreenSize.x * randomQuadrant.x) + randi_range(-100, 100)
	var spawnPosY = GlobalInfo.playerPosition.y + (currScreenSize.y * randomQuadrant.y) + randi_range(-100, 100)
	var randomPosition = Vector2(spawnPosX, spawnPosY)
	var mothership = Mothership.instantiate()
	mothership.position = randomPosition
	get_tree().get_root().add_child(mothership)
