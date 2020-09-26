extends Node2D

const COLOR = Color(1.0, 1.0, 1.0)

func _draw():
	var parent = get_parent()
	draw_polyline(parent.shape, COLOR)
