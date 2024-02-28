extends CharacterBody2D

var speed = 200
var combustivel = 100
var balap = preload("res://laser.tscn")
var lado = 1

func _ready():
	$AnimationSprite2D.play()
	
func _physics_process(_delta):
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = velocity.y - speed
	if Input.is_action_pressed("ui_down"):
		velocity.y = velocity.y + speed
	if Input.is_action_pressed("ui_right"):
		velocity.x = velocity.x + speed
		$AnimatedSprite2D.flip_h = false
		lado = 1
	if Input.is_action_pressed("ui_left"):
		velocity.x = velocity.x - speed
		$AnimatedSprite2D.flip_h = true
		lado = -1
		
	if Input.is_action_pressed("atira"):
		$atira.player()
		var novabala = balap.instantiate()
		novabala.position.x = position.x + 4
		novabala.position.y = position.y + 4
		novabala.z_index = -1
		novabala.setLado(lado)
		get_tree().current_scene.add_child(novabala)
		
	move_and_slide()
