extends Area2D

export (float) var velocidad = 500


func _physics_process(delta):
	position.x -= velocidad * delta
	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Laser_area_entered(area):
	if area.is_in_group("damageable"):
		area.damage()
		queue_free()
