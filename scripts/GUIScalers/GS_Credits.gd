extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(3.449), "timeout")
	text = ""
	yield(get_tree().create_timer(2), "timeout")

	text = "Voices:\n"
	yield(get_tree().create_timer(1), "timeout")

	text = "Voices:\nOtis (old man) - The Fella"
	yield(get_tree().create_timer(1), "timeout")

	text = "Voices:\nOtis (old man) - The Fella\nMr. Crimal - SharkFinFace"
	yield(get_tree().create_timer(1), "timeout")

	text = "Voices:\nOtis (old man) - The Fella\nMr. Crimal - SharkFinFace\nViolet (jellyfish girl) - FlowerPowerJedi"
	yield(get_tree().create_timer(1), "timeout")

	text = "Voices:\nOtis (old man) - The Fella\nMr. Crimal - SharkFinFace\nViolet (jellyfish girl) - FlowerPowerJedi\nGumless Steven (shopkeeper) - The Fella"
	yield(get_tree().create_timer(1), "timeout")

	text = "Voices:\nOtis (old man) - The Fella\nMr. Crimal - SharkFinFace\nViolet (jellyfish girl) - FlowerPowerJedi\nGumless Steven (shopkeeper) - The Fella\nCOOLCHUMLY985 (YouTuber) - ImSpooky"
	yield(get_tree().create_timer(5), "timeout")

	text = "Character Designers:"
	yield(get_tree().create_timer(1), "timeout")

	text = "Character Designers:\nThe Fella"
	yield(get_tree().create_timer(1), "timeout")

	text = "Character Designers:\nThe Fella\nSharkFinFace"
	yield(get_tree().create_timer(1), "timeout")

	text = "Character Designers:\nThe Fella\nSharkFinFace\nImSpooky"
	yield(get_tree().create_timer(3), "timeout")
	
	text = "Music Makers:"
	yield(get_tree().create_timer(1), "timeout")
	
	get_node("/root/Control/Label2").visible = true
	yield(get_tree().create_timer(1), "timeout")
	
	text = "Music Makers:\n\n\n\nThe Fella"
	yield(get_tree().create_timer(5), "timeout")
	
	get_node("/root/Control/Label2").visible = false
	text = "Everything else:"
	yield(get_tree().create_timer(1), "timeout")
	
	get_node("/root/Control/Label3").visible = true
	
	yield(get_tree().create_timer(5), "timeout")
	get_tree().change_scene("res://scenes/just_the_beginning.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	rect_position = Vector2(0,OS.window_size.y*2/6)
	rect_size = Vector2(OS.window_size.x,OS.window_size.y*1/6)
	self.get_font("font").size = OS.window_size.y/24
#	self.get_font("font").outline_size = OS.window_size.y/192
	pass
