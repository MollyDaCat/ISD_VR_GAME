extends Spatial


func Press():
	$Viewport/Player.get_child(2).flap()

func finish():
	$AnimationPlayer.play("Finish")
	$Viewport.queue_free()
	get_parent().add_tickets(10)
