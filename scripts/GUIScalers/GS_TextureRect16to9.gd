extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# This one keeps the width consistent.
#func _process(_delta):
#	var gottenHeight = get_height_from_width(OS.window_size.x)
#
#	rect_size = Vector2(OS.window_size.x, gottenHeight)
#	rect_position = Vector2(0,(OS.window_size.y - gottenHeight)/2)
#	pass

# This one keeps the height consistent.
func _process(_delta):
	var gottenWidth = get_width_from_height(OS.window_size.y)
	
	rect_size = Vector2(gottenWidth, OS.window_size.y)
	rect_position = Vector2((OS.window_size.x - gottenWidth)/2,0)
	pass

func get_height_from_width(width: float) -> float:
	return width * 9.0 / 16.0

func get_width_from_height(height: float) -> float:
	return height * 16.0 / 9.0
