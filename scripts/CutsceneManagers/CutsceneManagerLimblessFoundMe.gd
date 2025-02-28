extends AnimationPlayer

onready var InteractRaycast = get_node("/root/Spatial/Player/Camera/InteractRayCast")
onready var limbless = get_node("/root/Spatial/limbless")
onready var limblessCol = get_node("/root/Spatial/NPC")

onready var playerNode = get_node("/root/Spatial/Player")
onready var playerSpeed = playerNode.max_speed
onready var playerJSpeed = playerNode.jump_speed

onready var AudioPlayer = get_parent().get_parent().get_node("AudioStreamPlayer")
onready var CCLabel = get_parent().get_parent().get_node("CCLabel")

onready var Door = get_node("/root/Spatial/Door/StaticBody")

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
	CCLabel.text = "Lad..."
	play("shakey")
	yield(get_tree().create_timer(1), "timeout")

	CCLabel.text = ""
	play("look up")
	yield(get_tree().create_timer(0.453), "timeout")

	CCLabel.text = "LAD! I'VE BEEN ROBBED! MUGGED!"
	yield(get_tree().create_timer(0.609), "timeout")

	play("bob")
	yield(get_tree().create_timer(2.137), "timeout")
	CCLabel.text = "They've stolen my limbs. FOR THE FUNNY!"
	yield(get_tree().create_timer(3.298), "timeout")
	CCLabel.text = "My precious appendages..."
	yield(get_tree().create_timer(2.642), "timeout")

	play("sad")
	CCLabel.text = "I cannot chase after them. I need your help lad!"
	yield(get_tree().create_timer(1.914+2.268), "timeout")

	play("talk")
	CCLabel.text = "Help me get my limbs back so I may return to my former glory as the best baker in this here hamlet!"
	yield(get_tree().create_timer(4.484+3.06), "timeout")

	CCLabel.text = "As reward, I will grace you with my FINEST loaf of bread."
	yield(get_tree().create_timer(5.05), "timeout")

	play("bobAway")
	CCLabel.text = "Come lad! Let us make haste!"
	yield(get_tree().create_timer(2.504), "timeout")
#
	unSetup()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setup():
	InteractRaycast.enabled = false
	limbless.set_visible(false)
	playerNode.max_speed = 0
	playerNode.jump_speed = 0
	playerNode.jump_action = "nil_action"

func unSetup():
	InteractRaycast.enabled = true
	#limbless.set_visible(true)
	limblessCol.queue_free()
	get_parent().get_parent().queue_free()
	playerNode.max_speed = playerSpeed
	playerNode.jump_speed = playerJSpeed
	playerNode.jump_action = "player_jump"
	Door.collision_layer = 2
	SettingVariables.can_pause = true
