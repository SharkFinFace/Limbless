extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	rect_position = Vector2(OS.window_size.x/32,OS.window_size.y*9/16)
	rect_size = Vector2(OS.window_size.x/8,OS.window_size.y*1/32)
	self.get_font("font").size = OS.window_size.y/24
	self.get_font("font").outline_size = OS.window_size.y/192
	pass
