extends Spatial


var target = preload("res://_MyContent/Scenes/Duck_Shooting_Target.tscn")
var target_chance = 80
var next_target_path = 1

func _ready():
	pass # Replace with function body.


func spawn_target():

	var target_spawn = target.instance()
	target_spawn.go_on_path = next_target_path

	var x = randi()%100
	if x <= target_chance:
		target_spawn.mesh = "Target"

	if next_target_path == 1:
		next_target_path = 2
	else:
		next_target_path = 1

	add_child(target_spawn)


func _on_Target_Spawning_timeout():
	spawn_target()

