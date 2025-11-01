extends Node2D

@onready var marker_line: Sprite2D = %MarkerLine
@onready var green_zone: Sprite2D = %GreenZone

@onready var label: Label = $Label

var marker_speed = 30
var marker_range_array = [-54, 54]
var direction = 1

var green = false
var green_points = 0

var marker_y : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func _physics_process(delta: float) -> void:
	marker_line.position.x += direction * marker_speed * delta
	label.text = str(green_points)
	if green and Input.is_action_pressed("Interact"):
		green_zone.position.x = randf_range(-54, 54)
		green_points += 1
	


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
		increase_speed()
		
		
func increase_speed():
	marker_speed += 2
