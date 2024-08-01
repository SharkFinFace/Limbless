extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var tween: Tween
var start_position = Vector2(OS.window_size.x/2,(OS.window_size.y/2-position.y/2/180 - OS.window_size.y*1.5/8)*-4)
var end_position = Vector2(OS.window_size.x/2,OS.window_size.y/2-position.y/2/180 - OS.window_size.y*1.5/8)

# Called when the node enters the scene tree for the first time.
func _ready():
	tween = Tween.new()
	
	add_child(tween)
	
	# Pause for intro
	yield(get_tree().create_timer(0.25), "timeout")
	start_tween()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	start_position = Vector2(OS.window_size.x/2,(OS.window_size.y/2-position.y/2/180 - OS.window_size.y*1.5/8)*-4)
	end_position = Vector2(OS.window_size.x/2,OS.window_size.y/2-position.y/2/180 - OS.window_size.y*1.5/8)
	scale = Vector2(OS.window_size.y*1.5/4/180, OS.window_size.y*1.5/4/180)
	position.x = OS.window_size.x/2-position.x/2/320
#	print(position)
	pass

func start_tween():
	position = start_position
	tween.interpolate_property(self, "position", start_position, end_position, 2.0, Tween.EASE_IN_OUT, Tween.EASE_IN_OUT)
	tween.start()
