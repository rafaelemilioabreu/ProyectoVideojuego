extends Area2D

export (int) var velocidad

func _process(delta):
	var direccion = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		direccion.y -= 1
	if Input.is_action_pressed("ui_down"):
		direccion.y += 1

	position += direccion * velocidad * delta
