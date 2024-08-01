extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimationPlayer").play("Logo")
	yield(get_tree().create_timer(4), "timeout")
	get_tree().change_scene("res://scenes/just_the_beginning.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	rect_size = Vector2(OS.window_size.y*3/4, OS.window_size.y*3/4)
	rect_position = Vector2(OS.window_size.x/2-rect_size.x/2,OS.window_size.y/2-rect_size.y/2)
	pass
