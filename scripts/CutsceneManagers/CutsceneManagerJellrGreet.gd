extends AnimationPlayer

onready var InteractRaycast = get_node("/root/Spatial/Player/Camera/InteractRayCast")
onready var jellr = get_node("/root/Spatial/Jellr")
onready var generics = get_node("/root/Spatial/Generics")
onready var jellrCol = get_node("/root/Spatial/NPC")

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
	CCLabel.text = "Ah, a guest!"
	play("ah")
	yield(get_tree().create_timer(0.5), "timeout")
	play("aguest")
	yield(get_tree().create_timer(1.25), "timeout")
	
	CCLabel.text = "Welcome to the Temple of our ruler, King Seaweed Simon!"
	play("welcome")
	yield(get_tree().create_timer(3.633), "timeout")
	
	CCLabel.text = "Yeeaahh… no one like Poseidon or anything like that. He rules elsewhere."
	play("yeah")
	yield(get_tree().create_timer(5.114), "timeout")

	CCLabel.text = "But Simon is still a wonderful leader!"
	play("but")
	yield(get_tree().create_timer(2.496), "timeout")
	
	CCLabel.text = "Here, Simon stores his goods and has his business meetings. He does both upstairs."
	play("welcome")
	yield(get_tree().create_timer(5.267), "timeout")
	
	CCLabel.text = "Unfortunately, he is not here today. He's on vacation."
	play("unfortunately")
	yield(get_tree().create_timer(4.205), "timeout")
	
	CCLabel.text = "Even if he was, you would have to book an appointment before I could let you up there."
#	play("welcome")
	yield(get_tree().create_timer(4.299), "timeout")
	#####
	CCLabel.text = "Earliest I can get you in is..."
	play("earliest")
	yield(get_tree().create_timer(1.709), "timeout")
	
	CCLabel.text = "Earliest I can get you in is... next moon."
	play("unfortunately")
	yield(get_tree().create_timer(1.47), "timeout")
	######
	
	CCLabel.text = "In the meantime, why don't you take a look at the wonderful artworks of King Seaweed Simon hung on the walls?"
	play("welcome")
	yield(get_tree().create_timer(5.072), "timeout")
	
	
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
	jellr.set_visible(true)
	InteractRaycast.enabled = true
	generics.set_visible(true)
	jellrCol.queue_free()
	get_parent().get_parent().queue_free()
	playerNode.max_speed = playerSpeed
	playerNode.jump_speed = playerJSpeed
	playerNode.jump_action = "player_jump"
	SettingVariables.can_pause = true
