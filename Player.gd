class_name Player
extends KinematicBody2D


# initialize state machine
enum STATES {IDLE, WALKING, POWERING, ATTACKING}

# const BasicKnife = preload("res://Player/BasicKnife.tscn")

const ACCELERATION = 600
const MAX_SPEED = 600
const FRICTION = 800


var state : int = STATES.IDLE


# store most recent non-zero movement input for setting attack direction
var velocity : Vector2 = Vector2.ZERO
var lastVelocity : Vector2 = Vector2.ZERO


var powerUpLevel : float = 0.0 
var powerUpRate : float = 1.5



# reference to HUD components
onready var cameraNode : Node = get_node("/root/GameWorld/RootCamera")					
# onready var powerUpGauge = get_node("/root/World/HUD_GUI/PowerUpBar")
# onready var toolDisplay = get_node("/root/World/HUD_GUI/ActiveToolDisplay")

func _ready() -> void:
	pass
	

func _physics_process(delta) -> void:
	match state:
		STATES.IDLE: idle(delta)
		STATES.WALKING: walking(delta)
		

func readMovement() -> Vector2:
	var _i = Vector2.ZERO
	
	_i.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	_i.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
	# normalize vector fixes fast/distorted diagonals
	_i = _i.normalized()
	return _i


func walking(delta) -> void:
	var _i = readMovement()
	if _i != Vector2.ZERO:	
		lastVelocity = _i
		velocity = move_and_slide(_i * MAX_SPEED)
		cameraNode.position = self.position;
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		state = STATES.IDLE


func idle(delta) -> void:
	var _i = readMovement()
	if _i != Vector2.ZERO:
		state = STATES.WALKING
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
