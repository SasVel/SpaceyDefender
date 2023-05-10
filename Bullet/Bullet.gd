extends CharacterBody2D
class_name Bullet

@export var SPEED = 420

@onready var entity : CharacterBody2D
@onready var entityPos = entity.position
@onready var entityRot = entity.rotation
@onready var entityVel = entity.velocity


func _ready():
	rotation = entityRot
	position = entityPos

func _physics_process(delta):
	var input_vector = Vector2(cos(rotation + deg_to_rad(-90)), sin(rotation + deg_to_rad(-90)))
	
	velocity = input_vector * SPEED + entityVel
	
	out_of_bounds()
	move_and_slide()
		
func out_of_bounds():
	if position.y < entityPos.y - 400 || position.y > entityPos.y + 400 || position.x < entityPos.x - 700 || position.x > entityPos.x + 700:
		queue_free()

func _on_hurt_box_area_entered(area):
	queue_free()
