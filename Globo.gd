extends Area2D

signal explode
signal blue_explode

var velocidad 

func _ready():
	
	randomize()
	$AnimatedSprite.playing = true
	var globo_tipo = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = globo_tipo[randi() % globo_tipo.size()]
	if $AnimatedSprite.animation == "azul":
		velocidad = rand_range(1,2)
	else:
		velocidad = rand_range(0.5,1)
	
	
	

#eliminamos el globo de la memoria si sale de pantalla
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
	
	
	

		

func _process(delta):
	position.y -=velocidad
	
	
	
	
	
func damage ():
	queue_free()
	if $AnimatedSprite.animation == "azul":
		emit_signal("blue_explode")
		
	else:
		emit_signal("explode")
	
