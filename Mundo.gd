extends Node

export (PackedScene) var globo_escena


func _ready():
	randomize()

func _on_GloboTimer_timeout():
	var globo_spawn_locacion = $GlobosCamino/GloboSpawn
	globo_spawn_locacion.unit_offset = randf()
	
	var globo = globo_escena.instance()
	add_child(globo)
	
	globo.position = globo_spawn_locacion.position
	
	
	
	
	
	
