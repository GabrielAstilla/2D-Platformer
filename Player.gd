extends KinematicBody2D

var score: int = 0 
var coin: int = 0

#physics
export var speed: int = 200
export var jumpForce: int = 530
export var gravity: int = 1000

var velocity: Vector2 = Vector2()
var grounded: bool = false

onready var sprite = $Sprite
onready var ui = get_node("/root/MainScene/CanvasLayer/UI")

func _ready():
	pass 

func _physics_process(delta):
	velocity.x = 0
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		velocity.x += speed

	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.y += gravity * delta
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= jumpForce

	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false

func die():
	get_tree().reload_current_scene()

func collect_coin(value):
	$Coin.play()
	score += value  
	ui.set_score_text(score)
	if score >= 21:
		get_tree().change_scene("res://end.tscn")
