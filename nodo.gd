extends Node2D

@onready var span = $span

var spider = null
# Called when the node enters the scene tree for the first time.
func _ready():
	spider = get_tree().get_first_node_in_group("spider") 
	assert(spider!=null)# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
