extends RigidBody


var NO_PICKUP


func Press():
	print ("Button Press")
	get_parent().Press()
