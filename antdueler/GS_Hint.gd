extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	rect_position = Vector2(0,OS.window_size.y*13.5/16)
	self.get_font("font").size = OS.window_size.y/16*7/8
	self.get_font("font").outline_size = OS.window_size.y/128
	pass
