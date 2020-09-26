extends Node2D

const color = Color(1.0, 1.0, 1.0)
export var size = 16

func _draw():
	draw_line(Vector2(0, -size), Vector2(-size, size), color)
	draw_line(Vector2(0, -size), Vector2(size, size), color)
	draw_line(Vector2(-size, size), Vector2(0, size / 2), color)
	draw_line(Vector2(size, size), Vector2(0, size / 2), color)


func _process(delta):
	update()
