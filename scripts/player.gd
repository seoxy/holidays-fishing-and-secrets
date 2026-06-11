extends CharacterBody2D

#region Variables. ---------------------------------------------------------------------------------
const SPEED = 100

var movement_vector :Vector2 = Vector2(0, 0)
var orientation_vector :Vector2 = Vector2(0, 0)

var trying_to_fish :bool = false

#endregion

#region Raccourcis de noeuds. ----------------------------------------------------------------------
@onready var animation_sprite: AnimatedSprite2D = %AnimatedSprite2D
@onready var audio_foot_step :AudioStreamPlayer = $%AudioFootStep
@onready var audio_casting_rod: AudioStreamPlayer = %AudioCastingRod

#endregion


# ########################################## Fonctions. ##########################################

#region Fonctions déclencheuses. -------------------------------------------------------------------

func _physics_process(_delta: float) -> void:
	if Gsignals.player_is_fishing == false :
		_player_movement()
	_player_animation()
	_player_sounds()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("fishing") :
		_player_is_trying_to_fish()
		_start_fishing()
#endregion

#region Fonctions déclenchées. ---------------------------------------------------------------------
func _player_movement() :
	# Modification de movement_vector par l'appui des quatre touches de déplacement.
	movement_vector = Vector2(Input.get_axis(&"ui_left", &"ui_right"), Input.get_axis(&"ui_up", &"ui_down") )
	movement_vector = movement_vector.normalized()
	# Assigne le bon sens à l'orientation_vector.
	if movement_vector != Vector2(0, 0) :
		orientation_vector = movement_vector

	if trying_to_fish :
		velocity = Vector2(0, 0)
		return
	else :
		# Applique bien le mouvement au joueur si l'animation de pêche ne joue pas.
		velocity = movement_vector * SPEED
	move_and_slide()

# Sert à gérer les animations de déplacement du joueur.
func _player_animation() :
	var player_orientation :String
	if orientation_vector.x >= 0 : player_orientation = "side" ; animation_sprite.flip_h = false
	if orientation_vector.x <= 0 : player_orientation = "side" ; animation_sprite.flip_h  = true
	if orientation_vector.y == 1 : player_orientation = "front"
	if orientation_vector.y == -1 : player_orientation = "back"
	
	# Animation de déplacement.
	if movement_vector != Vector2.ZERO and not trying_to_fish :
		animation_sprite.play("walk_" + player_orientation)
	# Animation de pêche.
	elif trying_to_fish :
		animation_sprite.play("fishing_" + player_orientation)
	# Animation idle.
	else :
		animation_sprite.play("idle_" + player_orientation)

# Gère le bruit de pas du joueur.
func _player_sounds() :
	if movement_vector != Vector2.ZERO and not trying_to_fish :
		if audio_foot_step.is_playing() : pass
		else :
			audio_foot_step.pitch_scale = randf_range(0.8, 1.2)
			audio_foot_step.play()

# Passe à vrai la variable trying_to_fish pendant 0.8 secondes.
func _player_is_trying_to_fish() :
	trying_to_fish = true
	audio_casting_rod.play()
	await get_tree().create_timer(0.8).timeout
	trying_to_fish = false

# Gère l'affichage de la scène de pêche.
func _start_fishing() :
	if Gsignals.player_is_fishing == false :
		Gsignals.player_is_fishing = true
		var scene_de_peche :CanvasLayer = preload("res://scenes/peche.tscn").instantiate()
		get_parent().add_child(scene_de_peche)
#endregion

#region Autre. -------------------------------------------------------------------------------------

# Sert d'identification pour global.
func player() :
	pass
#endregion










###
