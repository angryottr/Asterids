extends Area2D

const COLOR = Color(1.0, 1.0, 1.0)

var screen_size
var velocity = Vector2(0, -150)

func _ready():
	screen_size = get_viewport_rect().size

func _draw():
	draw_line(Vector2(0, 0), Vector2(0, 1), COLOR)


func _process(delta):
	position += velocity * delta
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)


func _on_Timer_timeout():
	queue_free()
