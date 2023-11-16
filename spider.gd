extends CharacterBody2D

var direccion= Vector2(0,0)
const  maxV = 100
const velocidadH = 50
const velocidadV = 50

@onready var sprite2D = $Sprite2D
@onready var animationPlayer = $AnimationPlayer

func _ready():
	var _sprite2D = $Sprite2D
	var _animationPlayer = $AnimationPlayer

func _physics_process(_delta):
	mover()
	avanzar()
	move_and_slide()
	
func mover():
	if Input. is_action_just_pressed("derechaButton"):
		direccion.x = velocidadH
		sprite2D.flip_h= false
		animationPlayer.play("adelante")
		direccion.x = max(direccion.x+velocidadH,maxV)
	elif Input.is_action_just_pressed("izquierdaButton"):
		direccion.x = -velocidadH
		sprite2D.flip_h= false
		animationPlayer.play("retroceder")
		direccion.x = max(direccion.x-velocidadH,-maxV)
	else:
		animationPlayer.play("RESET")
		direccion.x = 0
		
func avanzar():
		
	if Input. is_action_pressed("arribaButton"):
		direccion.y = velocidadV
		sprite2D.flip_h= false
		animationPlayer.play("adelante")
		direccion.y = max(direccion.y+velocidadV,maxV)
	elif Input. is_action_pressed("abajoButton"):
		direccion.y = -velocidadV
		sprite2D.flip_h= false
		animationPlayer.play("retroceder")
		direccion.y = max(direccion.y-velocidadV,-maxV)
	else:
		direccion.y += 0
