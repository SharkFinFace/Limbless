extends AnimationPlayer

onready var InteractRaycast = get_node("/root/Spatial/Player/Camera/InteractRayCast")
onready var NPC0 = get_node("/root/Spatial/MeshInstance")

onready var playerNode = get_node("/root/Spatial/Player")
onready var playerSpeed = playerNode.max_speed
onready var playerJSpeed = playerNode.jump_speed

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Current max player speed is " + str(playerSpeed) + ". This will be temporarily set to 0.")
	setup()
	play("talker")
	yield(get_tree().create_timer(5), "timeout")
	unSetup()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setup():
	InteractRaycast.enabled = false
	NPC0.set_visible(false)
	playerNode.max_speed = 0
	playerNode.jump_speed = 0
	playerNode.jump_action = "nil_action"

func unSetup():
	InteractRaycast.enabled = true
	NPC0.set_visible(true)
	get_parent().get_parent().queue_free()
	playerNode.max_speed = playerSpeed
	playerNode.jump_speed = playerJSpeed
	playerNode.jump_action = "player_jump"
