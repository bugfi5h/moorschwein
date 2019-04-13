extends Node2D

export(int) var POINTS = 25
export(float) var HORIZONTAL_SPEED = 100
export(float) var VERTICAL_SPEED = 2
export(float) var AMPLITUDE = 150
var m_start : float = 0
var m_start_position : Vector2 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	m_start_position = position

func _physics_process(delta:float) -> void:
	m_start += delta
	position.x += delta * HORIZONTAL_SPEED
	position.y = sin((m_start)*VERTICAL_SPEED)*AMPLITUDE + m_start_position.y
	if global_position.x > get_viewport_rect().size.x:
		kill(false)
	if global_position.x < 0:
		kill(false)

	


func kill(grant_points: bool) -> void:
	if get_parent().has_method("add_points") and grant_points:
		get_parent().add_points(POINTS)
	queue_free()

func _on_MoorSchwein_input_event(viewport, event, shape_idx) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
		kill(true)
