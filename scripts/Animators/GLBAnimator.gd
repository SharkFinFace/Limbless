extends Spatial

export (String) var nodePath
onready var Animator = get_node(nodePath + "/AnimationPlayer")
export (String) var animationName
export var loop = true
export var autoplay = true
export var play = false
var alreadyPlayed = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(Animator)
	if autoplay:
		Animator.play(animationName)
		if loop:
			Animator.connect("animation_finished", Animator, "play")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if play and !alreadyPlayed:
		alreadyPlayed = true
		autoplay = true
		_ready()
	pass
