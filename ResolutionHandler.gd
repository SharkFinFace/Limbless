extends Node

var resolution_720p = Vector2(1280, 720)
var resolution_1080p = Vector2(1920, 1080)

var screen_size = OS.get_screen_size()

var resolution_halfres = Vector2(screen_size.x/2, screen_size.y/2)

func _ready():
	# Initial resolution setting
	change_resolution(resolution_halfres)

func change_resolution(resolution):
	OS.window_size = resolution
	get_viewport().size = resolution

	# Calculate the screen size and the new position to center the window
	var screen_size = OS.get_screen_size()
	var new_position = (screen_size - resolution) / 2

	# Set the new window position
	OS.window_position = new_position

	print("Resolution changed to: ", resolution, ", Window centered at: ", new_position)
