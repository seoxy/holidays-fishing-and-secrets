extends Node

var audio_musique_piano :AudioStreamPlayer = preload("res://scenes/scenes_audio/audio_musique_piano.tscn").instantiate()

func _ready() -> void:
	add_child(audio_musique_piano)
