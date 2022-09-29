extends Node

onready var music = AudioStreamPlayer.new()

var music_tracks = {
	"title_screen":"res://Sounds/DeeperAndDeeper6.wav",
	"main":"res://Sounds/DeeperAndDeeper1.wav",
}

var sound_effects = {
	"jump":"res://Sounds/Jump 1 (1).wav",
	"dead":"res://Sounds/Boss hit 1.wav",
	"land":"res://Sounds/Hit damage 1.wav",
	"roll":"res://Sounds/Suck 2.wav",
	"attack":"res://Sounds/Blow 2.wav",
}

var music_db = 1
var sound_db = 1
func change_track(track):
	music.stream = load(music_tracks[track])
	music.play()
	
func change_music_db(val):
	music_db = linear2db(val)

func change_sound_db(val):
	sound_db = linear2db(val)

func _ready():
	music.stream = load(music_tracks["title_screen"])
	add_child(music)
	music.play()

func play_sound_effects(Sounds):
	var sound = AudioStreamPlayer.new()
	sound.stream = load(sound_effects[Sounds])
	add_child(sound)
	sound.play()
	yield(sound,"finished")
	sound.queue_free()

