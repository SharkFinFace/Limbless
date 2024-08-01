extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(0.4), "timeout")
#	get_tree().change_scene("res://antdueler/antdueler.tscn")
	
	queue_free()
	get_parent().get_node("music").playing = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
