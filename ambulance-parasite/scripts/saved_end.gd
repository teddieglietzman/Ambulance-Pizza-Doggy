extends Node2D

const ENDING_FRONTOFAMBO = preload("uid://bfda1ehnhdwre")

@onready var patient_saved: AudioStreamPlayer = $patient_saved
@onready var black_screen: ColorRect = $black_screen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	black_screen.show()
	patient_saved.play()
	black_screen.hide()
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("saved_patient")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	get_tree().change_scene_to_packed(ENDING_FRONTOFAMBO)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
