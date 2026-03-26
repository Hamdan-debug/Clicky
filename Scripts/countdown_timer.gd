extends Node
class_name CountdownTimer
signal timeout
var duration = 60.0
var stopped = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stopped:
		return
	duration -= delta
	
# This part prevents negative numbers
	if duration <= 0:
		duration = 0
		stopped = true
		timeout.emit()
		
func reset():
	duration = 60.0
	
func time_to_string()-> String:
	#Time
	var msec = fmod(duration,1) * 1000
	var sec = fmod(duration, 60)
	var min= duration / 60
	#Time Formaating should look like 00:00:000
	var format_string = "%02d: %02d: %02d"
	var actual_string = format_string % [int(min), int(sec), int(msec)]
	return actual_string


func _on_timer_timeout() -> void:
	pass # Replace with function body.
