extends Node2D

const COLOR = Color(1.0, 1.0, 1.0)
export var size = 16

func _draw():
	draw_line(Vector2(0, -size), Vector2(-size, size), COLOR)
	draw_line(Vector2(0, -size), Vector2(size, size), COLOR)
	draw_line(Vector2(-size, size), Vector2(0, size / 2), COLOR)
	draw_line(Vector2(size, size), Vector2(0, size / 2), COLOR)
