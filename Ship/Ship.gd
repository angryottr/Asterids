extends Area2D

export var size = 16

var velocity = Vector2()

var screen_size
var shape

const ROTATION_SPEED = PI / 64

func _ready():
	screen_size = get_viewport_rect().size

	initialize_shape()
	add_collision()


func _process(delta):
	if Input.is_action_pressed("ui_right"):
		rotation += ROTATION_SPEED

	if Input.is_action_pressed("ui_left"):
		rotation -= ROTATION_SPEED

	if Input.is_action_pressed("ui_up"):
		var new_velocity = Vector2(0, -5).rotated(rotation)
		velocity += new_velocity

	position += velocity * delta

	position.x = wrapf(position.x, -size, screen_size.x + size)
	position.y = wrapf(position.y, -size, screen_size.y + size)


func initialize_shape():
	shape = PoolVector2Array([
		Vector2(-size, size), Vector2(0, -size),
		Vector2(size, size), Vector2(0, size / 2),
		Vector2(-size, size)
	])


func add_collision():
	var collision = CollisionPolygon2D.new()
	collision.polygon = shape
	add_child(collision)
