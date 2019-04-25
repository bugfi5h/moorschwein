extends Node2D

var mPoints : int = 0
const PIG = preload("res://gameobjects/MoorSchwein.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/UI.update_points(mPoints)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_pig_killed(points : int) -> void:
	mPoints += points
	$CanvasLayer/UI.update_points(mPoints)

func _build_pig(points : int, horizontal_speed : float, vertical_speed :float, amplitude : float, scale : Vector2) -> Area2D:
	var pig = PIG.instance()
	var screen_size = int(get_viewport_rect().size.y)
	pig.HORIZONTAL_SPEED = horizontal_speed
	pig.POINTS = points
	pig.VERTICAL_SPEED = vertical_speed
	pig.AMPLITUDE = amplitude
	pig.scale = scale	
	var x = 0
	var dir = randi()%2+1
	if dir == 2:
		pig.HORIZONTAL_SPEED *= -1
		x = get_viewport_rect().size.x
	pig.position = Vector2(x, randi()%screen_size+25)
	pig.connect("killed", self, "_on_pig_killed")
	return pig


func _on_NormalPig_timeout() -> void:
	var pig = _build_pig(25,100,2,150, Vector2(1,1))
	$NormalPig.add_child(pig)


func _on_SmallPig_timeout():
	var pig = _build_pig(50,150,4,200, Vector2(0.75,0.75))
	$SmallPig.add_child(pig)


func _on_BigPig_timeout():
	var pig = _build_pig(5,50,2,100, Vector2(1.5,1.5))
	$BigPig.add_child(pig)
