extends RigidBody


export var go_on_path = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	if go_on_path == 1:
		$AnimationPlayer.play("Path 1")
	else:
		$AnimationPlayer.play("Path 2")


