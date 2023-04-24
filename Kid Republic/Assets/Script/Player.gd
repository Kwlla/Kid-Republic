extends CharacterBody2D

# Some variables
var speed = 250
var idle = 0

# Allows use of multiple tools neccesary to animate our player sprite
@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")

func _physics_process(_delta):
	# Gets input values to later use for movement. This also enables sprinting.
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	if Input.is_action_pressed("Sprint"):
		speed = 300
	else: speed = 250
	# Grabs our input values and transforms them into movement. This also runs our player animations.
	if direction:
		velocity = direction * speed
		animationTree.set("parameters/Idle/blend_position", velocity)
		animationTree.set("parameters/Walk/blend_position", velocity)
		animationState.travel("Walk")
	# Stops movement when keys are no longer being pressed. Also starts our "Idle" animation.
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
		animationState.travel("Idle")
	move_and_slide() # Does movement.
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		$PauseMenu.pause()
		print("esc pressed")
	
	
		
		
	
