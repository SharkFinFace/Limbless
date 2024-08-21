extends Control


export var uncapture_action = "ui_cancel"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_input()
	pass

func handle_input():
	if Input.is_action_pressed(uncapture_action) and get_node_or_null("/root/NoPause") == null and SettingVariables.pauseDisabled == false:
#		print("e")
		Engine.time_scale = 0
		self.visible = true
#	else:
#		Engine.time_scale = 1
#		self.visible = false
