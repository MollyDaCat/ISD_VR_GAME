extends KinematicBody


export var go_on_path = 1
var speed = 1
var mesh = "Duck"

var switch = "No"

# Called when the node enters the scene tree for the first time.
func _ready():

	$AnimationPlayer.playback_speed = speed

	if mesh == "Target":
		$Duck.hide()
		$Target.show()
		if switch == "Yes":
			print("Spawn Switch Target")
			$Target.set_surface_material(1,preload("res://_MyContent/Materials/Neon_Red.tres"))
			$Transform.start()

	elif mesh == "Duck" and switch == "Yes":
		print("Spawn Switch Duck")
		$Duck.set_surface_material(0,preload("res://_MyContent/Materials/Red.tres"))
		$Transform.start()

	if go_on_path == 1:
		$AnimationPlayer.play("Path 1")
	else:
		$AnimationPlayer.play("Path 2")




func _on_Timer_timeout(): #Reaches the end
	queue_free()

func damage(_x,_y):
	if mesh == "Duck":
		print("Shoot Duck")
	elif mesh == "Target":
		print ("Shoot Target")
	$AnimationPlayer.play("Shot")
	$Shot_Delay.start()


func _on_Transform_timeout():
	if mesh == "Duck":
		mesh = "Target"
		$Duck.hide()
		$Target.show()
	elif mesh == "Target":
		mesh = "Duck"
		$Target.hide()
		$Duck.show()


func _on_Shot_Delay_timeout():
	queue_free()
