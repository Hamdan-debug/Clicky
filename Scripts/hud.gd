extends Control

# Use the direct path because CountdownTimer is right there in your scene tree
@onready var time_label: Label = $CountdownTimerLabel

@onready var timer: CountdownTimer = $"../CountdownTimer"


func _process(_delta: float) -> void:
	if timer:
		update_timer_label()

func update_timer_label():
	time_label.text = timer.time_to_string()
