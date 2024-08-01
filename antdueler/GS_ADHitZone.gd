extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Your norm GS
	rect_size = Vector2(OS.window_size.y/4/2,OS.window_size.y/4)
	rect_position = Vector2((OS.window_size.x-get_width_from_height(OS.window_size.y/3)/.9),OS.window_size.y*3/5)
	
	# Zone detection
	var hit_zone = get_parent().get_node("HitZone")
#	if hit_zone and is_overlapping(hit_zone):
#		print("Overlapping with HitZone!")
#	else:
#		print("Not overlapping with HitZone.")
	pass

func get_height_from_width(width: float) -> float:
	return width * 1.0 / 2.5

func get_width_from_height(height: float) -> float:
	return height * 2.5 / 1.0

#func is_overlapping(other_rect):
#	var this_rect = Rect2(rect_global_position, rect_size)
#	var other_rect_global = Rect2(other_rect.rect_global_position, other_rect.rect_size)
#	return this_rect.intersects(other_rect_global)
