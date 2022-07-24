extends KinematicBody


export var button_type = ""
export var number = 0
export var button_mat = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	var mat = $Button.get_surface_material(0)
	var mat2 = mat.duplicate()
	mat2.albedo_texture = load(button_mat)
	$Button.set_surface_material(0,mat2)


func bullet_hit(_damage, _bullet_global_trans):
	if get_parent().get_parent().ready_to_press == "Yes":
		$AnimationPlayer.play("Press_Button")
		get_parent().get_parent().press_button(button_type,number)

func reset():
	$AnimationPlayer.play("RESET")
