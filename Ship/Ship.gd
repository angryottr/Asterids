extends Area2D

var screen_size
var velocity = Vector2()

const ROTATION_SPEED = PI / 64

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		rotation += ROTATION_SPEED
	if Input.is_action_pressed("ui_left"):
		rotation -= ROTATION_SPEED

	if Input.is_action_pressed("ui_up"):
		var new_velocity = Vector2(0, -5).rotated(rotation)
		velocity += new_velocity

	position += velocity * delta

	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)
