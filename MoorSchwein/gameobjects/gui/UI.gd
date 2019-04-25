extends Control

var mPoints : Label

func _ready():
	mPoints = $MarginContainer/HBoxContainer/Points

func update_points(points: int) -> void:
	mPoints.text = String(points)