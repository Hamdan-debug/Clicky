extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.current_score = 0

func update_score():
	if Global.current_score > Global.high_score:
		Global.high_score = Global.current_score
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_score()


func _on_texture_button_pressed() -> void:
	print("Clicked")
	Global.current_score += 1


func _on_retry_pressed() -> void:
	Global.previous_score = Global.current_score
	
	Global.current_score = 0 # Replace with function body.
