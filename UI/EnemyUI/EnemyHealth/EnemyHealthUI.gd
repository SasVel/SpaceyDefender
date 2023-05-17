extends Node2D

@onready var healthBar = $HealthBar
@export var stats : Node2D
func _ready():
	self.visible = false
	healthBar.max_value = stats.max_health
	healthBar.value = stats.health
	stats.changed_health.connect(_on_stats_changed_health)
	
func _process(delta):
	global_rotation = deg_to_rad(0)

func _on_stats_changed_health(val):
	self.visible = true
	healthBar.value = val
