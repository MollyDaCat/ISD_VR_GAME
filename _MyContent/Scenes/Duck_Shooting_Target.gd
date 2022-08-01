extends KinematicBody


export var go_on_path = 1
var speed = 1
var mesh = "Duck"

# Called when the node enters the scene tree for the first time.
func _ready():

	$AnimationPlayer.playback_speed = speed

	if mesh == "Target":
		$Duck.hide()
		$Target.show()

	if go_on_path == 1:
		$AnimationPlayer.play("Path 1")
	else:
		$AnimationPlayer.play("Path 2")




func _on_Timer_timeout():
	queue_free()

func damage(_x,_y):
	if mesh == "Duck":
		print("Shoot Duck")
	elif mesh == "Target":
		print ("Shoot Target")
	queue_free()
