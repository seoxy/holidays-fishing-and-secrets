extends Node

var ath := preload("res://scenes/ATH.tscn").instantiate()

##############################################################

func _ready() -> void:
	add_child(ath)
