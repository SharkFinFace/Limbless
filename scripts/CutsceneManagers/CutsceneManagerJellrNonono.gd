extends AnimationPlayer

onready var InteractRaycast = get_node("/root/Spatial/Player/Camera/InteractRayCast")
onready var jellr = get_node("/root/Spatial/Jellr")
onready var generics = get_node("/root/Spatial/Generics")
#onready var jellrCol = get_node("/root/Spatial/NPC")

onready var playerNode = get_node("/root/Spatial/Player")
onready var playerSpeed = playerNode.max_speed
onready var playerJSpeed = playerNode.jump_speed

onready var AudioPlayer = get_parent().get_parent().get_node("AudioStreamPlayer")
onready var CCLabel = get_parent().get_parent().get_node("CCLabel")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#print("Current max player speed is " + str(playerSpeed) + ". This will be temporarily set to 0.")
	setup()
	yield(get_tree().create_timer(0.5), "timeout")

	CCLabel.get_node("ColorRect").visible = true
	AudioPlayer.playing = true
	CCLabel.text = "NO, NO, NO! WHAT HAVE YOU DONE!"
	play("nonono")
#	yield(get_tree().create_timer(0.5), "timeout")
#	play("aguest")
	yield(get_tree().create_timer(2.249), "timeout")
	
	CCLabel.text = "THIS IS GONNA TAKE AGES TO CLEAN UP!"
#	play("welcome")
	yield(get_tree().create_timer(2.075), "timeout")
	
	CCLabel.text = "KING SIMON's GONNA BE FURIOUS!"
#	play("yeah")
	yield(get_tree().create_timer(1.72), "timeout")
	
	
	yield(get_tree().create_timer(0.5), "timeout")
#
	unSetup()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setup():
	InteractRaycast.enabled = false
	jellr.set_visible(false)
	generics.set_visible(false)
	playerNode.max_speed = 0
	playerNode.jump_speed = 0
	playerNode.jump_action = "nil_action"

func unSetup():
	InteractRaycast.enabled = true
#	jellr.set_visible(true)
	generics.set_visible(true)
#	jellrCol.queue_free()
	get_parent().get_parent().queue_free()
	playerNode.max_speed = playerSpeed
	playerNode.jump_speed = playerJSpeed
	playerNode.jump_action = "player_jump"
