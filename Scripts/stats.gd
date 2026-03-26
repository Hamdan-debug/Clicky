extends Label 

func _ready() -> void:
	self.text = "Amount of Lumens:0" 
	Simulator.score_changed.connect(_on_simulator_score_changed)

func _on_simulator_score_changed(amount) -> void:
	self.text = "Amount of Lumens : " + str(amount)
