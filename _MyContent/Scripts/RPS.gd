extends Spatial


var ready_to_press = "Yes"

var player_score = 0
var enemy_score = 0

var choices = ["Rock","Paper","Scissors"]
var player_choice 
var enemy_choice

onready var player_point_circles = $"Viewport/Point_Circles/Player Points".get_children()
var current_player_point_circle = 0

onready var enemy_point_circles = $"Viewport/Point_Circles/Enemy Points".get_children()
var current_enemy_point_circle = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	reset()

func reset():
	$Viewport/Enemy_Choice.frame = 0
	$Viewport/Player_Choice.frame = 0
	ready_to_press = "Yes"
	for x in $Buttons.get_children():
		x.reset()

func press_button(Choice,Number):
	ready_to_press = "No"
	player_choice  = Choice
	enemy_pick()
	$Viewport/Player_Choice.frame = Number

func enemy_pick():
	var x = randi()%3
	enemy_choice = choices[x]
	$Viewport/Enemy_Choice.frame = x + 1
	$"Match End Timer".start()
	find_winner()

func enemy_cheat():
	pass


func find_winner():
	if player_choice == "Rock":
		if enemy_choice == "Rock":
			score_point("Draw")
		if enemy_choice == "Paper":
			score_point("Enemy")
		if enemy_choice == "Scissors":
			score_point("Player")

	elif player_choice == "Paper":
		if enemy_choice == "Rock":
			score_point("Player")
		if enemy_choice == "Paper":
			score_point("Draw")
		if enemy_choice == "Scissors":
			score_point("Enemy")

	elif player_choice == "Scissors":
		if enemy_choice == "Rock":
			score_point("Enemy")
		if enemy_choice == "Paper":
			score_point("Player")
		if enemy_choice == "Scissors":
			score_point("Draw")

func score_point(winner):
	print (winner)
	if winner == "Draw":
		return
	elif winner == "Player":
		if player_score != 3:
			player_point_circles[current_player_point_circle].frame = 1
			current_player_point_circle += 1
			player_score += 1
		else:
			$"Viewport/Point_Circles/Final Point".frame = 1
			finish_game("Win")

	elif winner == "Enemy":
		if enemy_score != 3:
			enemy_point_circles[current_enemy_point_circle].frame = 2
			current_enemy_point_circle += 1
			enemy_score += 1
		else:
			$"Viewport/Point_Circles/Final Point".frame = 2
			finish_game("Lose")
	return

func _on_Match_End_Timer_timeout():
	reset()

func finish_game(win):
	pass
