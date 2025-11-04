extends Node2D
@onready var patient_infected: AudioStreamPlayer = $patient_infected

@onready var ambo_sound: AudioStreamPlayer = $ambo_sound
@onready var radio: AudioStreamPlayer = $radio
@onready var radio_off: AudioStreamPlayer = $radio_off
@onready var garbled_radio: AudioStreamPlayer = $garbled_radio
@onready var arrival_audio: AudioStreamPlayer = $arrival_audio
@onready var bg_void: AudioStreamPlayer = $bg_void
@onready var parasite_response: AudioStreamPlayer = $parasite_response


@onready var black_screen: ColorRect = $black_screen
const GIRL_1 = preload("uid://cn5u13enjln3e")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.signal_event.connect(_on_dialogic_signal)

	Dialogic.start("parasite_talk")
	

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	radio_off.play()
	black_screen.show()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_radio_finished() -> void:
	radio.play(randf_range(0.0, 51.0))




func _on_radio_off_finished() -> void:
	
	radio.stop()
	patient_infected.stop()
	await get_tree().create_timer(1.0).timeout
	ambo_sound.play(0.50)
	
	
func _on_dialogic_signal(argument:String):
	if argument == "pulse":
		garbled_radio.play()
	if argument == "talking":
		patient_infected.play()
	if argument == "responding":
		parasite_response.play()
	


func _on_ambo_sound_finished() -> void:
	arrival_audio.play()




func _on_arrival_audio_finished() -> void:
	get_tree().change_scene_to_packed(GIRL_1)


func _on_patient_infected_finished() -> void:
	pass




func _on_bg_void_finished() -> void:
	bg_void.play()
