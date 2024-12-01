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
	if self.volume_db > goalDB:
		self.volume_db = goalDB
		# This should prevent a bug where pausing the game leads to higher than goalDB value.
		# Fortunately, this bug only can occur during testing by starting the game at a scene with the script.
		# No harm in fixing anyways.
		# Saves my ears a lil more time.
	pass
