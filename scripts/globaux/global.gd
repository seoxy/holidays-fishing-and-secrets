extends Node

var ath := preload("res://scenes/ATH.tscn").instantiate()

var current_scene := "world"
var transition_scene := false
var game_first_loading := true

var player_start_pos := Vector2(300, 130)
var player_exit_pos := Vector2(240, 302)

##############################################################

func _ready() -> void:
	add_child(ath)


func finish_change_scene() :
	if transition_scene == true :
		transition_scene = false
		if current_scene == "world" :
			current_scene = "camp"
		else :
			current_scene = "world"
