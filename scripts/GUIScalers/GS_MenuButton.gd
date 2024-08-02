extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(float) var row
var fadingOut = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	rect_position = Vector2(OS.window_size.x/64,OS.window_size.y*row/16)
	rect_size = Vector2(OS.window_size.x/8,OS.window_size.y*1/32)
	self.get_font("font").size = OS.window_size.y/24
	self.get_font("font").outline_size = OS.window_size.y/192
	pass


func _on_Begin_pressed():
	get_parent().get_node("ColorRect2/AnimationPlayer").play("fadeOut")
	fadingOut = true
	
	
	yield(get_tree().create_timer(5), "timeout")
	get_tree().change_scene("res://scenes/train_interior_beginning.tscn")
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_Discord_pressed():
	OS.shell_open("https://discord.gg/ehcr46vG5X") 
	pass # Replace with function body.


func _on_Credits_pressed():
	get_parent().get_node("ColorRect2/AnimationPlayer").play("fadeOut")
	fadingOut = true
	
	
	yield(get_tree().create_timer(5), "timeout")
	get_tree().change_scene("res://scenes/credits.tscn")
	pass # Replace with function body.
