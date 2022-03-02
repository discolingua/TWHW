class_name Player
extends KinematicBody2D


# initialize state machine
enum STATES {IDLE, WALKING, POWERING, ATTACKING}

const CardBullet = preload("res://CardBullet.tscn")

const ACCELERATION = 300
const MAX_SPEED = 400
const FRICTION = .1

var state : int = STATES.IDLE

# store most recent non-zero movement input for setting attack direction
var velocity : Vector2 = Vector2.ZERO
var lastVelocity : Vector2 = Vector2.ZERO

# reference to HUD components
onready var cameraNode : Node = get_node("/root/GameWorld/RootCamera")					
# onready var powerUpGauge = get_node("/root/World/HUD_GUI/PowerUpBar")
# onready var toolDisplay = get_node("/root/World/HUD_GUI/ActiveToolDisplay")

onready var animPlayer : AnimatedSprite = get_node("AnimatedSprite")


func _ready() -> void:
	var _tween : Tween = get_node("Tween")

	

func _physics_process(delta) -> void:
	print(animPlayer.get_animation())
	animPlayer.play("float")
	match state:
		STATES.IDLE: idle(delta)
		STATES.WALKING: walking(delta)
		

func readButtons() -> void:
	if Input.is_action_just_pressed("ui_accept"):
		print(".")
		animPlayer.play("throw")
		var _shotInstance = CardBullet.instance()
		_shotInstance.position = position
		get_parent().add_child(_shotInstance)



func readMovement() -> Vector2:
	var _i = Vector2.ZERO
	
	_i.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	_i.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
	# normalize vector fixes fast/distorted diagonals
	_i = _i.normalized()
	return _i


func walking(delta) -> void:
	var _i = readMovement()
	readButtons()
	if _i != Vector2.ZERO:	
		if _i.x < 0:
			animPlayer.flip_h = true
		else:
			animPlayer.flip_h = false
		lastVelocity = _i
		velocity = move_and_slide(_i * MAX_SPEED)
		cameraNode.position = self.position
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		state = STATES.IDLE


func idle(delta) -> void:
	var _i = readMovement()
	readButtons()
	if _i != Vector2.ZERO:
		state = STATES.WALKING
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
