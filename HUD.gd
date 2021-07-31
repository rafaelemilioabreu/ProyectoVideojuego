extends CanvasLayer

signal start_game
var seconds = 0
var minutes = 0


func _process(delta):
	if seconds > 59:
		minutes +=1
		seconds = 0
	$ScreenTimerLabel.text = (str(minutes)+":"+str(seconds)) 



func update_score(score):
	$ScoreLabel.text = str(score)
	
func show_message(text):
	$MessageLabel2.text = text
	$MessageLabel2.show()
	$MessageTimer.start()
	

func _on_Button_pressed():
	$Button.hide()
	minutes = 0
	seconds = 0
	$ScreenTimer.start()
	emit_signal("start_game")


func _on_MessageTimer_timeout():
	$MessageLabel2.hide()
	
	
func show_game_over():
	$ScreenTimer.stop()
	show_message("Game Over")
	yield($MessageTimer,"timeout")
	$MessageLabel2.text = "ALIEN VERSUS BALLOON"
	$MessageLabel2.show()
	yield(get_tree().create_timer(1.0),"timeout")
	$Button.text = "Replay"
	$Button.show()
	
	
func show_LevelCompleted():
	
	$ScreenTimer.stop()
	$MessageLabel2.text = "Level Completed"
	$MessageLabel2.show()
	yield(get_tree().create_timer(1.0),"timeout")
	
	$Button.text = "Replay"
	$Button.show()
	
	


	
	
	


func _on_ScreenTimer_timeout():
	seconds +=1
	pass # Replace with function body.
