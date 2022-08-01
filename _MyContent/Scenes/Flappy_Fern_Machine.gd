extends Spatial


func Press():
	$Viewport/Player.get_child(1).flap()
