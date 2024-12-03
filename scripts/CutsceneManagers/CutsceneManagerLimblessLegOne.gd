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
