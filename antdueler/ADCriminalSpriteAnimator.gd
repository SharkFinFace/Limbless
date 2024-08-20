extends AnimationPlayer


onready var AttackGraphic = get_node("/root/Control/Attack")
onready var scorekeeper = get_node("/root/Control")

onready var successSound = get_node("/root/Control/success")
onready var notSuccessSound = get_node("/root/Control/wompwomp")
onready var hint = get_node("/root/Control/Hint")
#onready var successSound = get_node("/root/Control/success")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	play("idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if AttackGraphic.hit == "true":
		AttackGraphic.hit = "null"
		print("sucess")
		if get_node_or_null("/root/Control/Hint") != null:
			hint.queue_free()
		scorekeeper.healthEnemy -= 1
		successSound.play()
		play("owie")
		yield(get_tree().create_timer(1), "timeout")
		play("idle")
		AttackGraphic.resume()
	elif AttackGraphic.hit == "false":
		AttackGraphic.hit = "null"
		print("u messed up")
		scorekeeper.healthPlayer -= 1
		yield(get_tree().create_timer(1), "timeout")
		notSuccessSound.play()
		play("attack")
		yield(get_tree().create_timer(1), "timeout")
		if scorekeeper.healthPlayer > 0:
			play("idle")
		AttackGraphic.resume()
		pass
