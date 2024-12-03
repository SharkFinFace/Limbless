extends AnimationPlayer

onready var InteractRaycast = get_node("/root/Spatial/Player/Camera/InteractRayCast")
onready var criminal = get_parent().get_parent().get_node("criminal")
#onready var limblessCol = get_node("/root/Spatial/NPC")

onready var playerNode = get_node("/root/Spatial/Player")
onready var playerSpeed = playerNode.max_speed
onready var playerJSpeed = playerNode.jump_speed

#onready var AudioPlayer = get_parent().get_parent().get_node("AudioStreamPlayer")
onready var CCLabel = get_parent().get_parent().get_node("CCLabel")

onready var Door = get_node("/root/Spatial/Door/StaticBody")
onready var scriptNode = get_node("/root/Spatial/Node")

onready var runnerAudio = get_parent().get_parent().get_node("runner")
onready var limblessAudio = get_parent().get_parent().get_node("limbless")
onready var criminalAudio = get_parent().get_parent().get_node("nevercatchme")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	preload("res://antdueler/antdueler.tscn")
	#print("Current max player speed is " + str(playerSpeed) + ". This will be temporarily set to 0.")
	setup()
	yield(get_tree().create_timer(0.5), "timeout")
	
	criminal.visible = true
	play("run")
	runnerAudio.playing = true
	yield(get_tree().create_timer(0.5), "timeout")
	play("idle")
	runnerAudio.playing = false
	yield(get_tree().create_timer(1), "timeout")

	CCLabel.get_node("ColorRect").visible = true
	play("yellin")
	limblessAudio.playing = true
	CCLabel.text = "THERE! THERES ONE OF THEM! HEY! GIMMIE BACK MY LIMBS!"
	
	yield(get_tree().create_timer(5.5), "timeout")
	play("unyell")
	yield(get_tree().create_timer(0.01), "timeout")
	play("talker")
	criminalAudio.playing = true
	CCLabel.text = "YOU'LL NEVER CATCH ME ALIVE!"
	
	yield(get_tree().create_timer(2.75), "timeout")
	get_tree().change_scene("res://antdueler/antdueler.tscn")
	
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
	get_parent().get_parent().queue_free()
	playerNode.max_speed = playerSpeed
	playerNode.jump_speed = playerJSpeed
	playerNode.jump_action = "player_jump"
#	Door.collision_layer = 2
	scriptNode.queue_free()
