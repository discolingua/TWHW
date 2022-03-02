class_name CardBullet
extends Area2D

var speed = 900


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position += transform.x * speed * delta
	rotation += .01 * delta 
