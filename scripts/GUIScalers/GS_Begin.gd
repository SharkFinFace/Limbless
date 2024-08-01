extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var fadingOut = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	rect_position = Vector2(OS.window_size.x/32,OS.window_size.y*8/16)
	rect_size = Vector2(OS.window_size.x/8,OS.window_size.y*1/32)
	self.get_font("font").size = OS.window_size.y/24
	self.get_font("font").outline_size = OS.window_size.y/192
	
	if fadingOut:
		if AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")) > -80:
			yield(get_tree().create_timer(0.05), "timeout")
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")) - 0.15)
			print(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	pass


func _on_Begin_pressed():
	get_parent().get_node("ColorRect2/AnimationPlayer").play("fadeOut")
	fadingOut = true
	
	
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://scenes/train_interior_beginning.tscn")
	pass # Replace with function body.
