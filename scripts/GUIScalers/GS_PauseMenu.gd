extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rect_size = Vector2(OS.window_size.y/2,OS.window_size.y/2)
	rect_position = Vector2(OS.window_size.x/2-rect_size.x/2,OS.window_size.y/2-rect_size.y/2)
	pass

