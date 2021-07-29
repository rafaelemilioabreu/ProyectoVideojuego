extends Area2D

export (PackedScene) var laser_escena

signal death

export var velocidad = 400

var plLaser = preload("res://Laser.tscn")



func _process(delta):
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
	
	


func _on_VisibilityNotifier2D_screen_exited():
	hide()
	emit_signal("death")
	
	
func start(posicion):
	position  = posicion
	show()
	
