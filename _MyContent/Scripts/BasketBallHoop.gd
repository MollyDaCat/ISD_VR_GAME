extends Spatial




var stage = 1


func _ready():
	pass

func Score(body):
	if body.name == "Ball":
		stage += 1
		print (stage)
		if stage == 2:
			$AnimationPlayer.play("Raise Hoop")
		elif stage == 3 or stage == 5:
			$AnimationPlayer.play("Hoop Float")
			$Hoop/Pole.hide()
		elif stage ==4:
			$AnimationPlayer.stop()
			$Cannons.show()
			$Timer.start()
			#fire_snake()
		elif stage == 6:
			$AnimationPlayer.stop()
			$Timer.stop()

#Snake Funtionality - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

var base_speed = 75
var speed 

onready var snake = $Cannons/Path/PathFollow
onready var mesh = $Cannons/Path/PathFollow/MeshInstance
var snake_in_air = "No"
var going = "Right"

var path_max = 0.72
var path_min = 0.23

func fire_snake():
	mesh.show()


	if going == "Right":
		snake.unit_offset = path_min #0.19
		speed = -base_speed
		mesh.rotation_degrees.z = -60
		mesh.rotation_degrees.y = 180

	else:
		snake.unit_offset = path_max
		speed = base_speed
		mesh.rotation_degrees.z = 60
		mesh.rotation_degrees.y = -180
	snake_in_air = "Yes"

func _process(delta):
	if snake_in_air == "Yes":
		snake.offset += speed * delta
#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




#Stop from looping and Mesh Rotation - - - - - - - - - - - - - - - - - - - - - - - - 
		if going == "Right":
			mesh.rotation_degrees.z -= 1.5
			if snake.unit_offset < path_max and snake.unit_offset >= path_min:
				snake_in_air = "No"
				#mesh.hide()

		elif going == "Left":
			mesh.rotation_degrees.z += 1.5
			if snake.unit_offset >= path_min and snake.unit_offset < path_max:
				snake_in_air = "No"
				#mesh.hide()
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



func _on_Timer_timeout():
	fire_snake()
	if going == "Left":
		going = "Right"
	else:
		going = "Left"


func _on_Snake_body_entered(body): #Knockback The ball when colliding with the snake
	if body.name == "Ball":
		body.bullet_hit(30, $Cannons/Path/PathFollow.global_transform)

func respawn_ball(): #Replace With system to spawn in new ball
	$Ball.translation = Vector3(0,0,30)


func _on_Respawn_body_entered(body):
	if body.name == "Player":
		respawn_ball()
#		body.locked_in_place = true
#		body.translation = $Respawn/Spatial.get_global_transform().origin


