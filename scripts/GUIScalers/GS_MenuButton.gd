extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(float) var row
export var allignment_l_or_r = "L"
export var is_version_checker = false
var up_to_date = true
var fadingOut = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if is_version_checker:
		var http_request = HTTPRequest.new()
		add_child(http_request)
		http_request.connect("request_completed", self, "_on_request_completed")
		http_request.request("https://pastebin.com/raw/hLvgB8F2")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	rect_size = Vector2(0,OS.window_size.y*1/32)
	if allignment_l_or_r == "L":
		rect_position = Vector2(OS.window_size.x/64,OS.window_size.y*row/16)
	elif allignment_l_or_r == "R":
		rect_position = Vector2(OS.window_size.x-OS.window_size.x/64 - rect_size.x,OS.window_size.y*row/16)
	if is_version_checker:
		self.get_font("font").size = OS.window_size.y/24*.75
		self.get_font("font").outline_size = OS.window_size.y/192*.75
	else:
		self.get_font("font").size = OS.window_size.y/24
		self.get_font("font").outline_size = OS.window_size.y/192
	pass


func _on_Begin_pressed():
	get_parent().get_node("ColorRect2/AnimationPlayer").play("fadeOut")
	fadingOut = true
	SettingVariables.can_pause = false
	
	
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


func _on_Version_pressed():
	if !up_to_date:
		OS.shell_open("https://sharkfinface.itch.io/limbless")
	pass # Replace with function body.


func _on_request_completed(result, response_code, headers, body):
	if response_code == 200:
		print("Latest version: " + body.get_string_from_utf8())
		print("Current version: " + self.text)
		
		if body.get_string_from_utf8() == self.text:
			print("Game is up-to-date.")
		else:
			print("Version outdated or error.")
			incorrect_version()
	else:
		print("Failed to load latest version.\nResponse code: " + str(response_code))
		failed_request()

func incorrect_version():
	up_to_date = false
	self.text = "(OUTDATED! Click to open download page.) " + self.text
	set("custom_colors/font_color_focus", "ff0000")
	set("custom_colors/font_color", "ff0000")
	set("custom_colors/font_color_hover", "ff0000")
	set("custom_colors/font_color_pressed", "ff0000")

func failed_request():
	up_to_date = false
	self.text = "(Failed to check for updates.) " + self.text
	set("custom_colors/font_color_focus", "ff0000")
	set("custom_colors/font_color", "ff0000")
	set("custom_colors/font_color_hover", "ff0000")
	set("custom_colors/font_color_pressed", "ff0000")
