extends Control


# Called when the node enters the scene tree for the first time.
func _ready():

f

func _process(delta):
	var ggg = Input.get_axis("pausa"):
	get_tree().paused = not get_tree().paused
