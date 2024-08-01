extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var scorekeeper = get_node("/root/Control")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# This one keeps the width consistent.
#func _process(_delta):
#	var gottenHeight = get_height_from_width(OS.window_size.x)
#
#	rect_size = Vector2(OS.window_size.x, gottenHeight)
#	rect_position = Vector2(0,(OS.window_size.y - gottenHeight)/2)
#	pass

# This one keeps the height consistent.
func _process(_delta):
	var gottenWidth = get_width_from_height(OS.window_size.y)
	
	rect_size = Vector2(gottenWidth, OS.window_size.y)
	rect_position = Vector2(0,0)
	
	if scorekeeper.healthEnemy == 4:
		get_node("AnimationPlayer").play("four")
	elif scorekeeper.healthEnemy == 3:
		get_node("AnimationPlayer").play("three")
	elif scorekeeper.healthEnemy == 2:
		get_node("AnimationPlayer").play("two")
	elif scorekeeper.healthEnemy == 1:
		get_node("AnimationPlayer").play("one")
	elif scorekeeper.healthEnemy == 0:
		get_node("AnimationPlayer").play("zero")
	pass

func get_height_from_width(width: float) -> float:
	return width * 9.0 / 16.0

func get_width_from_height(height: float) -> float:
	return height * 16.0 / 9.0
