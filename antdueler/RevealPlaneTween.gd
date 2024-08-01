extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	
	tween = Tween.new()
	
	add_child(tween)
	
	yield(get_tree().create_timer(1.5), "timeout")
	start_tween()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func start_tween():
	var start_position = rect_position
	var end_position = Vector2(rect_position.x,OS.window_size.y*2)
	
	rect_position = start_position
	tween.interpolate_property(self, "rect_position", start_position, end_position, 2.0, Tween.EASE_IN_OUT, Tween.EASE_IN_OUT)
	tween.start()
