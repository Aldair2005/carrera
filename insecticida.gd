class_name insecticida extends Area2D
@export var maxV = 0

@onready var animation = $AnimationPlayer


func _physics_process(delta):
	global_position.y += maxV * delta
	animation.play("insecticida")

func die():
	queue_free()

func _on_body_entered(body):
	if body is spider:
		body.die()
		die()
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
