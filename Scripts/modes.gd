extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_casual_mode_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/clicker.tscn")


func _on_timed_mode_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/timedmode.tscn")


func _on_simulator_mode_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/simulator.tscn")
