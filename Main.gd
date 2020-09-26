extends Node

export (PackedScene) var Asteroid

func _input(event):
   if event is InputEventMouseButton and event.pressed:
	   var asteroid = Asteroid.instance()
	   asteroid.position = event.position
	   add_child(asteroid)
