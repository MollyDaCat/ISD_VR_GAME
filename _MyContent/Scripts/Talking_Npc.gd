extends Spatial


export var line1 = "Null"
export var line2 = "Null"
export var line3 = "Null"
export var line4 = "Null"

var lines 
var line_number = 0

onready var label = $"Text Bubble/Viewport/Label"


func _ready():
	lines = [line1,line2,line3,line4]

func _on_Area_body_entered(body):
	if body.name == "Player":
		line_number = 0
		$"Text Bubble".show()
		label.text = lines[0]
		$Timer.start()



func _on_Timer_timeout():
	line_number += 1
	if line_number == 4:
		$Timer.stop()
		$"Text Bubble".hide()
		return

	if lines[line_number] != "Null":
		label.text = lines[line_number]
	else:
		$"Text Bubble".hide()
