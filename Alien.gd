extends Area2D

export (PackedScene) var laser_escena

signal death

export var velocidad = 400

var plLaser = preload("res://Laser.tscn")
var screen




func _process(delta):
	screen = get_viewport().size
	var direccion = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		direccion.y -= 1
	if Input.is_action_pressed("ui_down"):
		direccion.y += 1
	if Input.is_action_just_pressed("ui_accept"):
		var laser = plLaser.instance()
		laser.position = position
		get_tree().current_scene.add_child(laser)
	
		
	

	position += direccion * velocidad * delta
	

	


	
	
	
func start(posicion):
	position  = posicion
	show()
	



func _on_Visibility3_viewport_exited(viewport):
	hide()
	emit_signal("death")
	pass # Replace with function body.
