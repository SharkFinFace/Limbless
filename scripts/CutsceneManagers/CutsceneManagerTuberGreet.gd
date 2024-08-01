extends AnimationPlayer

onready var InteractRaycast = get_node("/root/Spatial/Player/Camera/InteractRayCast")
onready var tuber = get_node("/root/Spatial/Tuber")
onready var tuberCol = get_node("/root/Spatial/NPC")

onready var playerNode = get_node("/root/Spatial/Player")
onready var playerSpeed = playerNode.max_speed
onready var playerJSpeed = playerNode.jump_speed

onready var AudioPlayer = get_parent().get_parent().get_node("AudioStreamPlayer")
onready var Huh = get_parent().get_parent().get_node("Huh?")
onready var CCLabel = get_parent().get_parent().get_node("CCLabel")
onready var RecAnim = get_parent().get_parent().get_node("Rec/AnimationPlayer")
onready var RecAud = get_parent().get_parent().get_node("RecAud")
onready var WhipAud = get_parent().get_parent().get_node("Whip")

onready var Barrier = get_node("/root/Spatial/UCantGoFurther")
onready var Instructions = get_node("/root/Spatial/Instructions")
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
	CCLabel.text = ""
	play("approach")
	yield(get_tree().create_timer(6.6), "timeout")
	AudioPlayer.playing = true
	
	CCLabel.text = "So guys, we did it! We reached a quarter of a subscrib-"
	play("pyro")
	yield(get_tree().create_timer(4.08), "timeout")
	
	CCLabel.text = "Wha?"
	Huh.play()
	play("bog")
	yield(get_tree().create_timer(1.384), "timeout")

	CCLabel.text = "Yo yo! It's a fan! You wanna be in my next video, dontcha?"
	play("woag")
	yield(get_tree().create_timer(4.423), "timeout")

	CCLabel.text = "Ugh, stop bein so pushy and I'll consider it."
	play("angy")
	yield(get_tree().create_timer(3.422), "timeout")

	CCLabel.text = "Alright FINE. You've forced my hand."
	play("point")
	yield(get_tree().create_timer(3.04), "timeout")

	CCLabel.text = "I'll let you participate in my billion dollar challenge!"
	play("pyro")
	yield(get_tree().create_timer(3.556), "timeout")

	CCLabel.text = "If you can get through this maze before time runs out, you win the billion!"
#	play("pyro")
	yield(get_tree().create_timer(4.15), "timeout")

	CCLabel.text = "Well, I mean like..."
	play("bog")
	yield(get_tree().create_timer(1.26), "timeout")

	CCLabel.text = "I'll say a billion dollars, but like..."
	play("pyro")
	yield(get_tree().create_timer(2.543), "timeout")

	CCLabel.text = "I'll say a billion dollars, but like...\nI won't actually give you anything, ya know?"
#	play("pyro")
	yield(get_tree().create_timer(2.365), "timeout")

	CCLabel.text = "Wh- man you're greedy. You want this leg too?"
	play("angyLeg")
	yield(get_tree().create_timer(4.486), "timeout")

	CCLabel.text = "Bruh. Okay I guess."
	play("mike")
	yield(get_tree().create_timer(1.217), "timeout") # Time of bruh
	play("pyro")
	yield(get_tree().create_timer(2.61 - 1.217), "timeout")

	CCLabel.text = ""
	play("pyroShut")
	RecAnim.play("play")
	RecAud.play()
	yield(get_tree().create_timer(3.731 - 2.61), "timeout")

	CCLabel.text = "I MADE A GIANT DEATH MAZE, AND THE FIRST ONE TO MAKE IT THROUGH A BILLION DOLLARS! HERE'S OUR FIRST CONTESTANT!"
	play("pyro")
	yield(get_tree().create_timer(7.007 + 0.25 - 1 - 0.25 - 0.5), "timeout") # I genuinely have no explaination for all this stupid math.

	CCLabel.text = "Why don't you say a little about yourself?"
	play("pyro")
	yield(get_tree().create_timer(1 + 0.25 + 0.25 + 0.5), "timeout") # I genuinely have no explaination for all this stupid math.

	WhipAud.play()
	CCLabel.text = ""
	play("micUp")
	yield(get_tree().create_timer(2.29 - 0.25 - 0.25), "timeout") # I genuinely have no explaination for all this stupid math.

	CCLabel.text = "Heheh, yeah. Good luck."
	play("pyro")
	yield(get_tree().create_timer(2.732), "timeout")

	RecAnim.play("off")
	RecAud.play()
	CCLabel.text = ""
	play("pyroShut") 
	yield(get_tree().create_timer(1), "timeout")

	CCLabel.text = "Jeez, you sure do talk a lot."
	play("angy") 
	yield(get_tree().create_timer(1.716 + 0.75), "timeout")
	
#	CCLabel.text = ""
#	play("look up")
#	yield(get_tree().create_timer(0.453), "timeout")

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
#	CCLabel.text = "As reward, I will grace you with my FINEST loaf of bread."
#	yield(get_tree().create_timer(5.05), "timeout")
#
#	play("bobAway")
#	CCLabel.text = "Come lad! Let us make haste!"
#	yield(get_tree().create_timer(20.504), "timeout")
#
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
#	tuber.set_visible(true)
	tuber.queue_free()
	tuberCol.queue_free()
	Barrier.queue_free()
	Instructions.set_visible(true)
	get_parent().get_parent().queue_free()
	playerNode.max_speed = playerSpeed
	playerNode.jump_speed = playerJSpeed
	playerNode.jump_action = "player_jump"
#	Door.collision_layer = 2
