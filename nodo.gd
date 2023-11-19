extends Node2D

@export var obst: Array[PackedScene] = []

@onready var timer = $TimerSpanL
@onready var containerladrillos = $containerLadrillos

@onready var span = $span

@onready var gos = $CanvasLayer/gameover
@onready var gg = $CanvasLayer/gg

var spider = null
# Called when the node enters the scene tree for the first time.
func _ready():
	spider = get_tree().get_first_node_in_group("spider") 
	assert(spider!=null)
	spider.killed.connect(_on_spider_killed)
	
	spider.gano.connect(_on_spider_gano)

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	if timer.wait_time > 0.5: 
		timer.wait_time -= delta*1
	elif timer.wait_time < 0.5:
		timer.wait_time = 0.5 

func _on_timer_span_l_timeout():
	var l = obst.pick_random().instantiate()
	l.global_position = Vector2(randf_range(-540,540),-900)
	containerladrillos.add_child(l)
func _on_spider_killed():
	await get_tree().create_timer(1,5).timeout
	gos.visible = true	

func _on_spider_gano():
	await get_tree().create_timer(1.5).timeout
	gg.visible = true


	
