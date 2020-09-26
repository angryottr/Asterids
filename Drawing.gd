extends Node2D

const color = Color(1.0, 1.0, 1.0)

func _draw():
	draw_line(Vector2(0, -32), Vector2(-32, 32), color)
	draw_line(Vector2(0, -32), Vector2(32, 32), color)
	draw_line(Vector2(-32, 32), Vector2(0, 16), color)
	draw_line(Vector2(32, 32), Vector2(0, 16), color)


func _process(delta):
	update()
