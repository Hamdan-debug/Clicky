extends Node

@onready var countdown_timer: CountdownTimer = $CountdownTimer

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void:
	countdown_timer.timeout.connect(_on_timer_finished)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	if countdown_timer and not countdown_timer.stopped:
		Global.current_score += 1
	else:
		$TextureButton.disabled = true 
		print("Time up.Stop clicking")
		
		
func _on_timer_finished() -> void:
	# 1. Update the high score first
	audio_stream_player.autoplay = false
	update_score()
	
	# 2. Make the game wait for 2 seconds
	await get_tree().create_timer(2.0).timeout
	
	# 3. Finally change the scene
	get_tree().change_scene_to_file("res://Scenes/animations.tscn")
	
func update_score():
	if Global.current_score > Global.high_score:
		Global.high_score = Global.current_score

		
