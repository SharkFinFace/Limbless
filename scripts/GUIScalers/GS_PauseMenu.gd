extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rect_size = Vector2(OS.window_size.y/2,OS.window_size.y/2)
	rect_position = Vector2(OS.window_size.x/2-rect_size.x/2,OS.window_size.y/2-rect_size.y/2)
	
	get_parent().get_node("PauseLabel").rect_size = Vector2(rect_size.x, 0)
	get_parent().get_node("PauseLabel").rect_position = Vector2(rect_position.x, rect_position.y + rect_size.y/24)
	
	get_parent().get_node("SensitivityLabel").rect_size = Vector2(rect_size.x, 0)
	get_parent().get_node("SensitivityLabel").rect_position = Vector2(rect_position.x, get_parent().get_node("PauseLabel").rect_position.y + get_parent().get_node("PauseLabel").rect_size.y)
	
	get_parent().get_node("SensitivityLineEdit").rect_size = Vector2(rect_size.x*9/10, 0)
	get_parent().get_node("SensitivityLineEdit").rect_position = Vector2(rect_position.x + rect_size.x*.5/10, get_parent().get_node("SensitivityLabel").rect_position.y + get_parent().get_node("SensitivityLabel").rect_size.y)
	
	get_parent().get_node("SensitivityLineEdit").get_font("font").size = rect_size.y/12
	get_parent().get_node("SensitivityLineEdit").get_font("font").outline_size = rect_size.y/96
	
	get_parent().get_node("AreYouSure").get_font("font").size = rect_size.y/12
	get_parent().get_node("AreYouSure").get_font("font").outline_size = rect_size.y/96
	
	get_parent().get_node("Exit").rect_size = Vector2(rect_size.x, 0)
	get_parent().get_node("Exit").rect_position = Vector2(rect_position.x, rect_position.y + rect_size.y*11/24)
	
	get_parent().get_node("Settings").rect_size = Vector2(rect_size.x, 0)
	get_parent().get_node("Settings").rect_position = Vector2(rect_position.x, rect_position.y + rect_size.y*8/24)
	
	get_parent().get_node("ExitSettings").rect_size = Vector2(rect_size.x, 0)
	get_parent().get_node("ExitSettings").rect_position = Vector2(rect_position.x, rect_position.y + rect_size.y*20/24)
	
	get_parent().get_node("AreYouSure").rect_size = Vector2(rect_size.x*7/8, 0)
	get_parent().get_node("AreYouSure").rect_position = Vector2(rect_position.x + rect_size.x*1/8/2, rect_position.y + rect_size.y/24)
	
	get_parent().get_node("Unpause").rect_size = Vector2(rect_size.x, 0)
	get_parent().get_node("Unpause").rect_position = Vector2(rect_position.x, rect_position.y + rect_size.y*20/24)
	
	get_parent().get_node("Quit").rect_size = Vector2(rect_size.x, 0)
	get_parent().get_node("Quit").rect_position = Vector2(rect_position.x, rect_position.y + rect_size.y*16/24)
	pass


func pause_visibility(mode):
#	get_parent().get_node("TextureRect").visible = mode
	get_parent().get_node("PauseLabel").visible = mode
	get_parent().get_node("Exit").visible = mode
	get_parent().get_node("Settings").visible = mode
	get_parent().get_node("ExitSettings").visible = !mode
	get_parent().get_node("Unpause").visible = mode


func settings_visibility(mode):
	get_parent().get_node("PauseLabel").visible = mode
	get_parent().get_node("Exit").visible = mode
	get_parent().get_node("SensitivityLabel").visible = !mode
	get_parent().get_node("SensitivityLineEdit").visible = !mode
	get_parent().get_node("Settings").visible = mode
	get_parent().get_node("ExitSettings").visible = !mode
	get_parent().get_node("AreYouSure").visible = false
	get_parent().get_node("Unpause").visible = mode
	get_parent().get_node("Quit").visible = false
	
func are_you_sure(mode):
	get_parent().get_node("AreYouSure").visible = mode
	get_parent().get_node("Quit").visible = mode


func _on_Exit_pressed():
	pause_visibility(false)
	are_you_sure(true)
	pass # Replace with function body.


func _on_Settings_pressed():
	settings_visibility(false)
	pass # Replace with function body.


func _on_ExitSettings_pressed():
	if get_node_or_null("/root/NoPause") == null:
		settings_visibility(true)
	else: # This is for changing settings on the main menu.
		self.get_parent().visible = false
		PauseMenu.save_settings()
	pass # Replace with function body.


func _on_Unpause_pressed():
	get_parent().unpause()
	pass # Replace with function body.


func _on_Quit_pressed():
	get_parent().unpause()
	get_tree().change_scene("res://scenes/just_the_beginning.tscn")
	pass # Replace with function body.
