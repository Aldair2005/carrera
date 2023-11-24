extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(delta):
	if Input. is_action_pressed("reset"):
		get_tree().reload_current_scene()


	
func _on_rs_button_pressed():
	get_tree().reload_current_scene()


