extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var playerNode = get_node("/root/Spatial/Player")
onready var ad = get_node("/root/Spatial/Ad4")

onready var MazeGreen = get_node("/root/Spatial/MazeGreenscreen")
onready var MazeREAL = get_node("/root/Spatial/Maze")

export var done = false
export var doneTwo = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !done and playerNode.translation.z <= -39:
		ad.visible = true
		get_node("AudioStreamPlayer").play()
		done = true
		yield(get_tree().create_timer(1.5), "timeout")
		get_node("/root/Spatial/Timer").set_visible(true)
		get_node("/root/Spatial/Timer").on = true
		
		MazeGreen.translation.y = -10
		MazeREAL.translation.y = 0
		pass
		
	if !doneTwo and playerNode.translation.x >= 107.7 and playerNode.translation.z <= -103.5 and playerNode.translation.z >= -116.5:
#		ad.visible = true
		print(done)
		get_node("Yipee").play()
		doneTwo = true
		get_node("/root/Spatial/Timer").bricked = true
#		yield(get_tree().create_timer(1.5), "timeout")
		get_node("/root/Spatial/Timer").set_visible(false)
#		get_node("/root/Spatial/Timer").on = true
		
		MazeGreen.translation.y = 0
		MazeREAL.translation.y = -10
		pass
	pass
