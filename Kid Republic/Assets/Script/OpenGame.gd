extends Node

# Starts the game when the "Play Game" button is pressed.
func _on_play_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")

# Opens the options menu when the "Options" button is pressed.
func _on_options_pressed():
	pass
