class_name Interact extends Area2D

@onready var interaction_range: Area2D = find_child("InteractionRange")

signal interact

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		closest_area()
	if closest_area() != null:
		interact.emit(closest_area())
		
func closest_area():
# Checks for overlapping interactables. Continues if one is found
	if has_overlapping_areas() == false:
		return null
# Defines variables
	var overlapping_areas = get_overlapping_areas()
	var closest_interaction
# Finds closest interactable and returns result
	for interaction in overlapping_areas:
		if owner.position.distance_to(interaction.position):
			closest_interaction = interaction
	return closest_interaction

