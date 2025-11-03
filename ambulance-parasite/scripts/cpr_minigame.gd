extends Node2D

const DEAD_PATIENT = preload("uid://dvbwvgt47omii")
const INFECTED_PATIENT = preload("uid://b0x72lmin5ddc")
const SAVED_PATIENT = preload("uid://b5g1g2pil4yuo")



@onready var health_bar: TextureProgressBar = $health_bar

@onready var health_timer: Timer = $health_timer



@onready var marker_line: Sprite2D = %MarkerLine
@onready var green_zone: Sprite2D = %GreenZone
@onready var debug_label: Label = $debug_label

@onready var infection_animation: AnimatedSprite2D = %infection_animation
@onready var heartbeat_audio: AudioStreamPlayer = $heartbeat_audio

var marker_speed = 30
var marker_range_array = [-54, 54]
var direction = 1



var infection_points = 0
var health_points = 0
var green = false
var green_points = 0

var marker_y : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	heartbeat_audio.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

	
func _physics_process(delta: float) -> void:
	update_health()
	marker_line.position.x += direction * marker_speed * delta
	if green and Input.is_action_pressed("Interact"):
		green_zone.position.x = randf_range(-54, 54)
		green_points += 1
		health_points += 1
		patient_health()
	if !green and Input.is_action_just_pressed("Interact"):
		health_points -= 0.5
		check_health_points(health_points)
	if health_points < -60.0:
		patient_lost()


func _on_area_left_body_entered(body: Node2D) -> void:
	if body.is_in_group("marker"):
		direction = 1
	



func _on_area_right_body_entered(body: Node2D) -> void:
	if body.is_in_group("marker"):
		direction = -1
		
		



func _on_green_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("marker"):
		green = true



func _on_green_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("marker"):
		green = false
	if green_points > 2:
		green = false
		increase_speed()
		
		
func increase_speed():
	marker_speed += 2

func reset_speed():
	marker_speed = 30
	
	
	
func patient_infected():
	get_tree().change_scene_to_packed(INFECTED_PATIENT)


func _on_let_us_help_pressed() -> void:
	reset_speed()  
	infection_points += 1
	infection_animation.frame += 1 
	if infection_points > 7 and infection_animation.frame == 8:
		patient_infected()

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("Interact"):
		debug_label.text = str(health_points)

func patient_lost():
	
	get_tree().change_scene_to_packed(DEAD_PATIENT)
	

	

func check_health_points(health: float):
	if health < -15.0:
		heartbeat_audio.pitch_scale = 1.15
	if health < -30.0:
		heartbeat_audio.pitch_scale = 1.30
	if health < -45.0:
		heartbeat_audio.pitch_scale = 1.45
	


func _on_heartbeat_audio_finished() -> void:
	heartbeat_audio.play()

func update_health():
	health_bar.value = health_timer.time_left
func patient_health():
	if health_points > 40.0:
		patient_saved()

func patient_saved():
	get_tree().change_scene_to_packed(SAVED_PATIENT)
