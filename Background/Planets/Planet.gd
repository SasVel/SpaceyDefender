extends Sprite2D

@onready var planets = [
	preload("res://Background/Planets/Terran.png"),
	preload("res://Background/Planets/Baren.png"),
	preload("res://Background/Planets/Ice.png"),
	preload("res://Background/Planets/Lava.png"),
]

func _ready():
	self.texture = planets.pick_random()
