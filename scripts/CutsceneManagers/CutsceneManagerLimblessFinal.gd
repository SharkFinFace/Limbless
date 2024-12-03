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

onready var Generics = get_node("/root/Spatial/Generics")

onready var Rise = get_parent().get_parent().get_node("Rise")

onready var Bread = get_parent().get_parent().get_node("TextureRect2/AnimationPlayer")

onready var blackout = get_parent().get_parent().get_node("ColorRect")

#onready var Door = get_node("/root/Spatial/Door/StaticBody")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#print("Current max player speed is " + str(playerSpeed) + ". This will be temporarily set to 0.")
	setup()
#	yield(get_tree().create_timer(2), "timeout")
	generics.visible = false
	limbless.visible = false
	yield(get_tree().create_timer(0.5), "timeout")

	CCLabel.get_node("ColorRect").visible = true
	AudioPlayer.playing = true
	CCLabel.text = "Where've you been, man?\nI been waitin' here for like a gurry!"
	play("talk")
	yield(get_tree().create_timer(4.579), "timeout")
	
	CCLabel.text = ":O"
	play("pogogg")
	yield(get_tree().create_timer(1.026), "timeout")
	
	CCLabel.text = "Woaw!"
	play("woaw")
	yield(get_tree().create_timer(1.08), "timeout")
	
	CCLabel.text = "Woaw!\nThe last limbs!"
	play("lastLimbs")
	yield(get_tree().create_timer(1.877), "timeout")
	
	CCLabel.text = "Thank you kind lad! As promised, I bless you with the FINEST loaf of bread in ALL the land!!"
	play("talkFinal")
	yield(get_tree().create_timer(7.266 - 4.733), "timeout")
	
	play("talkBread")
	yield(get_tree().create_timer(4.733), "timeout")
	
	Bread.play("bread")
	play("bread")
	Rise.play()
	yield(get_tree().create_timer(4.25), "timeout")
	blackout.visible = true
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://scenes/credits.tscn")
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
	
	Generics.visible = false

func unSetup():
	InteractRaycast.enabled = true
	#limbless.set_visible(true)
#	limblessCol.queue_free()
	playerNode.max_speed = playerSpeed
#	playerNode.jump_speed = playerJSpeed
#	playerNode.jump_action = "player_jump"
#	Door.collision_layer = 2
	get_parent().get_parent().visible = false
	yield(get_tree().create_timer(0.5), "timeout")
	bmasSit.play()
	yield(get_tree().create_timer(0.05), "timeout")
	get_parent().get_parent().queue_free()
