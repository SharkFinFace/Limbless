extends AnimationPlayer

onready var InteractRaycast = get_node("/root/Spatial/Player/Camera/InteractRayCast")
onready var shopkeeper = get_node("/root/Spatial/shopkeeper")
onready var shopkeeperCol = get_node("/root/Spatial/NPC/StaticBody")

onready var playerNode = get_node("/root/Spatial/Player")
onready var playerSpeed = playerNode.max_speed
onready var playerJSpeed = playerNode.jump_speed

onready var VPlayer = get_parent()
onready var CCLabel = get_parent().get_parent().get_node("CCLabel")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#print("Current max player speed is " + str(playerSpeed) + ". This will be temporarily set to 0.")
	setup()
	VPlayer.paused = true
	yield(get_tree().create_timer(0.5), "timeout")
#
	CCLabel.get_node("ColorRect").visible = true
	VPlayer.paused = false
	yield(get_tree().create_timer(0.05), "timeout")
	VPlayer.visible = true
	
	yield(get_tree().create_timer(0.2 - 0.05), "timeout")
	
	CCLabel.text = "Hello traveler!"
	yield(get_tree().create_timer(2), "timeout")
	
	CCLabel.text = "Welcome to my emporium of VERY exclusive and valuable items!"
	yield(get_tree().create_timer(7.4), "timeout")
	
	CCLabel.text = "How may I assist you today?"
	yield(get_tree().create_timer(3.7), "timeout")
	
	CCLabel.text = "Um..."
	yield(get_tree().create_timer(1 + 25/60), "timeout")
	
	CCLabel.text = "Um... you uh..."
	yield(get_tree().create_timer(1), "timeout")
	
	CCLabel.text = "Um... you uh... good, man?"
	yield(get_tree().create_timer(1 - 25/60), "timeout")
	
	CCLabel.text = "Um... you uh... good, man? Are you..."
	yield(get_tree().create_timer(1), "timeout")
	yield(get_tree().create_timer(0.2), "timeout")
	# Note to self when re-cationing this, 17.5 seconds have passed at this point.
	# I plan to re-caption this cutscene cus I did a bad job on this first half.
	# Rest should be fine.
	
	CCLabel.text = "Are you mute or something?"
	yield(get_tree().create_timer(3.475), "timeout")
#	yield(get_tree().create_timer(0.3), "timeout")
	
	CCLabel.text = "Oh! I see. Ha ha..."
	yield(get_tree().create_timer(2.845), "timeout")
	
	CCLabel.text = "You're eyeing up the arm behind the counter."
	yield(get_tree().create_timer(4.135), "timeout")
	
	CCLabel.text = "Well, it is very expensive."
	yield(get_tree().create_timer(5.1), "timeout")
	
	CCLabel.text = "Listen here... the price for that there arm is"
	yield(get_tree().create_timer(4.673 + 0.15), "timeout")
	
	CCLabel.text = "Listen here... the price for that there arm is\n3"
	yield(get_tree().create_timer(0.8), "timeout")
	
	CCLabel.text = "Listen here... the price for that there arm is\n38"
	yield(get_tree().create_timer(0.617), "timeout")
	
	CCLabel.text = "Listen here... the price for that there arm is\n382"
	yield(get_tree().create_timer(0.766), "timeout")
	
	CCLabel.text = "Listen here... the price for that there arm is\n3825"
	yield(get_tree().create_timer(0.7), "timeout")
	
	CCLabel.text = "Listen here... the price for that there arm is\n38251"
	yield(get_tree().create_timer(0.625), "timeout")
	
	CCLabel.text = "Listen here... the price for that there arm is\n382514"
	yield(get_tree().create_timer(0.78), "timeout")
	
	CCLabel.text = "Listen here... the price for that there arm is\n3825146"
	yield(get_tree().create_timer(0.85), "timeout")
	
	CCLabel.text = "Listen here... the price for that there arm is\n38251460"
	yield(get_tree().create_timer(0.87), "timeout")
	
	CCLabel.text = "Listen here... the price for that there arm is\n382514603"
	yield(get_tree().create_timer(0.55), "timeout")
	
	CCLabel.text = "Listen here... the price for that there arm is\n3825146037"
	yield(get_tree().create_timer(0.78), "timeout")
	
	CCLabel.text = "Listen here... the price for that there arm is\n38251460378"
	yield(get_tree().create_timer(0.74), "timeout")
	
	CCLabel.text = "Listen here... the price for that there arm is\n382514603783"
	yield(get_tree().create_timer(0.845), "timeout")
	
	CCLabel.text = "Listen here... the price for that there arm is\n3825146037831"
	yield(get_tree().create_timer(0.925), "timeout")
	
	CCLabel.text = "Listen here... the price for that there arm is\n38251460378311"
	yield(get_tree().create_timer(0.855 - 0.15), "timeout")
	
	CCLabel.text = "Listen here... the price for that there arm is\n38251460378311 MONEYS"
	yield(get_tree().create_timer(1.37), "timeout")
	
	CCLabel.text = "So..."
	yield(get_tree().create_timer(1.42), "timeout")
	
	CCLabel.text = "So... you got the money?"
	yield(get_tree().create_timer(1.69), "timeout")
	
	CCLabel.text = "Well, if ya don't..."
	yield(get_tree().create_timer(1.35), "timeout")
	
	CCLabel.text = "THEN WHY ARE YOU EVEN HERE?!"
	yield(get_tree().create_timer(3.237), "timeout")
#
#	CCLabel.text = ""
#	play("look up")
#	yield(get_tree().create_timer(0.453), "timeout")
#
#	CCLabel.text = "LAD! I'VE BEEN ROBBED! MUGGED!"
#	yield(get_tree().create_timer(0.609), "timeout")
#
#	play("bob")
#	yield(get_tree().create_timer(2.137), "timeout")
#	CCLabel.text = "They've stolen my limbs. FOR THE FUNNY!"
#	yield(get_tree().create_timer(3.298), "timeout")
#	CCLabel.text = "My precious appendages..."
#	yield(get_tree().create_timer(2.642), "timeout")
#
#	play("sad")
#	CCLabel.text = "I cannot chase after them. I need your help lad!"
#	yield(get_tree().create_timer(1.914+2.268), "timeout")
#
#	play("talk")
#	CCLabel.text = "Help me get my limbs back so I may return to my former glory as the best baker in this here hamlet!"
#	yield(get_tree().create_timer(4.484+3.06), "timeout")
#
#	CCLabel.text = "As a reward, I will grace you with my FINEST loaf of bread."
#	yield(get_tree().create_timer(5.05), "timeout")
#
#	play("bobAway")
#	CCLabel.text = "Come lad! Let us make haste!"
#	yield(get_tree().create_timer(2.504), "timeout")
	
	unSetup()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setup():
	playerNode.target_yaw_pitch = Vector2(-3.14,0)
#	playerNode.translation = Vector3(74, 14.5, 40.5)
	playerNode.translation.x = 74
	playerNode.translation.z = 40.5
	
	InteractRaycast.enabled = false
	shopkeeper.set_visible(false)
	playerNode.max_speed = 0
	playerNode.jump_speed = 0
	playerNode.jump_action = "nil_action"

func unSetup():
	get_node("/root/Spatial/Brick").translation = Vector3(74,14,28.5)
	
	shopkeeper.set_visible(true)
	
	InteractRaycast.enabled = true
	#limbless.set_visible(true)
#	shopkeeperCol.queue_free()
	shopkeeperCol.collision_layer = 0
	get_parent().get_parent().queue_free()
	playerNode.max_speed = playerSpeed
	playerNode.jump_speed = playerJSpeed
	playerNode.jump_action = "player_jump"
