extends ParallaxBackground

@export var scroll_speed = 80
@export var direction = Vector2(0,1)

func _process(delta):
	scroll_offset += direction * scroll_speed * delta

