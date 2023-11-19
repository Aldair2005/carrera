class_name spider extends CharacterBody2D

signal killed
signal gano

@export var  maxV = 200

@onready var sprite2D = $Sprite2D
@onready var animationPlayer = $AnimationPlayer

func _ready():
	var sprite2D = $Sprite2D
	var animationPlayer = $AnimationPlayer

func _physics_process(_delta):
	var direccion= Vector2(Input.get_axis("izquierdaButton", "derechaButton"), 
	Input.get_axis("arribaButton", "abajoButton"))
	velocity = direccion * maxV
	mover()
	avanzar()
	move_and_slide()
	
func mover():
	if Input. is_action_pressed("derechaButton"):		
		sprite2D.flip_h= false
		animationPlayer.play("adelante")
	elif Input.is_action_pressed("izquierdaButton"):
		sprite2D.flip_h= false
		animationPlayer.play("retroceder")
	move_and_slide()
		
func avanzar():
		
	if Input. is_action_pressed("arribaButton"):
		sprite2D.flip_h= false
		animationPlayer.play("adelante")
	elif Input. is_action_pressed("abajoButton"):
		sprite2D.flip_h= false
		animationPlayer.play("retroceder")
	move_and_slide()
	

func die():
	killed.emit()
	queue_free()
	
func win():
	gano.emit()
	queue_free()

