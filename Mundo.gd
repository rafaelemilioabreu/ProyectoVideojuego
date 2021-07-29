extends Node

export (PackedScene) var globo_escena

var score = 0
var numero = 0
var alien = preload("res://Alien.tscn")


func _ready():
	randomize()

func _on_GloboTimer_timeout():
	var globo_spawn_locacion = $GlobosCamino/GloboSpawn
	globo_spawn_locacion.unit_offset = randf()
	
	var globo = globo_escena.instance()
	add_child(globo)
	
	globo.position = globo_spawn_locacion.position
	globo.connect("explode",self,"addindPoints")
	globo.connect("blue_explode",self,"addingBluePoints")
	


func new_game():
	score = 0
	numero = 0
	
	$Alien.start($StartPosition.position)
	$HUD.update_score(score)
	$StartTimer.start()
	$HUD.show_message("Get Ready...")
	yield($StartTimer,"timeout")
	$ScoreTimer.start()
	$GloboTimer.start()
	numero +=1
	
	
func game_over():
	$ScoreTimer.stop()
	$GloboTimer.stop()
	$HUD.show_game_over()


func _process(delta):
	
	
	pass
	
	
	



	
	
func addindPoints():
	score+=1
	$HUD.update_score(score)
	
func addingBluePoints():
	score+=10
	$HUD.update_score(score)
	
