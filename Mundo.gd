extends Node

export (PackedScene) var globo_escena

var score = 0
var numero = 0
var helio = 100
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
	helio = 100
	$Alien.start($StartPosition.position)
	$HUD.update_score(score)
	$StartTimer.start()
	$HUD.show_message("Get Ready...")
	yield($StartTimer,"timeout")
	$ScoreTimer.start()
	$GloboTimer.start()
	$PBTimer.start()
	numero +=1
	
	
func game_over():
	$ScoreTimer.stop()
	$GloboTimer.stop()
	$HUD.show_game_over()
	
	
func LevelCompleted():
	$ScoreTimer.stop()
	$GloboTimer.stop()
	$HUD.show_LevelCompleted()

func _process(delta):
	
	if score >= 500:
		LevelCompleted()
	pass
	
	
	



	
	
func addindPoints():
	score+=1
	helio+=0.1
	$ProgressBar.value=helio
	$HUD.update_score(score)
	
func addingBluePoints():
	score+=10
	helio+=10
	$ProgressBar.value=helio
	$HUD.update_score(score)
	


func _on_PBTimer_timeout():
	helio-=0.5
	$ProgressBar.value=helio
	if $ProgressBar.value==0:
		game_over()
