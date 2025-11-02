extends Node3D

const CPR_MINIGAME = preload("uid://bfglvthi078c4")
const INFECTION_BAR = preload("uid://bjvx0qivlv2wn")
const INSIDE_AMBULANCE = preload("uid://y1wkxl6apcck")
const FRONTOFAMBO = preload("uid://dn3ld6bbonuau")

@onready var ui_holder: CanvasLayer = $ui_holder

@onready var cpr_node: Node2D = %cpr_node
@onready var infection_node: Node2D = %infection_node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var cpr = CPR_MINIGAME.instantiate()
	ui_holder.add_child(cpr)
	cpr.scale = Vector2(2.5,2.5)
	cpr.position = cpr_node.position
	var infection_bar = INFECTION_BAR.instantiate()
	ui_holder.add_child(infection_bar)
	infection_bar.scale = Vector2(2.5,2.5)
	infection_bar.position = infection_node.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
