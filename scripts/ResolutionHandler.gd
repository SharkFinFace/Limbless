extends Node

var screen_size = OS.get_screen_size()

var resolution_half = Vector2(screen_size.x/2, screen_size.y/2)
var resolution_threequarters = Vector2(screen_size.x*0.75, screen_size.y*0.75)

var current_res = null

func _ready():
	# Initial resolution setting
	#print(OS.get_name())
	if OS.get_name() != "HTML5":
		_on_3of4_pressed()
	pass

func change_resolution(resolution):
	OS.window_size = resolution
	get_viewport().size = resolution

	# Calculate the screen size and the new position to center the window
	var screen_size = OS.get_screen_size()
	var new_position = (screen_size - resolution) / 2

	# Set the new window position
	OS.window_position = new_position

	print("Resolution changed to: ", resolution, ", Window centered at: ", new_position)
	
	current_res = resolution







func _on_half_pressed():
	if current_res != "half":
		OS.window_fullscreen = false
		change_resolution(resolution_half)
		current_res = "half"
	pass # Replace with function body.


func _on_3of4_pressed():
	if current_res != "3of4":
		OS.window_fullscreen = false
		change_resolution(resolution_threequarters)
		current_res = "3of4"
	pass # Replace with function body.


func _on_full_pressed():
	if current_res != "full":
		OS.window_fullscreen = true
		change_resolution(screen_size)
		current_res = "full"
	pass # Replace with function body.


func _on_fullwin_pressed():
	if current_res != "fullwin":
		OS.window_fullscreen = false
		change_resolution(screen_size)
		current_res = "fullwin"
	pass # Replace with function body.


func _on_go_pressed():
	get_tree().change_scene("res://scenes/company_intro.tscn")
	pass # Replace with function body.
