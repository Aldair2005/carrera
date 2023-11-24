class_name map extends Node2D

@export var obst: Array[PackedScene] = []

@onready var time = $Time
@onready var timer = $TimerSpanL
@onready var containerladrillos = $containerLadrillos

@onready var span = $span

@onready var gos = $CanvasLayer/gameover
@onready var gg = $CanvasLayer/gg

@onready var pb = $ParallaxBackground
var scroll_V = 100

var spider = null

var segundos = 0
var mejor_tiempo 

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
	if timer.wait_time > 0.8: 
		timer.wait_time -= delta*0.8
	elif timer.wait_time < 0.8:
		timer.wait_time = 0.8 

func _on_time_timeout():
	segundos += 1    
	$ParallaxBackground/crono.text = "segundos: " + str(segundos)

func _on_timer_span_l_timeout():
	var l = obst.pick_random().instantiate()
	l.global_position = Vector2(randf_range(-540,540),-4900)
	containerladrillos.add_child(l)
		
func _on_spider_killed():
	await get_tree().create_timer(0.1).timeout
	gos.visible = true
	time.stop()

func _on_spider_gano():
	await get_tree().create_timer(0.1).timeout
	gg.visible = true




