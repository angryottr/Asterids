extends Node2D

const COLOR = Color(1.0, 1.0, 1.0)

func _draw():
	var parent = get_parent()

	for point_index in range(parent.num_points):
		draw_line(parent.points[point_index], parent.points[point_index + 1], COLOR)


func _process(delta):
	update()
