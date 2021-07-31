extends CanvasLayer

signal start_game



func update_score(score):
	$ScoreLabel.text = str(score)
	
func show_message(text):
	$MessageLabel2.text = text
	$MessageLabel2.show()
	$MessageTimer.start()
	

func _on_Button_pressed():
	$Button.hide()
	emit_signal("start_game")


func _on_MessageTimer_timeout():
	$MessageLabel2.hide()
	
	
func show_game_over():
	show_message("Game Over")
	yield($MessageTimer,"timeout")
	$MessageLabel2.text = "ALIEN VERSUS BALLOON"
	$MessageLabel2.show()
	yield(get_tree().create_timer(1.0),"timeout")
	$Button.text = "Replay"
	$Button.show()
	
	
func show_LevelCompleted():
	
	
	$MessageLabel2.text = "Level Completed"
	$MessageLabel2.show()
	yield(get_tree().create_timer(1.0),"timeout")
	
	$Button.text = "Replay"
	$Button.show()
	


	
	
	
