class_name spider extends CharacterBody2D

signal killed
signal gano

@export var  maxV = 200

@onready var sprite2D = $Sprite2D
@onready var animationPlayer = $AnimationPlayer

func _ready():
	var sprite2D = $Sprite2D
	var animationPlayer = $AnimationPlayer

func _physics_process(delta):
	
	var direccion= Vector2(Input.get_axis("izquierdaButton", "derechaButton"), 
	Input.get_axis("arribaButton", "abajoButton"))
	velocity = direccion * maxV
	avanzar()
	mover()
	move_and_slide()
	
	
func avanzar():
	var di = Vector2()
	
	if Input. is_action_pressed("arribaButton"):
		sprite2D.flip_h= false
		animationPlayer.play("adelante")
		di.y -= 1 
	elif Input. is_action_pressed("abajoButton"):
		sprite2D.flip_h= false
		animationPlayer.play("retroceder")
		di.y += 1
	velocity.y = Input.get_axis("arribaButton","abajoButton") * maxV
	move_and_slide()

func mover():
	var di = Vector2()
	if Input. is_action_pressed("derechaButton"):
		sprite2D.flip_h = false
		animationPlayer.play("adelante")
		di.x -= 1
	elif  Input. is_action_pressed("izquierdaButton"):
		sprite2D.flip_h = false
		animationPlayer.play("retroceder")
		di.x += 1
		velocity.x = Input.get_axis("arribaButton","abajoButton") * maxV
		move_and_slide()
	

func die():
	killed.emit()
	queue_free()
	
func win():
	gano.emit()
	queue_free()

