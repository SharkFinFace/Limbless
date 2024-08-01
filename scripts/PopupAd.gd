extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var playerNode = get_node("/root/Spatial/Player")
onready var ad = get_node("/root/Spatial/Ad4")

var done = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !done and playerNode.translation.x >= 31.5:
		ad.visible = true
		get_node("AudioStreamPlayer").play()
		done = true
		pass
	pass
