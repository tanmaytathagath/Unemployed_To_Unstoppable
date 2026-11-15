
extends Node2D

const DIALOGUE = preload("res://grek.dialogue")
const BALLOON = preload("res://balloon.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(1, 6):
		DialogueManager.show_dialogue_balloon_scene(BALLOON, DIALOGUE, "Grek_Intro_%d" % i)
		await DialogueManager.dialogue_ended
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
	
	
