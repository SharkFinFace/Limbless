extends Control


export var uncapture_action = "ui_cancel"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var playback_bmas
var playback_screech
var playback_getout
var playback_sit


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_input()
	pass

func handle_input():
	if Input.is_action_just_pressed(uncapture_action) and get_node_or_null("/root/NoPause") == null and Engine.time_scale != 0:
		if SettingVariables.can_pause:
			Engine.time_scale = 0
			self.visible = true
			
			# Audio fixers
			if get_node_or_null("/root/Spatial/bmas") != null:
				playback_bmas = get_node("/root/Spatial/bmas").get_playback_position()
				get_node("/root/Spatial/bmas").stop()
			if get_node_or_null("/root/Spatial/screech") != null:
				playback_screech = get_node("/root/Spatial/screech").get_playback_position()
				get_node("/root/Spatial/screech").stop()
			if get_node_or_null("/root/Spatial/bmas_getout") != null:
				playback_getout = get_node("/root/Spatial/bmas_getout").get_playback_position()
				get_node("/root/Spatial/bmas_getout").stop()
			if get_node_or_null("/root/Spatial/sit") != null:
				playback_sit = get_node("/root/Spatial/sit").get_playback_position()
				get_node("/root/Spatial/sit").stop()
			
			SettingVariables.is_paused = true
			load_settings()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	elif Input.is_action_just_pressed(uncapture_action) and get_node_or_null("/root/NoPause") == null and SettingVariables.can_pause:
		Engine.time_scale = 1
		self.visible = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
		
		# Audio fixers
		if get_node_or_null("/root/Spatial/bmas") != null:
			if playback_bmas > 0 and playback_bmas < get_node("/root/Spatial/bmas").stream.get_length():
				get_node("/root/Spatial/bmas").play(playback_bmas)
		if get_node_or_null("/root/Spatial/screech") != null:
			if playback_screech > 0 and playback_screech < get_node("/root/Spatial/screech").stream.get_length():
				get_node("/root/Spatial/screech").play(playback_screech)
		if get_node_or_null("/root/Spatial/bmas_getout") != null:
			if playback_getout > 0 and playback_getout < get_node("/root/Spatial/bmas_getout").stream.get_length():
				get_node("/root/Spatial/bmas_getout").play(playback_getout)
		if get_node_or_null("/root/Spatial/sit") != null:
			if playback_sit > 0 and playback_sit < get_node("/root/Spatial/sit").stream.get_length():
				get_node("/root/Spatial/sit").play(playback_sit)
		
		SettingVariables.is_paused = false
		save_settings()

func load_settings():
	get_node("LineEdit").text = str(SettingVariables.data["sensitivity"])

func save_settings():
#	print(float(get_node("LineEdit").text))
	SettingVariables.data["sensitivity"] = float(get_node("LineEdit").text)
	SettingVariables.save_data()
