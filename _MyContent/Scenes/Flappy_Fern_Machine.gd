extends Spatial


func Press():
	$Viewport/Player.get_child(2).flap()

func finish():
	$AnimationPlayer.play("Finish")
	$Viewport.queue_free()
	if Global.tickets[2] == 0:
		get_parent().add_tickets(10)
		Global.tickets[2] = 1
