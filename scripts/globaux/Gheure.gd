extends Node

var heures :int = 5
var minutes :int = 40
var duration_10_minutes :int = 5 # Combien de secondes durent 10 minutes.

#region Variables
var meteo :String = "Dégagé"

var rained_today :bool = false
signal stop_rain
#endregion

#region Raccourcis noeuds et scènes.
var timer_10_minutes :Timer
var canvas_nuit :CanvasModulate
var audio_owl :AudioStreamPlayer = preload("res://scenes/scenes_audio/audio_owl.tscn").instantiate()
var audio_birds :AudioStreamPlayer = preload("res://scenes/scenes_audio/audio_birds.tscn").instantiate()
var scene_rain :PackedScene = preload("res://scenes/rain.tscn")
#endregion

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_reglage_et_lancement_timer(duration_10_minutes)

	canvas_nuit = CanvasModulate.new()
	add_child(canvas_nuit)
	add_child(audio_owl)
	add_child(audio_birds)

# Fonction qui se lance quand le timer envoie son signal.
# Change les variables de temps.
func _on_timer_10_minutes_timeout() :
	# Avant 23H.
	if heures < 23 :
		if minutes < 50 :
			minutes += 10
		else :
			heures += 1
			minutes = 0
			_rain()
			if heures > 19 and heures <= 5 : _bruit_de_chouette_aléatoire()
			if heures == 6 : add_child(audio_birds)
			if heures == 19 : remove_child(audio_birds)
	# Quand on dépasse 23H.
	else :
		if minutes < 50 :
			minutes += 10
		else :
			heures = 0
			minutes = 0
	
	if heures == 18 and minutes == 30 :
		_filtre_entrée_nuit()
	if heures == 6 and minutes == 30 :
		_filtre_sortie_nuit()

# Instantie le timer et l'ajoute à la scène.
func _reglage_et_lancement_timer(duree:float) :
	timer_10_minutes = Timer.new()
	add_child(timer_10_minutes)
	timer_10_minutes.autostart = true
	timer_10_minutes.wait_time = duree
	# Connecte son timeout avec une fonction.
	timer_10_minutes.timeout.connect(_on_timer_10_minutes_timeout)
	# Lance le timer.
	timer_10_minutes.start()


#region Nuit : 18h10 à 6h10.
# Filtre progressif changeant la couleur du monde pour le rendre nocturne.
func _filtre_entrée_nuit() :
	var tween :Tween = create_tween().set_trans(Tween.TRANS_SINE)
	var tween_time := 15.0
	tween.tween_property(canvas_nuit, "color", Color(0.282, 0.42, 0.945, 1.0), tween_time)

# Retire le filtre de nuit.
func _filtre_sortie_nuit() :
	var tween :Tween = create_tween().set_trans(Tween.TRANS_SINE)
	var tween_time := 15.0
	tween.tween_property(canvas_nuit, "color", Color(1.0, 1.0, 1.0, 1.0), tween_time)

func _bruit_de_chouette_aléatoire() :
	# Une chance sur trois pour qu'elle chante chaque heure.
	if randf_range(0.0, 1.0) > 0.66 :
		if audio_owl.is_playing() :
			pass
		else :
			audio_owl.play()
#endregion

# Lancée une fois par heure.
func _rain() :
	# Peut lancer la pluie s'il ne pleut pas.
	if rained_today == false :
		if randf_range(0.0, 1.0) < 0.2 :
			var node_rain :Node = scene_rain.instantiate()
			add_child(node_rain)
			rained_today = true
			meteo = "Pluie"
	elif rained_today == true :
		# Signal écouté dans le script de rain. Supprime le noeud.
		stop_rain.emit()
		meteo = "Dégagé"









###
