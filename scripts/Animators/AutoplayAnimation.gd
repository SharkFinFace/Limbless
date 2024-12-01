extends AnimationPlayer


export (String) var animationName
export var changesPauseStatus = false
export (bool) var can_pause

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if changesPauseStatus == true:
		self.connect("animation_finished", self, "_on_AnimationPlayer_animation_finished")
	play(animationName)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if changesPauseStatus:
		SettingVariables.can_pause = can_pause
		print("can_pause now " + str(SettingVariables.can_pause))
	pass # Replace with function body.
