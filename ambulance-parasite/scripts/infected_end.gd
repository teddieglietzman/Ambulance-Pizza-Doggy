extends Node

const ENDING_FRONTOFAMBO = preload("uid://bfda1ehnhdwre")

@onready var black_screen: ColorRect = $black_screen
@onready var patient_infected: AudioStreamPlayer = $patient_infected
@onready var parasite_boom: AudioStreamPlayer = $parasite_boom

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	patient_infected.play()
	black_screen.hide()
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("infected_patient")
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	get_tree().change_scene_to_packed(ENDING_FRONTOFAMBO)

func _on_dialogic_signal(argument:String):
	if argument == "talk":
		parasite_boom.play()
		await get_tree().create_timer(2).timeout
		black_screen.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
