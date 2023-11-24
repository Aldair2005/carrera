extends Area2D

@export var maxV = 0

@onready var animation = $AnimationPlayer

func _physics_process(delta):

	animation.play("matamosca")

func die():
	queue_free()


func _on_body_entered(body):
	if body is spider:
		body.die()
		die()
