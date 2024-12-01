extends AnimationPlayer

onready var InteractRaycast = get_node("/root/Spatial/Player/Camera/InteractRayCast")
onready var limbless = get_node("/root/Spatial/limbless")
#onready var limblessCol = get_node("/root/Spatial/NPC")
onready var generics = get_node("/root/Spatial/Generics")

onready var playerNode = get_node("/root/Spatial/Player")
onready var playerSpeed = 7
#onready var playerJSpeed = playerNode.jump_speed

onready var AudioPlayer = get_parent().get_parent().get_node("AudioStreamPlayer")
onready var bmasSit = get_node("/root/Spatial/sit")
onready var CCLabel = get_parent().get_parent().get_node("CCLabel")
onready var Paper = get_parent().get_parent().get_node("Paper")

#onready var Door = get_node("/root/Spatial/Door/StaticBody")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#print("Current max player speed is " + str(playerSpeed) + ". This will be temporarily set to 0.")
	setup()
	yield(get_tree().create_timer(2), "timeout")
	generics.visible = false
	limbless.visible = false
	yield(get_tree().create_timer(0.5), "timeout")

	CCLabel.get_node("ColorRect").visible = true
	AudioPlayer.playing = true
	CCLabel.text = "HOH!"
	play("pog")
	yield(get_tree().create_timer(0.526), "timeout")
	
	play("yipee")
	CCLabel.text = "YIPEE!"
	yield(get_tree().create_timer(1.251), "timeout")
#	yield(get_tree().create_timer(1), "timeout")
	
	play("talk")
	CCLabel.text = "My leg! We've found half of my limbs!"
	yield(get_tree().create_timer(4.326), "timeout")
	
	play("talkLookDown")
	Paper.visible = true
	CCLabel.text = "Now... where'd that criminal scum say he put the next one?"
	yield(get_tree().create_timer(4.467), "timeout")
	
	play("talk")
	CCLabel.text = "Ah yes. The mall! I bought a toothbrush from there once..."
	yield(get_tree().create_timer(4.910), "timeout")
	yield(get_tree().create_timer(0.5), "timeout")

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
	
	generics.visible = true
	limbless.visible = true
	
	unSetup()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setup():
	InteractRaycast.enabled = false
#	limbless.set_visible(false)
	playerNode.max_speed = 0
	playerNode.jump_speed = 0
	playerNode.jump_action = "nil_action"

func unSetup():
	InteractRaycast.enabled = true
	#limbless.set_visible(true)
#	limblessCol.queue_free()
	playerNode.max_speed = playerSpeed
#	playerNode.jump_speed = playerJSpeed
#	playerNode.jump_action = "player_jump"
#	Door.collision_layer = 2
	SettingVariables.can_pause = true
	get_parent().get_parent().visible = false
	yield(get_tree().create_timer(0.5), "timeout")
	bmasSit.play()
	yield(get_tree().create_timer(0.05), "timeout")
	get_parent().get_parent().queue_free()
