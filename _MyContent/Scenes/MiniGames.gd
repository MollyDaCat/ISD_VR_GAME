extends Spatial

var tickets = 0

func add_tickets(amount):
	tickets += amount
	$"Video Machine/Viewport/Label".text = str(tickets)
