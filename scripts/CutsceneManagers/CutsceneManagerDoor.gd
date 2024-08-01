extends AnimationPlayer

onready var InteractRaycast = get_node("/root/Spatial/Player/Camera/InteractRayCast")

onready var playerNode = get_node("/root/Spatial/Player")
onready var playerSpeed = playerNode.max_speed
onready var playerJSpeed = playerNode.jump_speed

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#print("Current max player speed is " + str(playerSpeed) + ". This will be temporarily set to 0.")
	setup()
	
	play("fade")
	
	# These two lines were moved to InteractableDoor.gd
#	yield(get_tree().create_timer(3), "timeout")
#
#	get_tree().change_scene("res://scenes/village.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setup():
	InteractRaycast.enabled = false
	playerNode.max_speed = 0
	playerNode.jump_speed = 0
	playerNode.jump_action = "nil_action"
