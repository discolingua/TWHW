class_name TitleWorld
extends Node2D


func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		var _i = get_tree().change_scene_to(load('res://GameWorld.tscn'))



