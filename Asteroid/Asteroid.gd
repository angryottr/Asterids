extends RigidBody2D

var rng = RandomNumberGenerator.new()
var screen_size

const TINY = 8
const SMALL = 16
const MEDIUM = 32
const LARGE = 64

export var size = 32
export var shape_resolution = 16
export var radius_jitter_lowerbound = 0.75
export var radius_jitter_upperbound = 1.25

var shape = PoolVector2Array()

func _init():
	var size = random_size()
	set_size(size)


func _ready():
	rng.randomize()
	screen_size = get_viewport_rect().size

	generate_shape()
	generate_velocities()
	add_collision()


func set_size(size):
	self.size = size
	mass = size


func _integrate_forces(state):
	var transform = state.get_transform()
	transform.origin.x = wrapf(transform.origin.x, -size, screen_size.x + size)
	transform.origin.y = wrapf(transform.origin.y, -size, screen_size.y + size)
	state.set_transform(transform)


func generate_shape():
	var current_angle = 0
	for _i in range(shape_resolution):
		var radius_jitter = rng.randf_range(radius_jitter_lowerbound, radius_jitter_upperbound)
		shape.push_back(Vector2(cos(current_angle), sin(current_angle)) * size * radius_jitter)
		current_angle += (PI / (shape_resolution / 2))
	shape.push_back(shape[0])


func generate_velocities():
	angular_velocity = rng.randf_range(-4.0, 4.0)
	var speed = rng.randf_range(20.0, 100.0)
	linear_velocity = Vector2(0, speed).rotated(rng.randf_range(0, 2 * PI))


func add_collision():
	var collision = CollisionPolygon2D.new()
	collision.polygon = shape
	add_child(collision)


func random_size():
	return [TINY, SMALL, MEDIUM, LARGE][randi() % 4]


func is_tiny():
	return size == TINY


func is_small():
	return size == SMALL


func is_medium():
	return size == MEDIUM


func is_large():
	return size == LARGE


func next_size_down():
	return size / 2
