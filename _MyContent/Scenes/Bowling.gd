extends Spatial


onready var squares = $Viewport/Squares.get_children()
var current_round = 0

var pins_down_round_one = 0
var pins_down = 0
var total_points = 0
var balls_thrown = 0

var challenge1 = 10
var challenge2 = 20
var challenge3 = 40
var challenge4 = 60



func _ready():
	pass

 
func _on_Pin_Respawn_Delay_timeout():
	reset_pins()

func reset_pins():
	$AnimationPlayer.play("RESET")
	balls_thrown = 0

	for x in $Pins.get_children():
		x.sleeping = true

	if total_points >= 60:
		Global.tickets[1] = 1 #So the player can't farm points
		if Global.tickets[1] == 0:
			get_parent().add_tickets(10)

	print("Total Score: ", total_points)
	if total_points >= challenge1: #Remove Guard Rails
		print ("Challange 1")
	else:
		pass
	if total_points >= challenge2: #Sloped playing field
		print ("Challange 2")
	else:
		pass
	if total_points >= challenge3: # Pins move (If they can cause they are sketchy as hell)
		print ("Challange 3")
	else:
		pass
	if total_points >= challenge4: #Heavier Pin (Hard to go down on a non - direct hit
		pass
	else:
		pass


func count_pins():
	for x in $Pins.get_children():
		x.sleeping = true
		var y = x.get_children()
		var z = y[2]
		if z.global_transform.origin.y <= 0.6:
			pins_down += 1

	if current_round > 9:
		current_round = 0

	var current_square = squares[current_round]
	var a = current_square.get_children()

	if balls_thrown == 1: #After First Throw
		var b = a[0]
		b.text = str(pins_down)
		pins_down_round_one = pins_down
		if pins_down == 10: #Strike
			current_round += 1
			var c = a[1]
			c.text = str("X")
			a[2].text = str("10")
			reset_pins()
		total_points += pins_down
		pins_down = 0
	elif balls_thrown == 2: #After Second Throw
		var b = a[1]
		b.text = str(pins_down - pins_down_round_one)
		var c = a[2]
		c.text = str(pins_down)
		current_round += 1
		total_points += pins_down - pins_down_round_one
		pins_down = 0

	$Viewport/Total.text = str(total_points)



func respawn_ball(ball):
	ball.translation = Vector3(1.221,0.929,0.391)
	count_pins()

	if balls_thrown == 2:
		$"Pin Respawn Delay".start()


func _on_BallDetector_body_entered(body):
	if body.name == "Ball":
		balls_thrown += 1

