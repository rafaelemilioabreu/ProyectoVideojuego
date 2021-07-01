extends Area2D


var velocidad 

func _ready():
	
	randomize()
	$AnimatedSprite.playing = true
	var globo_tipo = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = globo_tipo[randi() % globo_tipo.size()]
	velocidad = rand_range(0.5,1)
	

#eliminamos el globo de la memoria si sale de pantalla
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
	
	
	

		

func _process(delta):
	position.y -=velocidad
	
