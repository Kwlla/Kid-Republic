extends ColorRect

@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var play: Button = find_child("Resume")
@onready var options: Button = find_child("Options")
@onready var quit: Button = find_child("Quit")

func _ready() -> void:
	play.pressed.connect(unpause)
	quit.pressed.connect(get_tree().quit)
	print("control accessed")

func unpause():
	animator.play("Unpause")
	get_tree().paused = false
	print("unpaused")
	
func pause():
	animator.play("Pause")
	get_tree().paused = true
	print("paused")
