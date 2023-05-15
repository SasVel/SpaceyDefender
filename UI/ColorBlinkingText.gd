extends Label

#The Script needs a BlinkTimer as a child of the label
@onready var blinkTimer = $BlinkTimer
@export var ColorHex : String
var isColored: bool = false

func _on_blink_timer_timeout():
	if isColored == false:
		self.label_settings.font_color = ColorHex
		isColored = true
	else:
		self.label_settings.font_color = Color.WHITE
		isColored = false
