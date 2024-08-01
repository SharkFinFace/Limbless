extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	rect_position = Vector2((OS.window_size.x-get_width_from_height(OS.window_size.y/2))/2,OS.window_size.y*3/5)
	rect_size = Vector2(get_width_from_height(OS.window_size.y/2),OS.window_size.y/4)
#	print(rect_size)
	pass

func get_height_from_width(width: float) -> float:
	return width * 1.0 / 2.5

func get_width_from_height(height: float) -> float:
	return height * 2.5 / 1.0
