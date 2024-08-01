extends Node


onready var mazes = get_node("/root/Spatial/Maze")
onready var mazeKhat = get_node("/root/Spatial/Maze/MazeKhat")
onready var mazeKys = get_node("/root/Spatial/Maze/MazeKys")
onready var mazeCrazy = get_node("/root/Spatial/Maze/MazeCrazy")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayerArea_area_entered(area):
	print(area)
	print(area.get_parent())
	if !mazes.visible:
		mazes.visible = true
		if area.get_parent() == mazeKhat:
			get_node("khat").playing = true
		elif area.get_parent() == mazeKys:
			get_node("kys").playing = true
		elif area.get_parent() == mazeCrazy:
			get_node("crazy").playing = true
		yield(get_tree().create_timer(2), "timeout")
		mazes.visible = false
	pass # Replace with function body.
