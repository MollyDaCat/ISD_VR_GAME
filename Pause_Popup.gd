extends WindowDialog



func _on_Fullscreen_pressed():
	OS.window_fullscreen = true


func _on_Button_quit2_pressed():
	get_tree().quit()

