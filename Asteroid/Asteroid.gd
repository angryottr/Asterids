extends Area2D

var rng = RandomNumberGenerator.new()
var screen_size
var velocity
var rotational_velocity

export var radius = 32
export var num_points = 16

var points = PoolVector2Array()

func _ready():
	rng.randomize()
	screen_size = get_viewport_rect().size
	
	generate_shape()
	generate_velocities()
	add_collision()


func _process(delta):
	rotation += rotational_velocity * delta
	position += velocity * delta

	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)


func generate_shape():
	var current_angle = 0
	for _i in range(num_points):
		var radius_jitter = rng.randf_range(0.75, 1.25)
		points.push_back(Vector2(cos(current_angle), sin(current_angle)) * radius * radius_jitter)
		current_angle += (PI / (num_points / 2))
	
	points.push_back(points[0])

func generate_velocities():
	rotational_velocity = rng.randf_range(-2.0, 2.0)
	var speed = rng.randf_range(10.0, 50.0)
	velocity = Vector2(0, speed).rotated(rng.randf_range(0, 2 * PI))

func add_collision():
	var collision = CollisionPolygon2D.new()
	collision.polygon = points
	add_child(collision)
