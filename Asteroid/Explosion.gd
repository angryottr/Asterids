extends Particles2D


var linear_velocity = Vector2()
var angular_velocity = 0

func _process(delta):
	position += linear_velocity * delta
	rotation += angular_velocity * delta


func _on_Timer_timeout():
	queue_free()
