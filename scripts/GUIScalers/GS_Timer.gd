extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var playerNode = get_node("/root/Spatial/Player")

onready var MazeGreen = get_node("/root/Spatial/MazeGreenscreen")
onready var MazeREAL = get_node("/root/Spatial/Maze")

export var on = false
export var triggered = false
export var bricked = false

var maxTime = 180
var timeLeft = maxTime


# Called when the node enters the scene tree for the first time.
func timer():
	text = str(maxTime)
	
	yield(get_tree().create_timer(1), "timeout")
	for i in range(maxTime + 1):
		print(bricked)
#		print("This is loop number ", i + 1)
#		print(text)
		timeLeft -= 1
		if timeLeft > 170:
			text = str(timeLeft) + "\n(The editor will add epic music in post.)"
		else:
			text = str(timeLeft)
		if timeLeft == -1 and !bricked:
			visible = false
			text = str(timeLeft)
			playerNode.target_yaw_pitch = Vector2(0,0)
			playerNode.yaw_pitch = Vector2(0,0)
			playerNode.translation = Vector3(48, 33, -96)
			
			get_node("/root/Spatial/AudioStreamPlayer").playing = false
			get_node("AudioStreamPlayer").play()
			yield(get_tree().create_timer(20), "timeout")
			
			
			MazeGreen.translation.y = 0
			MazeREAL.translation.y = -10
			
			visible = false
			
			get_node("/root/Spatial/AudioStreamPlayer").playing = true
#			get_node("/root/AudioStreamPlayer").stream_paused = false
			
			playerNode.target_yaw_pitch = Vector2(0,0)
			playerNode.yaw_pitch = Vector2(0,0)
			playerNode.translation = Vector3(50, 0, -28)
			
			yield(get_tree().create_timer(0.5), "timeout")
			
			on = false
			triggered = false
			timeLeft = maxTime
			get_node("/root/Spatial/Node3").done = false
		yield(get_tree().create_timer(1), "timeout")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	rect_position = Vector2(0,OS.window_size.y*1/32)
	self.get_font("font").size = OS.window_size.y/16
	self.get_font("font").outline_size = OS.window_size.y/128
	
	if on and !triggered:
		triggered = true
		timer()
	pass
