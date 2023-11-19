extends Area2D


func win():
	queue_free()

func _on_body_entered(body):
	if body is spider:
		body.win()
		win()
