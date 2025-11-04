extends Node2D
const START_MENU = preload("uid://sg1rrakciwm1")

@onready var piano_theme: AudioStreamPlayer = $piano_theme

@onready var radio: AudioStreamPlayer = $radio
@onready var radio_off: AudioStreamPlayer = $radio_off

@onready var black_screen: ColorRect = $black_screen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	radio.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
	


func _on_radio_finished() -> void:
	radio.play(randf_range(0.0, 50.0))


func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(START_MENU)
