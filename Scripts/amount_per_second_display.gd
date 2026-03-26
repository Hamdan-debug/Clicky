extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = "Amount of Lumens per second: "
	Simulator.amount_per_second_changed.connect(_on_simulator_amount_per_second_changed)


func _on_simulator_amount_per_second_changed(amount) -> void:
	self.text = "Amount of Lumens per second : " +str(amount) 
