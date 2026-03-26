extends CanvasLayer
@onready var current_score: RichTextLabel = %"Current Score"
@onready var previous_score: RichTextLabel = %"Previous Score"
@onready var high_score: RichTextLabel = %"High Score"

var default_text_current = "Current Score: "
var default_text_high = "High Score: "
var default_text_previous = "Previous Score: "

func _process(_delta: float) -> void:
	#Current Score
	var points = Global.current_score
	current_score.text = default_text_current + str(points)
	#High Score
	var high_score_points = Global.high_score
	high_score.text = default_text_high + str(high_score_points)
	#Previous Score
	var previous_points = Global.previous_score
	previous_score.text = default_text_previous + str(previous_points)
	
