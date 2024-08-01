extends AudioStreamPlayer3D


var soundOne = preload("res://sfx/ocean_ambient/wave_01_cc0-11505__transitking__wavesound.mp3")
var soundTwo = preload("res://sfx/ocean_ambient/wave_02_cc0-11505__transitking__wavesound.mp3")
var soundThree = preload("res://sfx/ocean_ambient/wave_03_cc0-11505__transitking__wavesound.mp3")
var soundFour = preload("res://sfx/ocean_ambient/wave_04_cc0-11505__transitking__wavesound.mp3")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func choose_randomly(list_of_entries):
	return list_of_entries[randi() % list_of_entries.size()]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#	print(playing)
	if playing == false:
		yield(get_tree().create_timer(1), "timeout")
		self.stream = (choose_randomly([soundOne,soundTwo,soundThree,soundFour]))
		playing = true
	pass
