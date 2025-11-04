extends Node

const FRONTOFAMBO = preload("uid://dn3ld6bbonuau")
@onready var black_screen: ColorRect = $black_screen
@onready var patient_infected: AudioStreamPlayer = $patient_infected

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	black_screen.show()
	patient_infected.play()
	black_screen.hide()
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("infected_patient")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	get_tree().change_scene_to_packed(FRONTOFAMBO)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
