extends CanvasLayer

signal start_game
signal score_zero


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
	

func _process(delta):
	if int($ScoreLabel.text) <= 0:
		$ScoreLabel.text = str(0)
		emit_signal("score_zero")
	
	
	
