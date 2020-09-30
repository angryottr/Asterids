extends Node

export (PackedScene) var Asteroid
export (PackedScene) var Explosion
export (PackedScene) var Bullet

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()


func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var space_state = $Ship.get_world_2d()
		if space_state.direct_space_state.intersect_point(event.position):
			return
		var asteroid = Asteroid.instance()
		asteroid.position = event.position
		add_child(asteroid)

	if event is InputEventKey and event.pressed and event.scancode == KEY_SPACE:
		var bullet = Bullet.instance()
		bullet.position = $Ship.position
		bullet.velocity = bullet.velocity.rotated($Ship.rotation)
		bullet.velocity += $Ship.velocity
		bullet.connect("body_entered", self, "_on_Bullet_hit_Asteroid", [bullet])
		add_child(bullet)


func _on_Bullet_hit_Asteroid(asteroid, bullet):
	bullet.queue_free()

	explode(asteroid)

	if !asteroid.is_tiny():
		var spread = 1.5
		var new_asteroid_count = rng.randi_range(2, 4)
		var new_asteroid_size = asteroid.next_size_down()

		for _i in range(new_asteroid_count):
			var new_asteroid = Asteroid.instance()

			new_asteroid.set_size(new_asteroid_size)
			new_asteroid.position = asteroid.position
			new_asteroid.position += Vector2(
				rng.randi_range(-asteroid.size * spread, asteroid.size * spread),
				rng.randi_range(-asteroid.size * spread, asteroid.size * spread)
			)
			new_asteroid.initial_linear_velocity = (
				asteroid.linear_velocity +
					(new_asteroid.position - asteroid.position) * 2
			)

			call_deferred("add_child", new_asteroid)

	asteroid.queue_free()

func explode(asteroid):
	var explosion = Explosion.instance()

	explosion.linear_velocity = asteroid.linear_velocity
	explosion.angular_velocity = asteroid.angular_velocity
	explosion.position = asteroid.position
	explosion.amount = asteroid.size
	explosion.emitting = true

	call_deferred("add_child", explosion)
