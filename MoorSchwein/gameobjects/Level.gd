extends Node2D

const PIG = preload("res://MoorSchwein.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _build_pig(points : int, horizontal_speed : float, vertical_speed :float, amplitude : float, scale : Vector2) -> Area2D:
	var pig = PIG.instance()
	var x = 0
	var dir = randi()%2+1
	if dir == 2:
		dir = -1
		x = get_viewport_rect().size.x
	var screen_site = int(get_viewport_rect().size.y)
	pig.position = Vector2(x, randi()%screen_site+25)
	pig.POINTS = points
	pig.HORIZONTAL_SPEED = horizontal_speed
	pig.VERTICAL_SPEED = vertical_speed
	pig.AMPLITUDE = amplitude
	pig.DIRECTION = dir
	pig.scale = scale
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
	print(randi()%2+1)
