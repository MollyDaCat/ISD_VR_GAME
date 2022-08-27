extends Spatial


onready var anim = $Enemy/AnimationPlayer
onready var timer = $"Enemy Movement Timer"


var animation_order = ["Move_Forward","Enter_Hallway_1","Peek_Hallway_1","Enter_Hallway_2","Peek_Hallway_2"]
var animation_number = 0
var animation_played = false
#Animation Spots 0 -> Move foward at the start, 1 -> Enter the first hallway

var time_left = 90

func _ready():
	timer.wait_time = rand_range(6.25,12.75)
	timer.start()

#Player activates the flash light
func shine_light(toggled): 

	if toggled == "On":
		update_location()
	elif toggled == "Off":
		resume_timer()



func update_location(): #Play Animation When First Seen
	print(animation_number)
	timer.paused = true
	if animation_number == -1:
		return

	if not animation_number >= 5 and animation_played == false:
		anim.play(animation_order[animation_number])
		animation_played = true
		$Enemy/Run.play()



func resume_timer():
	timer.paused = false



func _on_Enemy_Movement_Timer_timeout():
	animation_played = false
	timer.wait_time = rand_range(6.25,12.75)
	timer.start()
	animation_number += 1


func _on_Time_Limit_Timer_timeout(): #Update Timer
	time_left -= 1
	$Viewport/Label.text = str(time_left)
