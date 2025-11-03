extends Node2D

@onready var ambo_sound: AudioStreamPlayer = $ambo_sound
@onready var radio: AudioStreamPlayer = $radio
@onready var radio_off: AudioStreamPlayer = $radio_off
@onready var black_screen: ColorRect = $black_screen
const GIRL_1 = preload("uid://cn5u13enjln3e")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("parasite_talk")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	radio_off.play()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_radio_finished() -> void:
	radio.play()




func _on_radio_off_finished() -> void:
	ambo_sound.play()
	black_screen.show()
	

	


func _on_ambo_sound_finished() -> void:
	get_tree().change_scene_to_packed(GIRL_1)
