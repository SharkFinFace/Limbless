extends AnimationPlayer

onready var InteractRaycast = get_node("/root/Spatial/Player/Camera/InteractRayCast")
onready var tuber = get_node("/root/Spatial/Tuber3")
onready var tuberCol = get_node("/root/Spatial/NPC2")

onready var playerNode = get_node("/root/Spatial/Player")
onready var playerSpeed = playerNode.max_speed
onready var playerJSpeed = playerNode.jump_speed

onready var AudioPlayer = get_parent().get_parent().get_node("AudioStreamPlayer")
#onready var Huh = get_parent().get_parent().get_node("Huh?")
onready var CCLabel = get_parent().get_parent().get_node("CCLabel")
onready var RecAnim = get_parent().get_parent().get_node("Rec/AnimationPlayer")
onready var RecAud = get_parent().get_parent().get_node("RecAud")
onready var CollectAud = get_parent().get_parent().get_node("Collect")
#onready var WhipAud = get_parent().get_parent().get_node("Whip")

onready var Barrier = get_node("/root/Spatial/UCantGoFurther2")
#onready var Instructions = get_node("/root/Spatial/Instructions")
#onready var MazeGreen = get_node("/root/Spatial/MazeGreenscreen")
#onready var MazeREAL = get_node("/root/Spatial/Maze")

#onready var Door = get_node("/root/Spatial/Door/StaticBody")

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
	CCLabel.text = "THEY DID IT! THEY DID IT! They won the dillion bollar-!"
	RecAnim.play("play")
	play("woag")
	yield(get_tree().create_timer(3.72), "timeout")
	
	CCLabel.text = "*sigh*"
	play("mike")
	yield(get_tree().create_timer(0.653), "timeout")
	
	CCLabel.text = "-billion dollars!"
	play("woag")
	yield(get_tree().create_timer(1.714), "timeout")
	
	CCLabel.text = "We'll edit that slip up out."
	play("angy")
	yield(get_tree().create_timer(2.542), "timeout")
	
	CCLabel.text = "Thank you guys for watching! Make sure to like, comment, subscribe, share, and don't forget to click the Rain Meadow Legends link to get free stuff."
	play("pyro")
	yield(get_tree().create_timer(8.513), "timeout")
	
	CCLabel.text = ""
	RecAnim.play("off")
	RecAud.play()
	play("pyroShut")
	yield(get_tree().create_timer(0.896), "timeout")
	
	CCLabel.text = "Alright buddy what'd you want again? Oh yeah, the leg."
	play("pyro")
	yield(get_tree().create_timer(3.389), "timeout")
	
	CCLabel.text = "Here you go."
	play("neminem")
	yield(get_tree().create_timer(1.032), "timeout")
	
	CCLabel.text = "*gives*"
	CollectAud.play()
	yield(get_tree().create_timer(0.662), "timeout")
	
	CCLabel.text = "Now, don't go tellin anyone about you not getting paid."
	play("pyro")
	yield(get_tree().create_timer(3.511), "timeout")
	
	CCLabel.text = "If I get canceled because of you, I'll cancel you."
#	play("pyro")
	yield(get_tree().create_timer(2.937), "timeout")
	
	unSetup()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setup():
	InteractRaycast.enabled = false
	tuber.set_visible(false)
	playerNode.max_speed = 0
	playerNode.jump_speed = 0
	playerNode.jump_action = "nil_action"

func unSetup():
#	MazeGreen.translation.y = -10
#	MazeREAL.translation.y = 0
	
	InteractRaycast.enabled = true
	tuber.set_visible(true)
#	tuber.queue_free()
	tuberCol.queue_free()
	Barrier.queue_free()
#	Instructions.set_visible(true)
	get_parent().get_parent().queue_free()
	playerNode.max_speed = playerSpeed
	playerNode.jump_speed = playerJSpeed
	playerNode.jump_action = "player_jump"
#	Door.collision_layer = 2
	SettingVariables.can_pause = true
