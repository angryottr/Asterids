extends Node

export (PackedScene) var Asteroid
export (PackedScene) var Bullet

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var asteroid = Asteroid.instance()
		asteroid.size = [8, 16, 32, 64][randi() % 4]
		asteroid.mass = asteroid.size
		asteroid.position = event.position
		add_child(asteroid)
	
	if event is InputEventKey and event.pressed and event.scancode == KEY_SPACE:
		var bullet = Bullet.instance()
		bullet.position = $Ship.position
		bullet.velocity = bullet.velocity.rotated($Ship.rotation)
		bullet.velocity += $Ship.velocity
		add_child(bullet)
