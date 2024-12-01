extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(7), "timeout")
	self.playing = true
	
	yield(get_tree().create_timer(8.1), "timeout") #15.1-7
	get_parent().get_node("screech").playing = true
	
	yield(get_tree().create_timer(18.9), "timeout") #34-7-8.1
	self.playing = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
