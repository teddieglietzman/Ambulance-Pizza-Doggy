extends Node2D
const FRONTOFAMBO = preload("uid://dn3ld6bbonuau")

@onready var radio: AudioStreamPlayer = $radio

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(FRONTOFAMBO)









func _on_quit_pressed() -> void:
	get_tree().quit()




func _on_radio_finished() -> void:
	radio.play()
