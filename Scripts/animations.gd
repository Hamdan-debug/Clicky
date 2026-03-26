extends Node
@onready var score: Label = $"ScoreDisplay and functions/Score"



var default_text_current = "Current Score: "
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var points = Global.current_score
	score.text = default_text_current + str(points)
	


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/timedmode.tscn")
