extends Node2D

const save_path = "user://userdata.save"

var amount_per_second = 0
var score = 0
var amount_per_click = 1
#Mallet
var mallet_owned = false
var mallet_multiplier = 0.10


#Buttons 
@onready var mallet: TextureButton = $"Upgrade Menu/Mallet"
@onready var firefly: TextureButton = $"Upgrade Menu/Firefly"
@onready var lumen_anvil: TextureButton = $"Upgrade Menu/LumenAnvil"
# Tracks time passed for the passive income logic
var timer = 0.0

signal score_changed
signal amount_per_second_changed

func _ready() -> void:
	load_data()
	# Update UI immediately on startup
	emit_signal("score_changed", score)

func _process(delta: float) -> void:
	timer += delta
	if timer >= 1.0:
		score += amount_per_second 
		emit_signal("score_changed", score)
		save_data()
		timer -= 1.0

func save_data():
	var data = {
		"score": score,
		"amount_per_second": amount_per_second,
		"amount_per_click": amount_per_click,
		"mallet_owned": mallet_owned # Added this to save file
	}
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	if file:
		file.store_var(data)
		file.close()

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		if file:
			var data = file.get_var()
			file.close()
			if typeof(data) == TYPE_DICTIONARY:
				score = data.get("score", 0)
				amount_per_second = data.get("amount_per_second", 0)
				amount_per_click = data.get("amount_per_click", 1)
				mallet_owned = data.get("mallet_owned", false) # Load mallet state
	else:
		save_data()

func _on_coin_pressed() -> void:
	if mallet_owned:
		var bonus = (amount_per_second * mallet_multiplier)
		amount_per_click += bonus
		
	score += amount_per_click
	emit_signal("score_changed", score)
	save_data()

func _on_firefly_pressed() -> void:
	if score >= 10: # Added a check so players can't go into negative debt!
		print("Bought Firefly")
		score -= 10
		amount_per_click += 1
		emit_signal("score_changed", score)
		save_data() # Save immediately after a purchase
	else:
		print("Not enough score!")


func _on_lumen_anvil_pressed() -> void:
	if score >= 100:
		print("Bought Lumen Anvil")
		score -= 100
		amount_per_second += 1
		emit_signal("score_changed", score)
		emit_signal("amount_per_second_changed", amount_per_second)
		save_data()
	else:
		print("Not Enough")


func _on_mallet_pressed() -> void:
	if score >= 1000 and mallet_owned == false:
		score -= 1000
		mallet_owned = true
		emit_signal("score_changed",score)
		save_data()
	else:
		print("Mallet Owned.Can buy only once")


func _on_mallet_button_down() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(mallet, "scale", Vector2(.9, .9), .1)


func _on_mallet_button_up() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(mallet, "scale", Vector2(1, 1), .1)


func _on_lumen_anvil_button_down() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(lumen_anvil, "scale", Vector2(.9, .9), .1)


func _on_lumen_anvil_button_up() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(lumen_anvil, "scale", Vector2(1, 1), .1)


func _on_firefly_button_up() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(firefly, "scale", Vector2(1, 1), .1)


func _on_firefly_button_down() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(firefly, "scale", Vector2(.9, .9), .1)
