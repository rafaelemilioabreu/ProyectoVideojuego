extends Node

export (PackedScene) var globo_escena

var score = 10


func _ready():
	randomize()

func _on_GloboTimer_timeout():
	var globo_spawn_locacion = $GlobosCamino/GloboSpawn
	globo_spawn_locacion.unit_offset = randf()
	
	var globo = globo_escena.instance()
	add_child(globo)
	
	globo.position = globo_spawn_locacion.position
	


func new_game():
	score = 10
	$ScoreTimer.start()
	
	
func game_over():
	$ScoreTimer.stop()
	
	
	
	


func _on_ScoreTimer_timeout():
	score-=5
	$HUD.update_score(score)
	
