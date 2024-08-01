extends AudioStreamPlayer


export (int) var goalDB
export (float) var factor

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.volume_db < goalDB:
		yield(get_tree().create_timer(0.05), "timeout")
		self.volume_db = self.volume_db + factor
		print (self.volume_db)
	pass
