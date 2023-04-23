extends CharacterBody2D

var speed = 250
var idle = 0

@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")

func _physics_process(_delta):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	if Input.is_action_pressed("Sprint"):
		speed = 300
	else: speed = 250
	if direction:
		velocity = direction * speed
		animationTree.set("parameters/Idle/blend_position", velocity)
		animationTree.set("parameters/Walk/blend_position", velocity)
		animationState.travel("Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
		animationState.travel("Idle")
	move_and_slide()
	
	
		
		
	
