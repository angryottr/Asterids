extends Node

export (PackedScene) var Asteroid

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var asteroid = Asteroid.instance()
		asteroid.size = [8, 16, 32, 64][randi() % 4]
		asteroid.mass = asteroid.size
		asteroid.position = event.position
		add_child(asteroid)
