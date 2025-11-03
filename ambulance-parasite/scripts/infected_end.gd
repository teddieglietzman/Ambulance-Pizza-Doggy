extends Node

const FRONTOFAMBO = preload("uid://dn3ld6bbonuau")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("infected_patient")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
