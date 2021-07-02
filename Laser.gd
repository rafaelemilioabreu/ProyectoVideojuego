extends Area2D

export (float) var velocidad = 500


func _physics_process(delta):
	position.x -= velocidad * delta
