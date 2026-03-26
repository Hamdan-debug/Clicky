extends Node

@onready var click_button: TextureButton = $ClickButton

func _ready() -> void:
	click_button.pivot_offset = click_button.size / 2
	
	
func _on_coin_button_down() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(click_button, "scale", Vector2(.9, .9), .1)


func _on_coin_button_up() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(click_button, "scale", Vector2(1, 1), .1)
